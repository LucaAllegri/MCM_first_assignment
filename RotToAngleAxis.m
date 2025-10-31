function [h,theta] = RotToAngleAxis(R)
    % CHECK IF R IS A VALID ROTATION MATRIX RR^T = I

    for i=1:length(R)
        for j=1:length(R)
            RT(j,i) = R(i,j);
        end
    end
    I = R*RT;
    disp("Identity:");
    disp(I);

    % TRACE'S COMPUTE
    trace = 0;
    i=1; j=1;
    for n=1:length(R)
        trace = trace + R(i, j); 
        i=i+1;
        j=j+1;
    end
    disp("Trace:");
    disp(trace);
    theta = 1/cos(trace-1/2);

    % h-VECTOR'S COMPUTE

    diff_R_RT = R - RT;
    axial_vector = [diff_R_RT(3,2) diff_R_RT(3,1) diff_R_RT(2,1)];


    if theta == 0
        %null rotation so h is arbitrary
        disp("0");
        h = [1; 0; 0]; % Arbitrary unit vector for null rotation
    elseif pi-0,02 <= theta <= pi+0,02;
        hx = sqrt(R(1,1) + 1/2);
        hy = sqrt(R(2,2) + 1/2);
        hz = sqrt(R(3,3) + 1/2);
        h = [hx hy hz];
        disp("pi");
    else
        h = (1 / 2 * sin(theta)) * axial_vector ;
        disp("tra 0 e pi");
    end

end