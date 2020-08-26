/* RMT example -- RGB LED Strip

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/rmt.h"
#include "led_strip.h"

static const char *TAG = "WS28xx_demo";

#define RMT_TX_CHANNEL RMT_CHANNEL_0

#define EXAMPLE_CHASE_SPEED_MS (10)

#define CONFIG_EXAMPLE_STRIP_LED_NUMBER 300

/**
 * @brief Simple helper function, converting HSV color space to RGB color space
 *
 * Wiki: https://en.wikipedia.org/wiki/HSL_and_HSV
 *
 */
void led_strip_hsv2rgb(uint32_t h, uint32_t s, uint32_t v, uint32_t *r, uint32_t *g, uint32_t *b)
{
    h %= 360; // h -> [0,360]
    uint32_t rgb_max = v * 2.55f;
    uint32_t rgb_min = rgb_max * (100 - s) / 100.0f;

    uint32_t i = h / 60;
    uint32_t diff = h % 60;

    // RGB adjustment amount by hue
    uint32_t rgb_adj = (rgb_max - rgb_min) * diff / 60;

    switch (i) {
    case 0:
        *r = rgb_max;
        *g = rgb_min + rgb_adj;
        *b = rgb_min;
        break;
    case 1:
        *r = rgb_max - rgb_adj;
        *g = rgb_max;
        *b = rgb_min;
        break;
    case 2:
        *r = rgb_min;
        *g = rgb_max;
        *b = rgb_min + rgb_adj;
        break;
    case 3:
        *r = rgb_min;
        *g = rgb_max - rgb_adj;
        *b = rgb_max;
        break;
    case 4:
        *r = rgb_min + rgb_adj;
        *g = rgb_min;
        *b = rgb_max;
        break;
    default:
        *r = rgb_max;
        *g = rgb_min;
        *b = rgb_max - rgb_adj;
        break;
    }
}


void app_main(void)
{
	ESP_LOGI(TAG, "install WS28XX driver...");

    gpio_pad_select_gpio(15);
    /* Set the GPIO as a push/pull output */
    gpio_set_direction(15, GPIO_MODE_OUTPUT);
    gpio_set_level(15, 1);

  //  pinMode(PIN_RELAY, OUTPUT);
  //  digitalWrite(PIN_RELAY, HIGH);   // turn the power to the strip
    

    uint32_t red = 0;
    uint32_t green = 0;
    uint32_t blue = 0;
    uint16_t hue = 0;
    uint16_t start_rgb = 0;

//    rmt_config_t config = RMT_DEFAULT_CONFIG_TX(23, RMT_TX_CHANNEL);
//    // set counter clock to 40MHz
//    config.clk_div = 2;
//
//    ESP_ERROR_CHECK(rmt_config(&config));
//    ESP_ERROR_CHECK(rmt_driver_install(config.channel, 0, 0));

    // install ws28xx driver
//    led_strip_config_t strip_config = LED_STRIP_DEFAULT_CONFIG(CONFIG_EXAMPLE_STRIP_LED_NUMBER, (led_strip_dev_t)config.channel);
//    led_strip_t *strip = led_strip_new_rmt_ws28xx(&strip_config);

    led_strip_t *strip = led_strip_new_rmt_ws28xx_with_channel(23, RMT_TX_CHANNEL, 300);
    if (!strip) {
        ESP_LOGE(TAG, "install WS28XX driver failed");
    }
    // Clear LED strip (turn off all LEDs)
    ESP_ERROR_CHECK(strip->clear_async(strip));
    // Show simple rainbow chasing pattern
    ESP_LOGI(TAG, "LED Rainbow Chase Start");
    for(int iter=0; iter < 1000; iter++) {
    	ESP_LOGI(TAG, "iter: %d", iter);
       // for (int i = 0; i < 3; i++) {
            for (int j = 0; j < CONFIG_EXAMPLE_STRIP_LED_NUMBER; j += 1) {
                // Build RGB values
                hue = j * 360 / CONFIG_EXAMPLE_STRIP_LED_NUMBER + start_rgb;
                led_strip_hsv2rgb(hue, 100, 100, &red, &green, &blue);
                // Write RGB values to strip driver
                ESP_ERROR_CHECK(strip->set_pixel(strip, j, red/10, 0, blue/10 /*red, green, blue*/));
            }
            // Flush RGB values to LEDs
            ESP_ERROR_CHECK(strip->refresh_async(strip));
            vTaskDelay(pdMS_TO_TICKS(EXAMPLE_CHASE_SPEED_MS));
  //          strip->clear(strip, 50);
  //          vTaskDelay(pdMS_TO_TICKS(EXAMPLE_CHASE_SPEED_MS));
    //    }
        start_rgb += 1;
    }

    led_strip_del_rmt_ws28xx_with_channel(strip);
    ESP_LOGI(TAG, "DONE");
}
