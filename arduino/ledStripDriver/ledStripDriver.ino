#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "Arduino.h"

#include <search.h>

#include "esp32-hal.h"

#define PIN_RELAY 15
#define PIN_OUT1  21
#define PIN_OUT2  22
#define PIN_OUT3  23
#define NR_OF_LEDS   300
#define NR_OF_ALL_BITS 24*NR_OF_LEDS

#define MSGEQ_BAND_NO 7
#define MSGEQ_STROBE_PIN    5
#define MSGEQ_RESET_PIN    18
#define MSGEQ_ANALOG_PIN    4

//
// Note: This example uses Neopixel LED board, 32 LEDs chained one
//      after another, each RGB LED has its 24 bit value 
//      for color configuration (8b for each color)
//
//      Bits encoded as pulses as follows:
//
//      "0":
//         +-------+              +--
//         |       |              |
//         |       |              |
//         |       |              |
//      ---|       |--------------|
//         +       +              +
//         | 0.4us |   0.85 0us   |
//
//      "1":
//         +-------------+       +--
//         |             |       |
//         |             |       |
//         |             |       |
//         |             |       |
//      ---+             +-------+
//         |    0.8us    | 0.4us |

rmt_data_t led_data[NR_OF_ALL_BITS];

rmt_obj_t* rmt_send1 = NULL;   
rmt_obj_t* rmt_send2 = NULL;   
rmt_obj_t* rmt_send3 = NULL;   


// WS2812
//#define CYCLE_NS 1250
//#define T0H_NS 325
//#define T1H_NS 650
//#define RESET 50000
//#define TICK 25

// WS2815
#define CYCLE_NS 1250
#define T0H_NS 325
#define T1H_NS 650
#define RESET 600000
#define TICK 25


// =========================  MSGEQ7       =================== 

int bandValues[MSGEQ_BAND_NO];
 
void initMSGEQ7()
{
  pinMode(MSGEQ_RESET_PIN, OUTPUT);
  pinMode(MSGEQ_STROBE_PIN, OUTPUT);
 
  // RESET
  digitalWrite(MSGEQ_RESET_PIN, LOW);
  digitalWrite(MSGEQ_STROBE_PIN, HIGH);
}
 
void readMSGEQ7()
{
  digitalWrite(MSGEQ_RESET_PIN, HIGH);
  digitalWrite(MSGEQ_RESET_PIN, LOW);
 
  for (int bandNo = 0; bandNo < MSGEQ_BAND_NO; bandNo++)
  {
    digitalWrite(MSGEQ_STROBE_PIN, LOW);
    delayMicroseconds(30);
    bandValues[bandNo] = analogRead(MSGEQ_ANALOG_PIN);
    digitalWrite(MSGEQ_STROBE_PIN, HIGH);
  }
}

// ==============================================================

