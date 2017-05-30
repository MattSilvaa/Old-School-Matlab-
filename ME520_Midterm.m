% %Use ODE45
function mdot = ME520_Midterm(t,a)
c = 0.000693;
w = 0.0231;
m = 300;
theta = pi/4*sin(300*t);
mdot = zeros(size(a));
mdot(1) = a(2);
mdot(2) = (theta - c*a(2)-w*a(1))/m;
%Run this to plot
% a0 = [1 0];
% % [t,a] = ode45('ME520_Midterm', [0:10:7000],a0);
% plot(t,a(:,1))
% xlabel('\omega')
% ylabel('\alpha(t)')
% title('Part C')
% grid on



