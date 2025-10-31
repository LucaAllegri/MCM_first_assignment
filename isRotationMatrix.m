function [isRotationMatrix] = isRotationMatrix(R)

    for i=1:length(R)
        for j=1:length(R)
            RT(j,i) = R(i,j);
        end
    end
    isRotationMatrix = R*RT;
    disp("Identity:");
    disp(isRotationMatrix);
    
    %%check identity matrix and determinant

end