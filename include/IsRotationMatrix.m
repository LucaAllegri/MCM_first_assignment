function [isRotationMatrix] = IsRotationMatrix(R)
    [n,m] = size(R);
    RT = R';

    I = RT*R;
    
    for i=1:n
        for j=1:m
            if i==j
                if (I(i,j) < 1 - (10^-3)) || (I(i,j) > 1 + (10^-3)) 
                    isRotationMatrix = false;
                    disp("non è identità");
                    return;
                end
            else
                if (I(i,j) < -(10^-3)) || (I(i,j) > (10^-3)) 
                    isRotationMatrix = false;
                    disp("non è identità");
                    return;
                end
            end
        end
    end
    
    % Calcolo del determinante, deve essere uguale a 1
    det_R = det(R);
    % disp("determinante= ");
    % disp(det_R);

    if (det_R < 1 - (10^-3)) || (det_R > 1 + (10^-3))
        isRotationMatrix = false;
        return;
    else 
        isRotationMatrix = true;
        return;
    end

end
