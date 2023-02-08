
// Install ESP32Encoder in the LibraryManager
#include <ESP32Encoder.h>

#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <ArduinoOTA.h>

#include "wavelength.h"
#include "leds.h"
#include "visualizations.h"


#define PIN_BUTTON         14
#define PIN_ENCODER_BUTTON 25
#define PIN_ENCODER_A      26
#define PIN_ENCODER_B      27

#define ENCODER_MAX   25

#define PIN_RELAY 15
#define PIN_OUT1  21
#define PIN_OUT2  22
#define PIN_OUT3  23
#define NR_OF_LEDS   900

#define MSGEQ_BAND_NO 7
#define MSGEQ_STROBE_PIN    5
#define MSGEQ_RESET_PIN    18
#define MSGEQ_ANALOG_PIN  34 

// This are reads from MSGEQ7. Please notice that they are after 2x voltage devider.
#define MAX_MSGEQ_VOLTAGE 2900
// If the normalized (1-100) signal is below this value, we conisider it 0. 
#define MSGEQ_NOISE_CUTOFF 6

//========================== Wifi ===========================

WebServer server(80);

const char* ssid     = "***REMOVED***";
const char* password = "Kr3dyt0waD3lph1";

void handleColor();
void handleBrightness();
void handlePower();
void handleMode();

void handleRoot() {
  String temp=R""""(
<html>
  <head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">    
 <title>Choinka</title>  
<script>
  function setColor() {
    var xhttp = new XMLHttpRequest();
    var col=document.getElementById('colorpicker').value.replace('#','0x');   
    xhttp.open('GET', '/color?color='+col, true);   
    xhttp.send(); }
  </script>
</head>    
<body>
  <h1>Tu choinka</h1>
  <form>
    <label for="colorpicker">Kolorek:</label>
    <input type='color' id='colorpicker' value='#0000ff' oninput='setColor()'>
    <p>power: <a href="/power?set=on">on</a> <a href="/power?set=off">off</a></p>
    <p>mode: <a href="/mode?set=0">lampki</a>
             <a href="/mode?set=1">snakes</a>
             <a href="/mode?set=2">strobo</a>
             <a href="/mode?set=3">rainbow-strobo</a>
             <a href="/mode?set=4">red</a>
             <a href="/mode?set=5">disco</a>
             <a href="/mode?set=6">rainbow</a>
             <a href="/mode?set=7">pulse</a> 
             <a href="/mode?set=8">snow</a>      
             <a href="/mode?set=9">snow-color</a>         
             <a href="/mode?set=10">google</a>
             <a href="/mode?set=11">ukraina</a>  
             <a href="/mode?set=12">snow</a>   
    </p>
    </form>
</body>
</html>)"""";

  server.send(200, "text/html", temp);
}

void handleNotFound() {
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";

  for (uint8_t i = 0; i < server.args(); i++) {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }

  server.send(404, "text/plain", message);
}

bool setupWifi() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  Serial.println("Wifi begin called...");

    // Wait for connection
  for (int i=0; (i< 30)&&(WiFi.status() != WL_CONNECTED); ++i) {
    delay(500);
    Serial.print(".");
  }
  if (WiFi.status() != WL_CONNECTED) {
    Serial.print("Wifi connection FAILED !!!");
    return false;
  }
  Serial.print("Wifi connected");
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  server.on("/", handleRoot);
  server.on("/color", handleColor);
  server.on("/power", handlePower);
  server.on("/mode", handleMode);
  server.on("/brightness", handleBrightness);
  server.onNotFound(handleNotFound);
  server.begin();
  Serial.println("HTTP server started");
  return true;
}