void setup() 
{
    Serial.begin(115200);

    pinMode(PIN_RELAY, OUTPUT);
    
    if ((rmt_send1 = rmtInit(PIN_OUT1, true, RMT_MEM_64)) == NULL)
    {
        Serial.println("init sender failed\n");
    }
    if ((rmt_send2 = rmtInit(PIN_OUT2, true, RMT_MEM_64)) == NULL)
    {
        Serial.println("init sender failed\n");
    }
    if ((rmt_send3 = rmtInit(PIN_OUT3, true, RMT_MEM_64)) == NULL)
    {
        Serial.println("init sender failed\n");
    }

    digitalWrite(PIN_RELAY, HIGH);   // turn the power to the strip

    initMSGEQ7();

//    pinMode(PIN_OUT3, OUTPUT);
//    pinMode(PIN_OUT1, OUTPUT);
//    for (int i=0; i < 100; ++i) {
//      Serial.println(i);
//      Serial.println("high...");
//      digitalWrite(PIN_OUT3, HIGH);
//      digitalWrite(PIN_OUT1, HIGH);
//      delay(3000);
//      Serial.println("low...");
//      digitalWrite(PIN_OUT3, LOW);
//      digitalWrite(PIN_OUT1, LOW);
//      delay(3000);
//    }

    {
      float realTick = rmtSetTick(rmt_send1, TICK); // 1250/25 = 50
      Serial.printf("real tick 1 set to: %fns\n", realTick);
    }

    {
      float realTick = rmtSetTick(rmt_send2, TICK); // 1250/25 = 50
      Serial.printf("real tick 2 set to: %fns\n", realTick);
    }
    {
      float realTick = rmtSetTick(rmt_send3, TICK); // 1250/25 = 50
      Serial.printf("real tick 3 set to: %fns\n", realTick);
    }
    
    delay(500);
    setLeds(rmt_send1, 0, &black);              
    delay(500);
    setLeds(rmt_send1, 0, &red);
    setLeds(rmt_send3, 0, &red);
    delay(500);
    setLeds(rmt_send1, 0, &green);
    setLeds(rmt_send3, 0, &green);
    delay(500);
    setLeds(rmt_send1, 0, &blue);
    setLeds(rmt_send3, 0, &blue);
    delay(500);
    setLeds(rmt_send1, 0, &white);
    setLeds(rmt_send2, 0, &white);
    setLeds(rmt_send3, 0, &white);
    delay(500);
    setLeds(rmt_send1, 0, &black);
    setLeds(rmt_send2, 0, &black);
    setLeds(rmt_send3, 0, &black);    
    Serial.printf("All white\n");
    delay(5000);
    Serial.printf("Init DONE");
//    setLeds(rmt_send1, 0, &black);
//    delay(1000);
}



const double Gamma = 0.80;
const double IntensityMax = 80;

/** Taken from Earl F. Glynn's web page:
* <a href="http://www.efg2.com/Lab/ScienceAndEngineering/Spectra.htm">Spectra Lab Report</a>
* */
uint32_t waveLengthToRGB(double Wavelength){
  double Red;
  double Green;
  double Blue;
  double factor;

  if((Wavelength >= 380) && (Wavelength<440)){
      Red = -(Wavelength - 440) / (440 - 380);
      Green = 0.0;
      Blue = 1.0;
  }else if((Wavelength >= 440) && (Wavelength<490)){
      Red = 0.0;
      Green = (Wavelength - 440) / (490 - 440);
      Blue = 1.0;
  }else if((Wavelength >= 490) && (Wavelength<510)){
      Red = 0.0;
      Green = 1.0;
      Blue = -(Wavelength - 510) / (510 - 490);
  }else if((Wavelength >= 510) && (Wavelength<580)){
      Red = (Wavelength - 510) / (580 - 510);
      Green = 1.0;
      Blue = 0.0;
  }else if((Wavelength >= 580) && (Wavelength<645)){
      Red = 1.0;
      Green = -(Wavelength - 645) / (645 - 580);
      Blue = 0.0;
  }else if((Wavelength >= 645) && (Wavelength<781)){
      Red = 1.0;
      Green = 0.0;
      Blue = 0.0;
  }else{
      Red = 0.0;
      Green = 0.0;
      Blue = 0.0;
  };
    // Let the intensity fall off near the vision limits

    if((Wavelength >= 380) && (Wavelength<420)){
        factor = 0.3 + 0.7*(Wavelength - 380) / (420 - 380);
    }else if((Wavelength >= 420) && (Wavelength<701)){
        factor = 1.0;
    }else if((Wavelength >= 701) && (Wavelength<781)){
        factor = 0.3 + 0.7*(780 - Wavelength) / (780 - 700);
    }else{
        factor = 0.0;
    };

    uint32_t red =   Red==0.0 ? 0 : (uint8_t) round(IntensityMax * pow(Red * factor, Gamma));
    uint32_t green = Green==0.0 ? 0 : (uint8_t) round(IntensityMax * pow(Green * factor, Gamma));
    uint32_t blue =  Blue==0.0 ? 0 : (uint8_t) round(IntensityMax * pow(Blue * factor, Gamma));


    uint32_t rgb = ((uint32_t)red<<16) + ((uint32_t)green<<8) + ((uint32_t)blue);
    return rgb;
}


uint32_t runningRainbow(uint32_t t) {
  return waveLengthToRGB(380+(t%(780-380)));
}


