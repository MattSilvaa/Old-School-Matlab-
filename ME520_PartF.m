z = 0.0002;
r = 0:.5:3;
ratio = sqrt((1+(2*z*r).^2)./((-r.^2+1).^2+(2*z*r).^2));
figure
plot(r,ratio)
xlabel('r')
ylabel('\alpha_0/\theta_0')
title('Part F ME 520')
grid on