void setupOTA() {
  ArduinoOTA.setHostname("choinka");
  ArduinoOTA.setPort(3232);
  ArduinoOTA
    .onStart([]() {
      String type;
      if (ArduinoOTA.getCommand() == U_FLASH)
        type = "sketch";
      else // U_SPIFFS
        type = "filesystem";

      // NOTE: if updating SPIFFS this would be the place to unmount SPIFFS using SPIFFS.end()
      Serial.println("Start updating " + type);
    })
    .onEnd([]() {
      Serial.println("\nEnd");
    })
    .onProgress([](unsigned int progress, unsigned int total) {
      Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
    })
    .onError([](ota_error_t error) {
      Serial.printf("Error[%u]: ", error);
      if (error == OTA_AUTH_ERROR) Serial.println("Auth Failed");
      else if (error == OTA_BEGIN_ERROR) Serial.println("Begin Failed");
      else if (error == OTA_CONNECT_ERROR) Serial.println("Connect Failed");
      else if (error == OTA_RECEIVE_ERROR) Serial.println("Receive Failed");
      else if (error == OTA_END_ERROR) Serial.println("End Failed");
    });

  ArduinoOTA.begin();
}

// =========================  MSGEQ7       =================== 

// We normalize band-values such that they contain values from 0-100. 
// We consider values <5 as noise and normalize to 0.
int bandValues[MSGEQ_BAND_NO];
 
void setupMSGEQ7()
{
  pinMode(MSGEQ_RESET_PIN, OUTPUT);
  pinMode(MSGEQ_STROBE_PIN, OUTPUT);
 
  // RESET
  digitalWrite(MSGEQ_RESET_PIN, LOW);
  digitalWrite(MSGEQ_STROBE_PIN, HIGH);
}

void printBands() {
  for (int bandNo = 0; bandNo < MSGEQ_BAND_NO; bandNo++) {
    Serial.printf("%4d ", bandValues[bandNo]);
  }
  Serial.println();
}

// This implementation takes ~210usec due to delay between bands.
void readMSGEQ7()
{
  digitalWrite(MSGEQ_RESET_PIN, HIGH);
  digitalWrite(MSGEQ_RESET_PIN, LOW);
 
  for (int bandNo = 0; bandNo < MSGEQ_BAND_NO; bandNo++)
  {
    digitalWrite(MSGEQ_STROBE_PIN, LOW);
    delayMicroseconds(30);
    bandValues[bandNo] = (analogRead(MSGEQ_ANALOG_PIN) * 100) / 2800;
    if (bandValues[bandNo] <= MSGEQ_NOISE_CUTOFF) {
      bandValues[bandNo]=0;
    }
    digitalWrite(MSGEQ_STROBE_PIN, HIGH);
  }
  printBands();
}


// ==============================================================

struct led_channel_t *leds1 = NULL;
struct led_channel_t *leds2 = NULL;
struct led_channel_t *leds3 = NULL; 

ESP32Encoder encoder;

void setupButtons() {
  pinMode(PIN_BUTTON, INPUT_PULLUP);
}

void setupEncoder() {
  ESP32Encoder::useInternalWeakPullResistors=UP;
  encoder.attachSingleEdge(PIN_ENCODER_A, PIN_ENCODER_B);
  encoder.setCount(ENCODER_MAX);

  pinMode(PIN_ENCODER_BUTTON, INPUT_PULLUP);
}

void setup() 
{
    Serial.begin(115200);

    pinMode(PIN_RELAY, OUTPUT);

    delay(1000);
    digitalWrite(PIN_RELAY, HIGH);   // turn the power to the strip

    leds1 = setupLedChannel(PIN_OUT1, NR_OF_LEDS);
    if (!leds1) {
      Serial.printf("Cannot initialize stipe1");
    }
    
    // leds2 = setupLedChannel(PIN_OUT2, 1);
    // if (!leds2) {
    //   Serial.printf("Cannot initialize stipe1");
    // }
    
    // leds3 = setupLedChannel(PIN_OUT3, 1);
    // if (!leds3) {
    //   Serial.printf("Cannot initialize stipe1");
    // }

    setupMSGEQ7();
    
    ledTestSequence();

    setupButtons();
    setupEncoder();

    setupWifi();
    setupOTA();

    MDNS.addService("http", "tcp", 80);
    Serial.println("MDNS responder started");
    
    Serial.printf("\n\nInit DONE");
}

