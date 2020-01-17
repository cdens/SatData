README for SatData:

This project contains two functions useful for analyzing and plotting WX satellite data.

rad2bt converts satellite radiance (W sr^-1 m^-2 Hz^-1) to brightness temperature (K) given the IR channel used.

satangletogeocoords converts x/y data from satellite scan angles (in radians) to longitude/latitude for a geostationary, equatorial satellite given the satellite's longitude (degE/W) and altitude (m)