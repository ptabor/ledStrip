
#include <math.h>

#include "wavelength.h"

/** Taken from Earl F. Glynn's web page:
* <a href="http://www.efg2.com/Lab/ScienceAndEngineering/Spectra.htm">Spectra Lab Report</a>
* */
uint32_t waveLengthToRGBfull(double Wavelength, double Gamma, double IntensityMax){
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