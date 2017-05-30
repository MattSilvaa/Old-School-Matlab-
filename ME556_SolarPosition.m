%By Matheus Da Silva

%%San Diego
% Declination is going to be -17.5 for every city
%Latitude & Longitude for San Diego is, 32.7157 N -117.1611 W
w_s = acosd(-tand(-17.5)*tand(32.7157)); %sunset
w_s2 = -(w_s); %sunrise
n_sd = w_s2:1:w_s;
a_s = (cosd(32.7157)*cosd(-17.5)*cosd(n_sd))+(sind(32.7157)*sind(-17.5));
a_s = rad2deg(a_s); %%changes radian to degree
Theta_sd = 90-a_s;
gamma_sd = asind((sind(n_sd)*cosd(-17.5))./(sind(Theta_sd)));

%%Seattle
%Latitude & longitude for Seattle is, 47.6062° N  -122.3321° W
w_seattle = acosd(-tand(-17.5)*tand(47.6062)); %sunset
w_seattle2 = -(w_seattle); %sunrise
n_s = w_seattle2:1:w_seattle;
a_seattle = (cosd(47.6062)*cosd(-17.5)*cosd(n_s))+(sind(47.6062)*sind(-17.5));
a_seattle = rad2deg(a_seattle);
Theta_seattle = 90-a_seattle;
gamma_seattle = asind((sind(n_s)*cosd(-17.5))./(sind(Theta_seattle)));

%Anchorage
%Latitude & longitude for Anchorage is, 61.2181° N -149.9003° W
w_anc = acosd(-tand(-17.5)*tand(61.2181)); %sunset
w_anc2 = -(w_anc); %sunrise
n_a=  w_anc2:1:w_anc;
a_a = (cosd(61.2181)*cosd(-17.5)*cosd(n_a))+(sind(61.2181)*sind(-17.5));
a_a = rad2deg(a_a);
Theta_a = 90-a_a;
gamma_a = asind((sind(n_a)*cosd(-17.5))./(sind(Theta_a)));

%%Plot
%yyaxis lets me control either the 'left' or 'right' yaxis
figure
plot(gamma_sd,a_s,gamma_seattle,a_seattle,gamma_a,a_a)
yyaxis right
plot(gamma_sd,Theta_sd,'b',gamma_seattle,Theta_seattle,'r',gamma_a,Theta_a,'y')
axis ij
ylim([50 90])%% I had to set this limit so that both of the graphs matched up.
xlabel('Solar Azimuth Angle,\gamma_s')
ylabel('\theta_z')
yyaxis left
ylabel('Solar Altitude Angle,\alpha_s')
legend('San Diego', 'Seattle', 'Anchorage')

title('ME 556 Homework Problem 7')