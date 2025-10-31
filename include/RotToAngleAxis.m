function [h,theta] = RotToAngleAxis(R)

    [n,m] = size(R);
    
    isRotation = IsRotationMatrix(R);

    if isRotation

        % TRACE'S COMPUTE
        trace = 0;
        for i=1:n
            trace = trace + R(i,i); 
        end
        disp("Trace:");
        disp(trace);

        % THETA's COMPUTE
        theta = 1/cos(trace-1/2);
        
        % h-VECTOR'S COMPUTE
        for i=1:length(R)
            for j=1:length(R)
                RT(j,i) = R(i,j);
            end
        end

        diff_R_RT = R - RT;
        axial_vector = vex(diff_R_RT/2);
    
        if -10^-3 <= theta <= 10^-3
            %null rotation so h is arbitrary
            disp("0");
            h = [1; 0; 0]; % Arbitrary unit vector for null rotation
        elseif pi-10^-3 <= theta <= pi+10^-3;  %AGGIUNGERE LA TOLLERANZA 10-3
            hx = sqrt((R(1,1) + 1)/2);


            %TO DO HY HZ CON CONVENZIONE DEL SEGNO POSITIVO 
            %h = [hx hy hz];
            h = [1; 0; 0]; % a caso per restituire qualcosa e far funzionare il main
            disp("pi");
        else
            h = (1 / sin(theta)) * axial_vector ;
            disp("tra 0 e pi");
        end
    else
        theta = -5;
        h = [0,0,0]
    end

end


function a = vex(S_a)
    a = [S_a(3,2) S_a(1,3) S_a(2,1)];
end