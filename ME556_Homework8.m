% Written by Matheus da Silva

% Question 2
% Part C, calculating efficiency
T_h = 300:100:1500;% K 
T_c = 300; % K
eff = (T_h - T_c) ./ T_h * 100;
figure
plot(T_h, eff)
grid on
title('Q.2 Part C')
xlabel(' Receiver Temperature (K) ')
xlim([300 1500])
ylabel(' Engine Efficiency (%) ')