uint32_t runningRainbow(uint32_t led, uint32_t t) {
  return runningRainbow(t*3+led);
}

uint32_t narodowe(uint32_t led, uint32_t t_ms) {
  if ( ((t_ms/4+led) / 25)%2 == 0) {
     return 0xff0000;
   } else {
     return 0xffffff;
   }
}

uint32_t eu(uint32_t led, uint32_t t_ms) {
  uint8_t segment = ((t_ms/5+led) / 10)%12;
  
  if ( segment % 3 == 0) {
     return 0xffcc00;
   } else {
     return 0x000099;
   }
}

uint32_t red(uint32_t led, uint32_t t_ms) {
  return 0xff0000;
}

uint32_t black(uint32_t led, uint32_t t_ms) {
  return 0x000000;
}

uint32_t green(uint32_t led, uint32_t t_ms) {
  return 0x00ff00;
}

uint32_t blue(uint32_t led, uint32_t t_ms) {
  return 0x0000ff;
}

uint32_t white(uint32_t led, uint32_t t_ms) {
  return 0xffffff;
}


void drawMap(rmt_obj_t* rmt_send, uint32_t rgbs[]) {
  uint32_t i = 0;
  for (int32_t led=NR_OF_LEDS-1; led>=0; led--) {
    uint32_t rgb = rgbs[led];
    uint8_t  color[3];    

    color[0] = (rgb >> 8) % 256;   // Green
    color[1] = rgb >> 16;         // red
    color[2] = rgb % 256;         // BLUE
    
    for (uint8_t col=0; col<3; col++ ) {
      for (uint8_t bit=0; bit<8; bit++){
          if ( ((color[col])%256 & (1<<(7-bit)))) {
              led_data[i].level0 = 1;
              led_data[i].duration0 = (T1H_NS / TICK);
              led_data[i].level1 = 0;
              led_data[i].duration1 = (CYCLE_NS - T1H_NS) / TICK;
          } else {
              led_data[i].level0 = 1;
              led_data[i].duration0 = (T0H_NS / TICK);
              led_data[i].level1 = 0;
              led_data[i].duration1 = (CYCLE_NS - T0H_NS) / TICK;
          } 
          i++;               
        }
      }
  }
  led_data[i-1].duration1 += RESET / TICK;

  // Send the data
  rmtWrite(rmt_send, led_data, i);
  delay(round((i / 1000.0) * (CYCLE_NS / 1000.0)) + 5);   
}



void setLeds(rmt_obj_t* rmt_send, uint32_t t_ms, uint32_t (*funcp)(uint32_t, uint32_t)) {
  uint32_t rgbs[NR_OF_LEDS];
  for (int32_t led=NR_OF_LEDS-1; led>=0; led--) {
    rgbs[led] = funcp(led, t_ms);
  }
  drawMap(rmt_send, rgbs);
}

void sequence(rmt_obj_t* rmt_send, uint32_t cycles_ms, uint32_t (*funcp)(uint32_t, uint32_t)) {
  for (uint32_t t=0; t<cycles_ms; t++) {
    if(t%1000 == 0) { Serial.printf("%d %d\n",NR_OF_ALL_BITS, t); }
    setLeds(rmt_send, t, funcp);
  }
}

uint32_t losowyKolorSwiateczny() {
  uint32_t kolory[] = { 0xff0000, 0x00ff00, 0x0000ff, 0xffffff, 0xffa500};
  return kolory[rand()%5];
}

uint32_t lampki(uint32_t led, uint32_t t_ms) {
// Serial.printf("lampki: %d %d\n", led, t_ms);
  static uint32_t strip[NR_OF_LEDS];
  
  if (t_ms == 0) {
    for (int i = 0; i < NR_OF_LEDS; ++i) {
      if (rand()%5 == 0) {
        strip[i] = losowyKolorSwiateczny();  
      } else {
        strip[i] = 0x000000;
      }
    }
  }

  if(led == 0) {
    // Turn off random;
    while(true) {
      uint32_t l = rand()%NR_OF_LEDS;
      if (strip[l] != 0x000000) {
        strip[l] = 0x000000;  
        break; 
      }
    }

    // Turn on random;
    while(true) {
      uint32_t l = rand()%NR_OF_LEDS;
      if (strip[l] == 0x000000) {
        strip[l] = losowyKolorSwiateczny();  
        break; 
      }
    }
    delay(500);
  }
  return strip[led];
}

