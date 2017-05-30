%By Matheus Da Silva
%This will graph part b
w_s = acosd(-tand(-17.5165)*tand(32.7157));
w_s1 = -w_s;
x = w_s1:1:w_s; %calculates hour angle from sunrise to sunset
theta_z =(cosd(32.7157)*cosd(-17.5165)*cosd(x)+sind(32.7157)*sind(-17.5165));
theta_z = rad2deg(theta_z); %converts theta_z from radians to degrees
y = theta_z;

% Moving on to part C
w_s2 = w_s1:.25:w_s; %.25 is 15 degrees divided by 60 minutes
h_o = trapz(1367*(1+0.033*cosd((360*32)/365))*(cosd(32.7157)...
    *cosd(-17.5165)*cosd(w_s2)+sind(32.7157)*sind(-17.5165)));
h_o = h_o * 60; % Multiply by 60 to get from minutes to seconds
% Answer matches up with part a so we're good to go

%Beginning number 2

y1 = sind(-17.5165)*sind(32.7157)*cosd(25)-sind(-17.5165)*cosd(32.7157)*...
    sind(25)*cosd(30)+cosd(-17.5165)*cosd(32.7157)*cosd(25)*cosd(x)+cosd(-17.5165)...
    *sind(32.7157)*sind(25)*cosd(30)*cosd(x)+cosd(-17.5165)*sind(25)*sind(30)*sind(x);
y1 = rad2deg(y1);

%Part B, Now calculate sunset and sunsire angle for tilted surface
A = cosd(25)+tand(32.7157)*cosd(30)*sind(25);
B = cosd(w_s)*cosd(25)+tand(-17.5165)*sind(25)*cosd(30);
C = (sind(25)*sind(30))/cosd(32.7157);
sr = min(w_s,(acosd((A*B+C*sqrt(A^2-(B^2)+C^2))/(A^2+C^2))));
% Since A > B sr should be negative (sunrise)
sr = -sr;
ss = min(w_s,(acosd((A*B-C*sqrt(A^2-(B^2)+C^2))/(A^2+C^2))));
% Since A > B ss = 78.3026 (sunset)

%Now on to part C, calculating the h_o... let's name it h_ot
w_s3 = sr:.25:ss;
h_ot = trapz(1367*(1+0.033*cosd((360*32)/365))*(sind(-17.5165)*...
    sind(32.7157)*cosd(25)-sind(-17.5165)*cosd(32.7157)*...
    sind(25)*cosd(30)+cosd(-17.5165)*cosd(32.7157)*cosd(25)*...
    cosd(w_s3)+cosd(-17.5165)*sind(32.7157)*sind(25)*cosd(30)*...
    cosd(w_s3)+cosd(-17.5165)*sind(25)*sind(30)*sind(w_s3)));
h_ot = h_ot * 60;

%Now I'll do number 3
%Beginning with finding h_ophoenix
h_ophoenix = (24*3600*1367)/pi*(1+.033*cosd((360*47)/365))...
    *(cosd(33.4)*cosd(-13)*sind(acosd(-tand(33.4)*tand(-13)))+...
    (pi*acosd(-tand(33.4)*tand(-13)))/180*sind(33.4)*sind(-13));
%Now time for Fairbanks
h_ofairbanks = (24*3600*1367)/pi*(1+.033*cosd((360*47)/365))...
    *(cosd(64.8)*cosd(-13)*sind(acosd(-tand(64.8)*tand(-13)))+...
    (pi*acosd(-tand(64.8)*tand(-13)))/180*sind(64.8)*sind(-13));


figure 
plot(x,y,x,y1)
title('Part b')
ylabel('cos(\theta)')
ylim([0 60])
xlabel('\omega_s')
xlim([-100 100]) %Setting limit to specification on homework
legend('Horizontal Surface','Tilted Surface')