void ledTestSequence() {

  uint32_t kolory[] = { 0xFF4500, /*0xFFD7000xDAA520,*/ 0xFF4500, /*0x32CD32*/ 0x006400, 0x808000, /*0x4682B4*/0x191970, 0x8B4513, 0x800000};
  for (int i=0; i<7; ++i) {
    drawColor(leds1, kolory[i]);
    delay(1000);
  }

  // for(int i=0; i < leds1->length; ++i) {
  //    prefix(leds1, i, RGB_RED);    
  //    delay(1);
  // }
  drawColor(leds1, RGB_RED);
  drawColor(leds2, RGB_RED);
  drawColor(leds3, RGB_RED);
  delay(500);
  drawColor(leds1, RGB_GREEN);
  drawColor(leds2, RGB_GREEN);
  drawColor(leds3, RGB_GREEN);
  delay(500);
  drawColor(leds1, RGB_BLUE);
  drawColor(leds2, RGB_GREEN);
  drawColor(leds3, RGB_RED);
  delay(500);
  drawColor(leds1, RGB_WHITE);
  drawColor(leds2, RGB_WHITE);
  drawColor(leds3, RGB_WHITE);
  delay(500);
  drawColor(leds1, RGB_BLACK);
  drawColor(leds2, RGB_BLACK);
  drawColor(leds3, RGB_BLACK);
}

bool checkButton1pressed() {
  static bool buttonPrev = false;
  boolean buttonPressed = digitalRead(PIN_BUTTON) == 0;
  if (!buttonPrev && buttonPressed) {
    buttonPrev = true;
    return true;
  }
  buttonPrev = buttonPressed;
  return false;
}

bool checkButtonEncPressed() {
  static bool buttonPrev = false;
  boolean buttonPressed = digitalRead(PIN_ENCODER_BUTTON) == 0;
  if (!buttonPrev && buttonPressed) {
    buttonPrev = true;
    return true;
  }
  buttonPrev = buttonPressed;
  return false;
}

int mode = 0;
int prev_ms;
float brightness = -1;

void readBrighnessFromEncoder() {
  if (brightness <= 0.0) {
    if (checkButtonEncPressed()) {
      encoder.setCount(ENCODER_MAX);
    }
    if (encoder.getCount() > ENCODER_MAX) {
      encoder.setCount(ENCODER_MAX);
    }
    if (encoder.getCount() < 0) {
      encoder.setCount(0);
    }
    // Exponential brightness works better. 1.22^25 ~=100.
    leds1->brightness = encoder.getCount() == 0 ? 0.0 : min(pow(1.22, encoder.getCount()-1), 100.0) / 100.0; 
  //  Serial.println("Encoder count = " + String((int32_t)encoder.getCount()) + " brighness:" + leds1->brightness);
  } else {
    leds1->brightness = brightness;
  }
}

//=========================

void handleColor() {
  setMode(100); // manual mode;
  String c=server.arg(0);
  server.send(200, "text/plain", "OK");
  drawColor(leds1,std::stoul(c.c_str(),nullptr,0));
}

void handleBrightness() {
  String c=server.arg(0);
  server.send(200, "text/plain", "OK");
  brightness = max(min(1.0,std::stoul(c.c_str(),nullptr)/100.0), 0.0);
}

void handleMode() {
  String c=server.arg(0);
  Serial.printf("Setting mode: %s \n", c);
  Serial.flush();
  server.send(200, "text/plain", "OK");
  setMode(std::stoul(c.c_str(),nullptr,0));
  Serial.printf("Setting mode: %s[DONE]\n", c);
  Serial.flush();
}

