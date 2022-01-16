#ifndef PTABS_VISULIZATIONS
#define PTABS_VISULIZATIONS

#include "leds.h"

void lampki(led_channel_t *channel, int t_ms, int prev_t_ms);

void stroboSimple(led_channel_t* channel, int bandValues[7]);

void rainbow(led_channel_t *channel, uint32_t t_ms);

void rainbowSnakes(led_channel_t *channel, uint32_t t_ms, struct snakeType snakes[], int numSnakes);
void rainbowSnakesDemo(led_channel_t *channel, uint32_t t_ms);

void rainbowSnakesStrobo(led_channel_t *channel, uint32_t t_ms, int bandValues[7]);

void oneByOne(led_channel_t *channel, int t_ms, int per_one_ms);

void blyskawica(led_channel_t *channel, int t_ms);

void choinka(led_channel_t *channel, int t_ms);

void clean(led_channel_t *channel);

void choinkaBlyskawica(led_channel_t *channel, int t_ms);

void grzesia(led_channel_t *channel, int t_ms);

void prefix(led_channel_t *channel, int n, uint32_t color);

void pulses(led_channel_t *channel, int t_ms, uint32_t color);

void snow(led_channel_t *channel, int t_ms, uint32_t kolory[], int kolory_len);
void snow(led_channel_t *channel, int t_ms, uint32_t color);

#endif
