#include "leds.h"

#include <Arduino.h>

struct led_channel_t *setupLedChannel(int pin, int length) {
  rmt_obj_t* rmt;
  if ((rmt = rmtInit(pin, true, RMT_MEM_64)) == NULL)  {
    return NULL;
  }
  float realTick = rmtSetTick(rmt, TICK); // 1250/25 = 50
  delay(10);

  struct led_channel_t *channel=(struct led_channel_t *)malloc(sizeof(struct led_channel_t));
  channel->length = length;
  channel->rmt = rmt;
  channel->data = (rmt_data_t*)malloc(length * sizeof(rmt_data_t) * 24); // 24bits per led
  channel->rgbs = (uint32_t*)malloc(length * sizeof(uint32_t));
  channel->brightness=1.0;
  
  drawColor(channel, 0x000000);
  
  return channel;
}

uint32_t applyBrightness(uint32_t rgb, float brightness) {
 // brightness=1.0;
  uint32_t red = (rgb >> 16) & 255;
  uint32_t green = (rgb >> 8) & 255;
  uint32_t blue = (rgb) & 255;

  uint32_t r= (uint32_t(red * brightness)<<16) + (uint32_t(green * brightness)<<8) + (uint32_t(blue * brightness));
  //Serial.printf("%x r:%x g:%x b:%x wynik:%x\n", rgb, red, green, blue, r);
  return r;
}


void drawMap(struct led_channel_t *channel, uint32_t rgbs[]) {
  rmt_data_t* led_data = channel->data;

  uint32_t i = 0;
  for (int32_t led=channel->length-1; led>=0; led--) {
    uint32_t rgb = applyBrightness(rgbs[led], channel->brightness);
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
  rmtWrite(channel->rmt, led_data, i);
  delay(round((i / 1000.0) * (CYCLE_NS / 1000.0)) + 5);   
}


void drawColor(struct led_channel_t *channel, uint32_t rgb) {
  for (int i=0; i<channel->length; ++i) {
    channel->rgbs[i] = rgb;
  }
  drawMap(channel, channel->rgbs);
}
