clear;
clc;

% const ----------------
Rk = 0.075;
L = 0.3;
d = 0;
Mp = 97;
Mk = 5;
Mc = Mp + 2*Mk;
Ixx = (1/2)*Mk*Rk*Rk;
Izz = (1/12)*Mk*d*d + (1/4)*Mk*Rk*Rk;
Iz = 6.609;
Ic = Iz + 2*Izz + 2*Mk*L*L;

Rd = 2;
wd = pi/6;
vd = wd*Rd;

% modyfikowalne ---------
k1      = 1; 
k2      = 1; 
Kd      = 10;

xd0     = 5;
yd0     = -3;
thetad0 = 0;

%     x  y  theta  phi1  phi2
q0 = [0; 0;   0;    0;    0];

