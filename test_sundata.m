%##############################################
%test function [Am,Ys,SAz] = sundata(long,lati,DOY,LT,TZ)
%berlin's longtitude=13.2;latitude=52.3;time zone=2
%05.07.2018 is the 186th day of the year
%##############################################
clc;
clear;
[Am,Ys,SAz] = sundata(13.2,52.3,186,[6:20],2)
plot(SAz,Ys,'color','k');
hold on;
plot(SAz,Ys,'ro')
title('Berlin(13.2,52.3) on 05.07.2018(186/356)');
xlabel('Azimuth in degree As');
ylabel('Altitude Position in degree Ys');
grid on;