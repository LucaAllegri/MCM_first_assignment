function [psi,theta,phi] = RotToYPR(R)
    
    isRotation = IsRotationMatrix(R);

    if isRotation
        theta = atan2 (-R(3,1), sqrt((R(1,1))^2 + (R(2,1))^2)); 
        psi = atan2 (R(2,1), R(1,1)); 
        phi = atan2 (R(3,2), R(3,3));
    else
        theta = -1;
        phi = -1;
        psi = -1;
    end

end