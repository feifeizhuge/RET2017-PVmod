function [Am,Ys,SAz] = sundata(long,lati,DOY,LT,TZ)
%========================================
%Output:air mass,sun elevation angle,sun azimuth angle
%Input:longtitude,latitude,day of year,local time,time zone
%========================================
% day angle in degree
J =360*DOY/365;
% radian = degree*pi/180
deta = 0.3948-23.2559*cos((J+9.1)*pi/180)-0.3915*cos((2*J+5.4)*pi/180)-0.176*cos((3*J+26)*pi/180);
% time equation in second
TEQ = 0.0066+7.3525*cos((J+85.9)*pi/180)+9.9359*cos((2*J+108.9)*pi/180)+0.3387*cos((3*J+105.2)*pi/180);
% True local time in second
TLT = (LT-TZ)*3600 + 4* long*60+TEQ*60;
w = (12 - TLT/3600)*15;% Hour angle in degree every hour
% Sun Elevation
Ys=asin(cos(w*pi/180)*cos(lati*pi/180)*cos(deta*pi/180)+sin(lati*pi/180)*sin(deta*pi/180));
Am = 1./sin(Ys);% Air Mass
% '-' for TLT<=12;'+' for TLT>12 
logik = zeros(1,length(TLT));% '-' for TLT<=12;'+' for TLT>12
logik = TLT <= 12*3600;
factor = 1-2*logik;
% Sun Azimuth: transform radian to degree with(degree = radian*180/pi)
SAz = 180 + factor.*acos( (sin(Ys)*sin(lati*pi/180)-sin(deta*pi/180)) ./ (cos(Ys)*cos(lati*pi/180)) )*180/pi;
Ys =  Ys*180/pi;
end