uint32_t rainbowSnakes(uint32_t led, uint32_t t_ms) {
//   Serial.printf("rainbowSnakes: %d %d\n", led, t_ms);

  static uint32_t strip[NR_OF_LEDS];

  int32_t snake1_speed = 4;
  int32_t snake2_speed = -2;
  int32_t snake3_speed = 1;
  uint32_t snake1_length=50;
  uint32_t snake2_length=80;
  uint32_t snake3_length=140;

  
  if (led == 0) {
    for (int i = 0; i < NR_OF_LEDS; ++i) {
      strip[i] = 0x000000;
    }

    for (uint32_t i = 0; i < snake1_length; i++) {
      strip[(snake1_speed * t_ms + i) % NR_OF_LEDS ] = waveLengthToRGB(380+(400 * i / (snake1_length-1) ));
    }

    for (uint32_t i = 0; i < snake2_length; i++) {
      strip[(snake2_speed * t_ms + i) % NR_OF_LEDS ] += waveLengthToRGB(380+(400 * i / (snake2_length-1) ));
    }

     for (uint32_t i = 0; i < snake3_length; i++) {
      strip[(snake3_speed * t_ms + i) % NR_OF_LEDS ] += waveLengthToRGB(380+(400 * i / (snake3_length-1) ));
    }
  }
  return strip[led];
}


uint32_t bands(uint32_t led, uint32_t t_ms) {
//   Serial.printf("rainbowSnakes: %d %d\n", led, t_ms);

  static uint32_t strip[NR_OF_LEDS];

  int32_t snake1_speed = 4;
  int32_t snake2_speed = -2;
  int32_t snake3_speed = 1;
  uint32_t snake1_length=50;
  uint32_t snake2_length=80;
  uint32_t snake3_length=140;

  
  if (led == 0) {
    for (int i = 0; i < NR_OF_LEDS; ++i) {
      strip[i] = 0x000000;
    }

    for (uint32_t i = 0; i < snake1_length; i++) {
      strip[(snake1_speed * t_ms + i) % NR_OF_LEDS ] = waveLengthToRGB(380+(400 * i / (snake1_length-1) ));
    }

    for (uint32_t i = 0; i < snake2_length; i++) {
      strip[(snake2_speed * t_ms + i) % NR_OF_LEDS ] += waveLengthToRGB(380+(400 * i / (snake2_length-1) ));
    }

     for (uint32_t i = 0; i < snake3_length; i++) {
      strip[(snake3_speed * t_ms + i) % NR_OF_LEDS ] += waveLengthToRGB(380+(400 * i / (snake3_length-1) ));
    }
  }
  return strip[led];
}


void loop() 
{
  // pobieramy amplitudy
  readMSGEQ7();

  uint32_t rgbs[NR_OF_LEDS];
  for (int32_t led=NR_OF_LEDS-1; led>=0; led--) {
    rgbs[led] = 0;
  }
 
  // wyswietlamy kolejne zakresy
  for (int bandNo = 0; bandNo < MSGEQ_BAND_NO; bandNo++)
  {
    for (int j=0; j < bandValues[bandNo]/100; ++j) {
      rgbs[40 * bandNo + j] = 0xff0000; 
    }
    
   // sprintf(buf, "aa");
    
   // Serial.print(buf);
   Serial.printf("%4d ", bandValues[bandNo]);
  }
  Serial.println();

  drawMap(rmt_send1, rgbs);

  
//  sequence(rmt_send1, 5000, &rainbowSnakes);
//  for (i

////  sequence(rmt_send3, 5000, &rainbowSnakes);
//  sequence(rmt_send1, 1000, &lampki);
//  sequence(rmt_send1, 500, &eu);
//  sequence(rmt_send1, 500, &narodowe);
//  sequence(rmt_send1, 1000, &runningRainbow); 
//
//  sequence(rmt_send1, 1000, &runningRainbow);
}
