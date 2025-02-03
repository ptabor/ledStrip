import logging
import json
import aiohttp
import voluptuous as vol
from homeassistant.const import CONF_NAME, CONF_HOST

from homeassistant.components.light import (
    ATTR_BRIGHTNESS, ATTR_EFFECT, ATTR_RGB_COLOR, LightEntity, PLATFORM_SCHEMA,
        ColorMode, LightEntityFeature,
)
import homeassistant.helpers.config_validation as cv
from homeassistant.util import color as color_util

_LOGGER = logging.getLogger("ledstrip")

DEFAULT_NAME = 'LED Strip Light'

PLATFORM_SCHEMA = PLATFORM_SCHEMA.extend({
    vol.Optional(CONF_NAME, default=DEFAULT_NAME): cv.string,
    vol.Required(CONF_HOST): cv.string,
})


COLOR_MODES = {ColorMode.RGB}
SUPPORTED_FEATURES = LightEntityFeature.EFFECT
EFFECTS = ["lamps", "snakes", "strobo", "rainbow-strobo", "solid", "disco", "rainbow", "pulse", "snow", "snow-color", "google", "ukraina", "snow"]


def setup_platform(hass, config, add_entities, discovery_info=None):
    """Set up the LED Strip Light platform."""
    name = config.get(CONF_NAME)
    add_entities([LedStripLight(name)])

class LedStripLight(LightEntity):
    """Representation of an LED Strip Light."""

    def __init__(self, name):
        """Initialize the LED Strip Light."""
        self._name = name
        self._state = False
        self._brightness = 255
        self._attr_effect = "lamps"
        self._attr_supported_color_modes = COLOR_MODES
        self._attr_color_mode = ColorMode.BRIGHTNESS #ColorMode.RGB
        self._attr_supported_features = SUPPORTED_FEATURES
        self._attr_effect_list = EFFECTS


    @property
    def name(self):
        """Return the display name of this light."""
        return self._name

    @property
    def is_on(self):
        """Return true if light is on."""
        return self._state

    @property
    def brightness(self):
        """Return the brightness of the light."""
        return self._brightness


    async def async_turn_on(self, **kwargs):
        """Instruct the light to turn on."""
        self._state = True
        if ATTR_BRIGHTNESS in kwargs:
            self._brightness = kwargs.get(ATTR_BRIGHTNESS, 255)
            await self.push_brightness()
        if ATTR_EFFECT in kwargs:
            effect = kwargs.get(ATTR_EFFECT, "solid")
            await self.push_mode(EFFECTS.index(effect))
        if ATTR_RGB_COLOR in kwargs:
            (r,g,b) = kwargs.get(ATTR_RGB_COLOR, (255,255,255))
            await self.push_color(color_util.color_rgb_to_hex(r,g,b))
        await self.push_power()

    async def async_turn_off(self, **kwargs):
        """Instruct the light to turn off."""
        self._state = False
        await self.push_power()

    async def push_power(self):
        async with aiohttp.ClientSession() as session:
            async with session.get('http://choinka.biel/power?set='+('on' if self._state else 'off')) as resp:
                print(resp.status)
                print(await resp.text())
                self.async_schedule_update_ha_state()

    async def push_brightness(self):
        async with aiohttp.ClientSession() as session:
            async with session.get('http://choinka.biel/brightness?b='+str(round(self._brightness/2.55))) as resp:
                print(resp.status)
                print(await resp.text())
                self.async_schedule_update_ha_state()

    async def push_color(self, color):
        async with aiohttp.ClientSession() as session:
            async with session.get('http://choinka.biel/color?color=0x'+color) as resp:
                print(resp.status)
                print(await resp.text())
                self.async_schedule_update_ha_state()


    async def get_status(self):
        async with aiohttp.ClientSession() as session:
            async with session.get('http://choinka.biel/status') as resp:
                print(resp.status)
                statusJson = await resp.text()
                print(statusJson)
                return json.loads(statusJson)

    async def push_mode(self, mode):
        async with aiohttp.ClientSession() as session:
            async with session.get('http://choinka.biel/mode?set='+str(mode)) as resp:
                print(resp.status)
                print(await resp.text())
                self.async_schedule_update_ha_state()

    async def async_update(self):
        """Fetch new state data for this light.
        This is the only method that should fetch new data for Home Assistant.
        """
        status = await self.get_status()
        self._state = status['power']
        self._brightness = round(status['brightness']*2.55)
        c = status['color']
        self._rgb_color = (c / 256 / 256, c / 256 % 256, c % 256)
        #  lamps snakes strobo rainbow-strobo red disco rainbow pulse snow snow-color google ukraina snow
        if status['mode'] < len(EFFECTS):
            self._attr_effect = EFFECTS[status['mode']]
            if self._attr_effect == "solid":
                self._attr_color_mode = ColorMode.BRIGHTNESS
            else:
                self._attr_color_mode = ColorMode.RGB
        
    
        



