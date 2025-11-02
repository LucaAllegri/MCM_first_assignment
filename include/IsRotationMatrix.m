function [isRotationMatrix] = IsRotationMatrix(R)
    [n,m] = size(R);
    for i=1:n
        for j=1:m
            RT(j,i) = R(i,j);
        end
    end

    I = RT*R;
    
    for i=1:n
        if (I(i,i) < 1 - (10^-3)) && (I(i,i) > 1 + (10^-3))
            isRotationMatrix = false;
            disp("non è identità");
            return;
        end
    end
    
    % Calcolo del determinante, deve essere uguale a 1
    det_R = det(R);
    disp("determinante= ");
    disp(det_R);

    if (det_R < 1 - (10^-3)) || (det_R > 1 + (10^-3))
        isRotationMatrix = false;
        return;
    else 
        isRotationMatrix = true;
        return;
    end

    %%check identity matrix and determinant
end
