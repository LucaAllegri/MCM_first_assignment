function [psi,theta,phi] = rotToYPR(R)

    for i=1:length(R)
        for j=1:length(R)
            RT(j,i) = R(i,j);
        end
    end
    I = R*RT;
    disp("Identity:");
    disp(I);

    % Rz = [ cos(psi)   -sin(psi)    0;
    %        sin(psi)    cos(psi)    0;
    %           0          0         1];
    % 
    % Ry = [ cos(theta)      0      sin(theta);
    %           0          1         0;
    %        sin(theta)      0      cos(theta)];
    % 
    % Rx = [    1          0         0;
    %           0       cos(phi)  -sin(phi);
    %           0       sin(phi)   cos(phi)];

    % Rypr = [ cos(psi)*cos(theta)  (-sin(psi)*cos(phi))+(cos(psi)*sin(theta)*sin(phi))  (sin(psi)*sin(phi))+(cos(psi)*cos(phi)*sin(theta));
    %          sin(psi)*cos(theta)  (cos(psi)*cos(phi))+(sin(psi)*sin(theta)*sin(phi))   (-cos(psi)*sin(phi))+(sin(theta)*sin(psi)*cos(phi));
    %              -sen(theta)                     cos(theta)*sin(phi)                                      cos(theta)*sin(phi)];

    theta = atan2 (-R(3,1), sqrt((R(1,1))^2 + (R(2,1))^2)); 
    psi = atan2 (R(2,1), R(1,1)); 
    phi = atan2 (R(3,2), R(3,3));



end