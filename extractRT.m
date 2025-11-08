function [R, p] = extractRT(T)

    % Controllo dimensioni input
    if ~isequal(size(T), [4,4])
        error('La matrice T deve essere 4x4.');
    end

    % Estrazione parte di rotazione (3x3)
    R = T(1:3, 1:3);

    % Estrazione vettore di traslazione (3x1)
    p = T(1:3, 4);
end
