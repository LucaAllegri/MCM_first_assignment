function [h] = eigen_H(R)
    [eigVec, eigVal] = eig(R);
    D = diag(eigVal);
    ind = -1;
    for i = 1:length(D)
        if(abs(D(i) - 1) < 10^-3)
            ind = i;
        end
    end
    h = eigVec(:,ind);  
end