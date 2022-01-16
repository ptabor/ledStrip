#ifndef PTABS_LEDS_H
#define PTABS_LEDS_H

#include "esp32-hal.h"

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

// WS2812
//#define CYCLE_NS 1250
//#define T0H_NS 325
//#define T1H_NS 650
//#define RESET 50000
//#define TICK 25

// WS2815
#define CYCLE_NS 1400
#define T0H_NS 300   // 220ns~380ns
#define T1H_NS 800   // 580ns~1.6µs
#define RESET 300000 // > 280µs
#define TICK 25

const uint32_t RGB_RED=0xff0000;
const uint32_t RGB_GREEN=0x00ff00;
const uint32_t RGB_BLUE=0x0000ff;
const uint32_t RGB_BLACK=0x000000;
const uint32_t RGB_WHITE=0xffffff;

typedef struct led_channel_t {
  int length;
  rmt_obj_t* rmt;
  rmt_data_t* data;
  uint32_t* rgbs;

  // (1.0 -> full, 0.0-> none). 
  float  brightness;
  // that needs to pass for data() being modificable. 
  int32_t lock_till_ms;
} led_channel_t;


struct led_channel_t* setupLedChannel(int pin, int length);

void drawMap(struct led_channel_t *channel, uint32_t rgbs[]);
void drawColor(struct led_channel_t *channel, uint32_t rgb);
uint32_t applyBrightness(uint32_t rgb, float brightness);

#endif
