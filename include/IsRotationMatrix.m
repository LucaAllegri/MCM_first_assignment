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

    %det_R = R(1,1) * (R(2,2)*R(3,3) - R(2,3)*R(3,2)) -R(1,2) * (R(2,1)*R(3,3) - R(2,3)*R(3,2)) + R(1,3) * (R(2,1)*R(3,2) - R(2,2)*R(3,1));
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

function deter = det(R)
    
    [n,m] = size(R);

    if n == 1
        deter = R(n);
        return;
    elseif n == 2
        deter = (R(1,1)*R(2,2)) - (R(1,2)*R(2,1));
        return;
    else
        deter=0;
        for j=1:n
            M = R(2:n,[1:j-1,j+1:m]);
            segno = (-1)^(1+j);
            deter =  deter + segno * R(1,j) * det(M);
        end

    end
 
end