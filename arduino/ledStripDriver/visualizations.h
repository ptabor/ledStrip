#ifndef PTABS_VISULIZATIONS
#define PTABS_VISULIZATIONS

#include "leds.h"

void drawBands(led_channel_t* channel, int bandValues[7]);
void lampki(led_channel_t *channel, int t_ms, int prev_t_ms);

void rainbowSnakes(led_channel_t *channel, uint32_t t_ms, struct snakeType snakes[], int numSnakes);
void rainbowSnakesDemo(led_channel_t *channel, uint32_t t_ms);
void rainbowSnakesStrobo(led_channel_t *channel, uint32_t t_ms, int bandValues[7]);


#endif
