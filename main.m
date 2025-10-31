clc, clearvars, close all
addpath('include');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PUNTO 1.1  Angle-axis to rot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

theta = deg2rad(90);

h = [1,0,0];

R = AngleAxisToRot(h,theta);
disp (R);

disp("----------------------------------------");

theta = deg2rad(60);

h = [0,0,1];

R = AngleAxisToRot(h,theta);
disp (R);

disp("----------------------------------------");

rho = [-pi/3, -pi/6, pi/3];

theta = sqrt(rho(1,1)^2 + rho(1,2)^2 + rho(1,3)^2);

h = rho / theta;   % RHO P= PI/3 PI/6 PI/3

R = AngleAxisToRot(h,theta);
disp(theta);
disp(h);
disp (R);

%%NORMA DI RHO è THETA   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PUNTO 1.2 Rot to angle-axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

R = [1 0 0;
     0 0 -1;
     0 1 0];

[h,theta] = RotToAngleAxis(R);

if theta == -5
    disp("Input Matrix is not Rotable")
end

disp("display theta:")
disp(theta);

disp("display h:")
disp(h)

disp("----------------------------------------");

R = [1/2        -sqrt(3)/2    0;
     sqrt(3)/2       1/2      0;
     0                0       1];

[h,theta] = RotToAngleAxis(R);

if theta == -5
    disp("Input Matrix is not Rotable")
end

disp("display theta:")
disp(theta);

disp("display h:")
disp(h)


disp("----------------------------------------");

R = [1 0 0;
     0 1 0;
     0 0 1];

[h,theta] = RotToAngleAxis(R);

if theta == -5
    disp("Input Matrix is not Rotable")
end

disp("display theta:")
disp(theta);

disp("display h:")
disp(h)


disp("----------------------------------------");

R = [-1 0  0;
     0  -1 0;
     0  0  1];

[h,theta] = RotToAngleAxis(R);

if theta == -5
    disp("Input Matrix is not Rotable")
end

disp("display theta:")
disp(theta);

disp("display h:")
disp(h);

disp("----------------------------------------");

R = [-1 0  0;
     0  1  0;
     0  0  1];

[h,theta] = RotToAngleAxis(R);

if theta == -5
    disp("Input Matrix is not Rotable")
end

disp("display theta:")
disp(theta);

disp("display h:")
disp(h);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PUNTO 1.3    Euler to rot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

R = YPRToRot(0,0,pi/2);
disp("display R:")
disp(R);

disp("----------------------------------------");

R = YPRToRot(0,0,deg2rad(60));
disp("display R:")
disp(R);

disp("----------------------------------------");

R = YPRToRot(pi/3,pi/2,pi/4);
disp("display R:")
disp(R);

disp("----------------------------------------");

R = YPRToRot(0,pi/2,-pi/12);
disp("display R:")
disp(R);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PUNTO 1.4    Rot to Euler
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

R = [1 0 0;
     0 0 -1;
     0 1 0];

[psi, theta, phi] = RotToYPR(R);

disp("display psi:")
disp(psi);
disp("display theta:")
disp(theta);
disp("display phi:")
disp(phi);

disp("----------------------------------------");

R = [1/2        -sqrt(3)/2    0;
     sqrt(3)/2       1/2      0;
     0                0       1];

[psi, theta, phi] = RotToYPR(R);

disp("display psi:")
disp(psi);
disp("display theta:")
disp(theta);
disp("display phi:")
disp(phi);

disp("----------------------------------------");

R = [    0             -sqrt(2)/2            sqrt(2)/2;
        1/2        sqrt(2)*sqrt(3)/4     sqrt(2)*sqrt(3)/4;
     -sqrt(3)/2         sqrt(2)/4            sqrt(2)/4];

[psi, theta, phi] = RotToYPR(R);

disp("display psi:")
disp(psi);
disp("display theta:")
disp(theta);
disp("display phi:")
disp(phi);


disp("----------------------------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PUNTO 1.5    Rot to angle-axis with eigenvectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

