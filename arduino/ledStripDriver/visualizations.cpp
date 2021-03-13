#include "visualizations.h"
#include "wavelength.h"
#include <Arduino.h>

#define MSGEQ_BAND_NO 7

// ===============================================================================

uint32_t losowyKolorSwiateczny() {
  uint32_t kolory[] = { 0xff0000, 0x00ff00, 0x0000ff, 0xffffff, 0xffa500};
  return kolory[rand()%5];
}

void lampki(led_channel_t *channel, int t_ms, int prev_t_ms) {
  uint32_t *strip=channel->rgbs;
  
  if (prev_t_ms == 0 || (t_ms - prev_t_ms > 5000)) {
    for (int i = 0; i < channel->length; ++i) {
      if (rand()%5 == 0) {
        strip[i] = losowyKolorSwiateczny();  
      } else {
        strip[i] = 0x000000;
      }
    }
  }

  if (t_ms / 5000 != prev_t_ms / 5000) {
    // Turn off random;
    while(true) {
      uint32_t l = rand()%channel->length;
      if (strip[l] != 0x000000) {
        strip[l] = 0x000000;  
        break; 
      }
    }

    // Turn on random;
    while(true) {
      uint32_t l = rand()%channel->length;
      if (strip[l] == 0x000000) {
       strip[l] = losowyKolorSwiateczny();  
        break; 
      }
    }    
  }
  drawMap(channel, strip);
}

// ============================================================================

void stroboSimple(led_channel_t* channel, int bandValues[MSGEQ_BAND_NO]) {
  uint32_t *strip=channel->rgbs;

  for (int i = 0; i < channel->length; ++i) {
    strip[i] = 0x000000;
  }

  int ledsPerBand = channel->length / MSGEQ_BAND_NO;

  for (int b=0; b<MSGEQ_BAND_NO; ++b) {
    for (int i=0; i < bandValues[b] * ledsPerBand / 100; ++i) {
      strip[b*ledsPerBand + i] = RGB_RED;
    }
  }
  drawMap(channel, strip);
}

// ============================================================================

typedef struct snakeType {
//   steps_per_ms, can be negative to change direction.
  float speed;  
  uint32_t length;
  uint32_t maxLength;
} snakeType;

void clean(led_channel_t *channel) {
  uint32_t *strip=channel->rgbs;
  for (int i = 0; i < channel->length; ++i) {
    strip[i] = 0x000000;
  }
}


void rainbowSnakes(led_channel_t *channel, uint32_t t_ms, struct snakeType snakes[], int numSnakes) {
  uint32_t *strip=channel->rgbs;
  clean(channel);
  for (int s = 0; s < numSnakes; ++s) {
    if (snakes[s].length > 0 && snakes[s].maxLength > 0) {
      for (uint32_t i = 0; i < snakes[s].length; i++) {
        strip[uint32_t(round(snakes[s].speed * t_ms + i + (s * channel->length / numSnakes) )) % channel->length ] = waveLengthToRGB(380+(400 * i / (snakes[s].maxLength - 1) ));
      }
    }
  }

  drawMap(channel, strip);
}

void rainbowSnakesStrobo(led_channel_t *channel, uint32_t t_ms, int bandValues[MSGEQ_BAND_NO]) {
  struct snakeType snakesArray[MSGEQ_BAND_NO];// = {snakeType1, snakeType2, snakeType3};
  for (int i = 0; i < MSGEQ_BAND_NO; ++i) {
    snakesArray[i].speed=-0.01;
    snakesArray[i].length=bandValues[i]/3;
    snakesArray[i].maxLength=34;
  }
  rainbowSnakes(channel, t_ms, snakesArray, MSGEQ_BAND_NO);
}

struct snakeType snakeType1 = {0.04, 50, 50};
struct snakeType snakeType2 = {-0.05, 80, 80};
struct snakeType snakeType3 = {0.01, 140, 140};
struct snakeType snakesArray[3] = {snakeType1, snakeType2, snakeType3};

void rainbowSnakesDemo(led_channel_t *channel, uint32_t t_ms) {
  rainbowSnakes(channel, t_ms, snakesArray, 3);
}

void oneByOne(led_channel_t *channel, int t_ms, int per_one_ms) {
  uint32_t *strip=channel->rgbs;
  clean(channel);
  int led = (t_ms / per_one_ms) % channel->length;
  strip[led]= 0xffffff;
  drawMap(channel, strip);
  Serial.printf("Led: ");
  Serial.printf(String(led).c_str());
  Serial.printf("\n");
}

void blyskawicaI(led_channel_t *channel, int t_ms){
  uint32_t *strip=channel->rgbs;
  for (int l = 0; l < 125; ++l) {
    strip[l] |= (130+int(sin(t_ms/300.0 + l/100.0)*120.0)) << 16;
  }
}


void choinkaI(led_channel_t *channel, int t_ms){
  uint32_t *strip=channel->rgbs;
  for (int l = 0; l < 61; ++l) {
    strip[l]|=RGB_GREEN;
  }
  for (int l = 125; l < 237; ++l) {
    strip[l]|=RGB_GREEN;
  }
}


void blyskawica(led_channel_t *channel, int t_ms){
  clean(channel);
  blyskawicaI(channel, t_ms);
  drawMap(channel, channel->rgbs);
}


void choinka(led_channel_t *channel, int t_ms){
  clean(channel);
  choinkaI(channel, t_ms);
  drawMap(channel, channel->rgbs);
}

void choinkaBlyskawica(led_channel_t *channel, int t_ms) {
  clean(channel);
  blyskawicaI(channel, t_ms);
  choinkaI(channel, t_ms);
  drawMap(channel, channel->rgbs);  
}