void handlePower() {
  String c=server.arg(0);

  if(c=="on") {
    digitalWrite(PIN_RELAY, HIGH); 
  }
  if(c=="off") {
    digitalWrite(PIN_RELAY, LOW); 
  }

  server.send(200, "text/plain", "OK");
}

//=========================

void setMode(int new_mode) {
  if (new_mode != mode) {
  //  drawColor(leds1, 0x000000);
    mode = new_mode;
    prev_ms=0;    
  }
}

void loop() {
  server.handleClient();
  ArduinoOTA.handle();
// //  for (int i=0; i<3000; ++i) {
     readBrighnessFromEncoder();
    
    if (checkButton1pressed()) {
      setMode((mode+1)%13);
      Serial.printf("Button1 pressed. Mode: %d\n", mode);
    }
  
    int time_ms = millis();    

   switch (mode) {
     case 0: 
       lampki(leds1, time_ms, prev_ms);

       delay(1);
       break;
     case 1: 
       rainbowSnakesDemo(leds1, time_ms);
       delay(10);
       break;
     case 2: 
       readMSGEQ7();
       stroboSimple(leds1, bandValues);  
       delay(10);
       break;
     case 3: 
       readMSGEQ7();
       rainbowSnakesStrobo(leds1, time_ms, bandValues);
       delay(10);
       break;
     case 4: 
       drawColor(leds1, RGB_RED);
       delay(100);
       break;
    //  case 6:
    //    oneByOne(leds1, time_ms, 1000);
    //    delay(100);
    //    break;
    //  case 8:
    //    blyskawica(leds1, time_ms);
    //    delay(10);
    //    break;
    //  case 7: 
    //    choinka(leds1, time_ms);
    //    delay(10);
    //    break;
     case 5: 
       grzesia(leds1, time_ms);
      //  drawColor(leds1, RGB_BLACK);
      //  drawColor(leds2, RGB_BLACK);
      //  drawColor(leds3, RGB_BLACK); 
       delay(1);
       break;
     case 6: 
       rainbow(leds1, time_ms);
      //  drawColor(leds1, RGB_BLACK);
      //  drawColor(leds2, RGB_BLACK);
      //  drawColor(leds3, RGB_BLACK); 
       break;

    case 7:
      pulses(leds1, time_ms, 0x00ff00);
      delay(1);
    //  case 10:
    //    choinkaBlyskawica(leds1, time_ms);
    //    delay(10);
      break;
     case 8:
      snow(leds1, time_ms, /*0xffffff*/ 0xfaebd7);
      delay(1);
      break;
    case 9: {
      uint32_t kolory[] = { 0xFF4500, /*0xFFD7000xDAA520,*/ 0xFF4500, /*0x32CD32*/ 0x006400, 0x808000, /*0x4682B4*/0x191970, 0x8B4513, 0x800000};
      snow(leds1, time_ms, kolory, 7);
      delay(1);
      break;
    }
    case 10: {
      uint32_t google[] = { 0x4285F4,0xDB4437, 0xF4B400, 0x4285F4, 0x0F9D58, 0xDB4437};
      brightness = 0.1;
      strips(leds1, time_ms, 50, google, 6);
      break;
    }
    case 11: {
      uint32_t ukraina[] = { 0x0057b7,0xffd700};
      brightness = 0.3;
      strips(leds1, time_ms, 100000000.0, ukraina, 2);
      break;
    }
    case 12: {
      snowIncremental(leds1, time_ms);
      break;
    }    
    //  case 10:
    //    choinkaBlyskawica(leds1, time_ms);
    //    delay(10);

   }
    prev_ms = time_ms;
//    Serial.printf("%d %d %d %d\n", digitalRead(PIN_BUTTON), digitalRead(PIN_ENCODER_BUTTON), digitalRead(PIN_ENCODER_A), digitalRead(PIN_ENCODER_B));
//  }
//  Serial.printf("Next", mode);
//  mode++;
//  prev_ms=0;
}
