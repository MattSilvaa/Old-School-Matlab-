% Written by Matheus da Silva

% Number 1
% Plotting the effective thermal conductivity vs pressure
% First I need to calculate mean free path
P = 10^(-2):.1:10^(5);
y = (1.381 * 10^(-23)*328)./(sqrt(2)*pi*P*(3.5*10^(-10))^2);
k_eff = 0.0281*(1+((2-0.9)*((9*1.0063)/0.7192-5)*y)./(0.9*(1.4+1)...
    *log(.047/.040))*(1/.047+1/.04)).^(-1);
%Plot
figure
semilogx(P,k_eff)
grid on
xlabel('Pressure (Pa)')
xlim([10^(-2) 10^5])
ylabel('k_e_f_f (W/mK)')
title('k_e_f_f vs P')

%second part    c
q_l = (2*pi*k_eff*(85-25))./log(47/40);
% Plotting
figure
semilogx(P,q_l)
grid on
xlabel('Pressure (Pa)')
xlim([10^(-2) 10^5])
ylabel('Heat loss per unit meter')
title('Q/L vs P')

% Number 2 
x = xlsread('HW4','A:A');
y = xlsread('HW4','B:B');
%plot now
figure
semilogx(x,y)
grid on
xlabel(' Wavelength \mum')
ylabel('Reflectance')
title('Black chrome on dull nickel after 30 day humidity test')


% Number 3
% Need to find solar absorbptance
s = xlsread('ASTMG173');
b = s(:,1)*10^-3; % makes it into micrometers, gets xaxis
c = s(:,2); % gets y axis
q = trapz(b,c); %gets integral of q, from last homework
t = xlsread('HW4'); %pull data from above
x1 = t(:,1); 
y1 = t(:,2);
A = 1 - y1; % alpha = 1 - rho
z = interp1(x1,A,b,'spline'); %interpolates A
k = z .* c;
k_int = trapz(b,k);
a = k_int / q; %Solar absorbption is 0.93

% Number 4
% Basically doing the same concept, but now it's not with a black body
T = 293:10:823;
E_b = (5.67*10^(-8) .* T.^4);










