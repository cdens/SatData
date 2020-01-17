function [longitude,latitude] = satangletogeocoords(hangle,vangle,altitude,clon)

% [longitude,latitude] = satangletogeocoords(hangle,vangle,altitude,clon)
% Casey Densmore
%
% Converts satellite scan angles (x/y angles: hangle and vangle) to
% latitude and longitude for an EQUATORIALLY-CENTERED geostationary
% satellite orbiting above a specified longitude (clon) at a specified
% height (altitude) in meters

%%

rearth_eq = 6378137.0;
rearth_pole = 6356752.31414;

%total hieght of satellite = altitude + earth radius at equator
H = altitude + rearth_eq;

%% coordinate rotations
a = (sin(hangle)).^2 + ((cos(hangle)).^2).*((cos(vangle)).^2 + (rearth_eq.^2./rearth_pole.^2).*(sin(vangle)).^2);
b = -2.*H.*cos(hangle).*cos(vangle);
c = H.^2 - rearth_eq.^2;

rs = (-b - sqrt(b.^2 - 4.*a.*c))./(2.*a);

sx = rs.*cos(hangle).*cos(vangle);
sy = -rs.*sin(hangle);
sz = rs.*cos(hangle).*sin(vangle);

%% latitude, longitude calculations
latitude = real(atan((rearth_eq^2/rearth_pole^2).*(sz./sqrt((H - sx).^2 + sy.^2)))).*180/pi;
longitude = clon - real(atan(sy./(H - sx))).*180/pi;


