#ifndef WAVELENGTH_H
#define WAVELENGTH_H

#include<stdint.h>

/** Taken from Earl F. Glynn's web page:
* <a href="http://www.efg2.com/Lab/ScienceAndEngineering/Spectra.htm">Spectra Lab Report</a>
* */
uint32_t waveLengthToRGBfull(double wavelength, double gamma, double intensityMax);

inline uint32_t waveLengthToRGB(double wavelength) {
  return waveLengthToRGBfull(wavelength, 0.80, 80);
}

#endif // WAVELENGTH_H
