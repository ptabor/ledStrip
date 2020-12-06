
// Install ESP32Encoder in the LibraryManager
#include <ESP32Encoder.h>

#include "wavelength.h"
#include "leds.h"
#include "visualizations.h"

#define PIN_BUTTON         14
#define PIN_ENCODER_BUTTON 25
#define PIN_ENCODER_A      27
#define PIN_ENCODER_B      26

#define PIN_RELAY 15
#define PIN_OUT1  21
#define PIN_OUT2  22
#define PIN_OUT3  23
#define NR_OF_LEDS   600

#define MSGEQ_BAND_NO 7
#define MSGEQ_STROBE_PIN    5
#define MSGEQ_RESET_PIN    18
#define MSGEQ_ANALOG_PIN    4

// This are reads from MSGEQ7. Please notice that they are after 2x voltage devider.
#define MAX_MSGEQ_VOLTAGE 2900
// If the normalized (1-100) signal is below this value, we conisider it 0. 
#define MSGEQ_NOISE_CUTOFF 6

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
}

void printBands() {
  for (int bandNo = 0; bandNo < MSGEQ_BAND_NO; bandNo++) {
    Serial.printf("%4d ", bandValues[bandNo]);
  }
  Serial.println();
}

// ==============================================================

struct led_channel_t *leds1 = NULL;
struct led_channel_t *leds2 = NULL;
struct led_channel_t *leds3 = NULL;   

void setupButtons() {
  pinMode(PIN_BUTTON, INPUT_PULLUP);
  pinMode(PIN_ENCODER_BUTTON, INPUT_PULLUP);
  pinMode(PIN_ENCODER_A, INPUT_PULLUP);
  pinMode(PIN_ENCODER_B, INPUT_PULLUP);
}

void ledTestSequence() {
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

void setup() 
{
    Serial.begin(115200);

    pinMode(PIN_RELAY, OUTPUT);

    digitalWrite(PIN_RELAY, HIGH);   // turn the power to the strip

    leds1 = setupLedChannel(PIN_OUT1, NR_OF_LEDS);
    if (!leds1) {
      Serial.printf("Cannot initialize stipe1");
    }
    
    leds2 = setupLedChannel(PIN_OUT2, NR_OF_LEDS);
    if (!leds2) {
      Serial.printf("Cannot initialize stipe1");
    }
    
    leds3 = setupLedChannel(PIN_OUT3, NR_OF_LEDS);
    if (!leds3) {
      Serial.printf("Cannot initialize stipe1");
    }

    setupMSGEQ7();
    
    ledTestSequence();

    setupButtons();
    
    Serial.printf("\n\nInit DONE");
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

int mode = 5;
int prev_ms;

void loop() {
  if (checkButton1pressed()) {
    mode++;
    Serial.printf("Button1 pressed. Mode: %d\n", mode);
  }

  int time_ms = millis();
  
  switch (mode % 6) {
    case 0: 
      drawColor(leds1, RGB_BLACK);
      drawColor(leds2, RGB_BLACK);
      drawColor(leds3, RGB_BLACK); 
      delay(100);
      break;
    case 1: 
      readMSGEQ7();
      drawBands(leds1, bandValues);  
      delay(10);
      break;
    case 2: 
      drawColor(leds1, RGB_RED);
      delay(100);
      break;
    case 3: 
      lampki(leds1, time_ms, prev_ms);
      delay(100);
      break;
    case 4: 
      rainbowSnakesDemo(leds1, time_ms);
      delay(10);
      break;
    case 5: 
      readMSGEQ7();
      rainbowSnakesStrobo(leds1, time_ms, bandValues);
      delay(10);
      break;

  }
  prev_ms = time_ms;
  Serial.printf("%d %d %d %d\n", digitalRead(PIN_BUTTON), digitalRead(PIN_ENCODER_BUTTON), digitalRead(PIN_ENCODER_A), digitalRead(PIN_ENCODER_B));
}
