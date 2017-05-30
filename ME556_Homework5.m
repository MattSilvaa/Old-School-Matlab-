%By Matheus Da Silva

% Number 1 (Doing it like ex. 5.1.1)
% Reflective Index for water is 1.33
n = 1.33;
r_0 = ((n-1)/(n+1))^2;
theta_1 = 0:90;
theta_2 = asind((sind(theta_1))./1.33);
% Now find Parallel, Perpendicular, and Average reflectance
r_pp =(sind(theta_2 - theta_1).^2)./(sind(theta_2 + theta_1).^2); 
r_p =(tand(theta_2 - theta_1).^2)./(tand(theta_2 + theta_1).^2); 
r_a = (r_pp+r_p)./2; %average

figure
plot(theta_1,r_pp,theta_1,r_p,theta_1,r_a)
legend('Perpendicular','Parallel','Average')
title('Reflectivity vs Incident Angle')
xlabel('Incident Angle (deg)')
ylabel('Reflectivity')
grid on


% Number 2 
pe = 0.1; % plate emissivity
eg = 0.88; %glass emissivity/cover
htc = 10; % wind heat transfer coefficient
tpm = 90; % average absorber plate temp
ta = 10; %ambient temp
s = 20; %tilt
sp = .025; %m, spacing

%Find the collector top loss coefficient 
f = (1 + 0.089*htc-0.1166*htc*pe)*(1+0.07866);
C = 520*(1-.000051*20^2);
e = .430*(1-100/(ta+273));
U_t = ( 1 / ((C/(tpm+273))*(((tpm+273)-(ta+273))/(1+f))^e) + (1 / htc))^(-1) ...
    + ((5.67*10^(-8)*(tpm+273+ta+273)*((tpm+273)^2+(ta+273)^2))...
    /((pe+.00591*htc)^(-1)+((2+f-1+0.133*pe)/eg)-1)); 
% U_t = 3.5077

%Number 3
% Find the outer temp of sheet of glass
%Assume tc1 = 40
tc1 = 40;
hrpc1 = (5.67*10^(-8)*((tpm+273)^2+(tc1+273)^2)*(tpm+273+tc1+273))...
    /((1/eg)+(1/pe) -1);
hrca1 = (eg*5.67*10^(-8))*((tc1+273)^2+(ta+273)^2)*(tc1+273+ta+273);
% mean temp between plate and cover is 65 C to properties are
v = 1.943 * 10^(-5);
k = 0.028871;
Pr = 0.7;
Tpc = 338;
Ra = (9.81*(tpm-tc1)*.025^3*Pr)/(Tpc *v^2);
Nu = 3.3; %eyeball from chart
h = Nu*k/sp;
U_t1 = (1/(h+hrpc1)+1/(hrca1+htc))^(-1); %u_t1 = 2.7634
tc = tpm - (U_t1*(tpm-ta))/(h+hrpc1); %28.7424 C
%Now solve again for U_t to make sure tc1 is correct
hrpc = (5.67*10^(-8)*((tpm+273)^2+(tc+273)^2)*(273+273+tpm+tc))...
    /((1/eg) + (1/pe) -1);
hrca = (eg*5.67*10^(-8))*((tc+273)^2+(ta+273)^2)*(273+273+tc+ta);
%new mean temp between plate is 59.3712
v1 = 1.8869*10^(-5);
k1 = 0.028472;
Pr1 = 0.70922;
Tpc1 = 332.371;
Ra1 = (9.81*(tpm-tc)*.025^3*Pr)/(Tpc1 *v^2);
Nu1 = 3.29; %Eyeball
h1 = Nu1*k1/sp;
U_t2 = (1/(h1+hrpc)+1/(hrca+htc))^(-1); 
%U_t2 = 3.5056 which is close to U_t so outer glass surfacte temp is 28.74C 

