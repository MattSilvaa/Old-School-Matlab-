% By Matheus da Silva

% Number 1 
% Q = heat flow rate/ (specific heat of water*density * temp diff)
% heat flow rate = 110 V * 20 A
h = 2.2; %kw
c_p = 4.186;
den = 1000; %kg/m^3
t_diff = 105-60;
t_diff = (t_diff - 32) * 5/9; %Converts fahrenheit to celsius
Q = h / (c_p * den * t_diff);
Q = Q * 15850.32 ; %Converts m^3/s to gpm

% Number 2 
% Part a
P = 0:5:100; 
G = 1000;
n = (0.778 - 6.54100*(P./G)- .02490*(P.^2./G))*100; % 2012020A
x = P/G;
% 2012021A
n1 = (0.761-3.94850*(P./G) - .01540*(P.^2./G))*100;
% 2009050A
n2 = (0.549 - 1.45850*(P./G) - 0.00436*(P.^2./G))*100;
% Now Plot
figure
plot(x,n,x,n1,x,n2)
grid on
xlabel('[T_i - T_a]/ G_T ,m^2 C/W')
ylabel('Efficiency')
ylim([0 100])
title('Homework 6 P.2')
legend('2012020A','2012021A','2009050A')

%Part C, find T_o 
%2012020A
P1 = 35-15;
n3 = (0.778 - 6.54100*(P1./G)- .02490*(P1.^2./G)); 
A = 2.003;
mfr = 0.0201*1000;
T_o = (n3 * A * G)/( mfr * c_p) + 35;
%2012021A
n4 = 0.761-3.94850*(P1./G) - .01540*(P1.^2./G);
mfr1 = .0194 * 1000;
T_o1 = (n4 * A * G)/( mfr1 * c_p) + 35;
%2009050A
n5 = 0.549 - 1.45850*(P1./G) - 0.00436*(P1.^2./G);
A1 = 1.424;
mfr2 = .0162 * 1000;
T_o2 = (n5 * A1 * G)/(mfr2*c_p) + 35;

%Number 3 
theta = 10:10:70;
K_ta = [0.98 0.97 0.96 0.94 0.90 0.83 0.69];
x2 = 1./cosd(theta) - 1;
figure
grid on
plot(theta,K_ta)
xlabel('\theta')
ylabel('K_\tau_\alpha')
title('Homework 6 P.3')
figure 
grid on
plot(x2,K_ta)
xlabel('1/cos\theta-1')
ylabel('K_\tau_\alpha')
title('Homework 6 P.3')

%Number 4
%2012020A
U_l = 7.939;
ta = .789;
Ts = (G * ta)/U_l;
%2012010A
U_l1 = 5.103;
ta1 = .775;
Ts1 = (G* ta1)/U_l1;
%2009050A
U_l2 = 1.709;
ta2 = .550;
Ts2 = (G * ta2)/U_l2;

