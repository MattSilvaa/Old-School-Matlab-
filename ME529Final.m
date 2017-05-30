% Written by Matheus da Silva
% RedID: 815572037
% ME 520 Final Spring 2017

% Problem number 1
% Part B

% system matrices
m1 = 0; m2 = 0; m3 = 0;
k1 = 62.5; k2 = 36.815; k3 = 40000000;
c1 = .000025; c2 = .000015; c3 = 16;

mass = [m1  0   0; ...
        0   m2  0; ...
        0   0   m3];
damp = [c1+c2   -c2     0; ...
        -c2     c2  0; ...
        0   0   0];
stiff = [k1+k2  -k2     0; ...
        -k2     k2  0; ...
        0   0   k3];
% solve for the natural frequencies and modeshapes
[modmat_damped, eigval] = polyeig(stiff, damp, mass);
% sort the eigenvalues and vectors 
imagval = abs(imag(eigval));
[sorted_imgaval, index] = sort(imagval);
lambda = eigval(index);
modmat_damped = modmat_damped(:,index);

% part c
frequency_range=(0:10:10000);
M0 = pi/8*sin(2000);
Mc = [0; 0 ; 0];
Ms = [M0; 0 ; 0];

maug = [Mc;Ms];  
for ifreq = 1:length(frequency_range) 
    freq = frequency_range(ifreq);
 % dynamic stiffness matrix
    z = -freq^2*mass+stiff;
    amat = [z      freq*damp; ...
        -freq*damp      z];
    xaug = inv (amat)* faug;
% displacement amplitudes
theta1(ifreq) = sqrt(xaug(1)^2 + xaug(3)^2);
theta2(ifreq) = sqrt(xaug(2)^2 + xaug(4)^2);
% phase lags
phi1(ifreq) = atan2(-xaug(1), xaug(3));
phi2(ifreq) = atan2(-xaug(1), xaug(4));

figure
plot(phi1,theta1,phi2,theta2)
xlabel('Frequency')
ylabel('Phase angle')
end;
