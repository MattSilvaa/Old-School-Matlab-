%By Matheus da Silva

%Number 1
%Solving for I_o, G_sc = 1367, n = 46, gamma = 32.7157, w_2 = 0 w_1 = -15
declination = 23.45*sind(360*(284+46)/365); % = -13.2892
I_o = (12*3600*1367)/pi * ( 1 + 0.033*cosd((360 * 46)/365))...
    *(cosd(32.7157)*cosd(-13.2892)*(sind(0)-sind(-15))...
    +(pi*(0-(-15)))/180*sind(32.7157)*sind(-13.2892)); %3.45 MJ/m^2
I_d_overI = 0.9511-0.1604*(.7014)+4.388*(.7014^2)-16.638*(.7014^3)...
    +12.336*(.7014^4); %Id/I = .2418
R_b = (cosd(32.7157-45)*cosd(declination)*cosd(-7.5)+sind(32.7157-45)*...
    sind(declination))/(cosd(32.7157)*cosd(declination)*cosd(-7.5)...
    +sind(32.7175)*sind(declination)); % = 1.4423
I_t = 1.835 * R_b + I_d_overI*((1+cosd(45))/2) + 2.42*.6*...
    ((1-cosd(45))/2); % = 3.06 MJ/m^2

%Number 3
data = xlsread('data.xls');
%gets matlab to know what file to use
one = data(:,1);
two = data(:,2);
three = data(:,3);
four = data(:,4);
t1 = trapz(one, two);
t2 = trapz(one, three);
t3 = trapz(one,four);
%gathered all of the data from the four columns now it's time to graph
figure
plot(one,two,one,three,one,four);
grid on
title('Solar Spectrum')
xlabel('Wavelength \lambda (nm)')
ylabel('Spectral Irradiance W * m ^-^2 nm^-^1')
legend('Etr','Global Tilt','Direct Circumsolar')


%Number 4
%part b 
T_s = 20*(.711+.0056*5+0.000073*5^2+0.013*cosd(15*12))^(1/4);
% T_s = 18 degrees or 291 K

%partc
R_a = (9.81 * 40 * 0.025^3)/(323*2.545e-5*17.935e-6);




