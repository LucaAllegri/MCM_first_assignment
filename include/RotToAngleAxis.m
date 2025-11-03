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
        if -10^-3 <= theta && theta <= 10^-3
            %null rotation so h is arbitrary
            disp("0");
            h = [1; 0; 0];

        elseif pi-10^-3 <= theta && theta <= pi+10^-3
            
            disp("pi");
            hx = sqrt((R(1,1) + 1)/2); %picking the first component
            hy = sign(hx) * sign(R(1,2))*sqrt((R(2,1)+1)/2);
            hz = sign(hx) * sign(R(1,3)) * sqrt((R(3,1)+1)/2);
            h = [hx hy hz];
            h = real(h/norm(h));
           
            
  
        else
            disp("tra 0 e pi");
            diff_R_RT = R - RT;
            axial_vector = vex(diff_R_RT/2);
            h = (1 / sin(theta)) * axial_vector ;
            h = real(h/norm(h));
            
            
        end
    else
        %non rotation matrix
        theta = -1;
        h = [0,0,0]
    end

end


function a = vex(S_a)
    a = [S_a(3,2) S_a(1,3) S_a(2,1)];
end

function [sign] = sign(x)
    if(x <0)
        sign = -1;
    elseif(x > 0)
        sign = 1;
    else 
        sign = 0;
    end
end