function [x] = solveLU(L,U,b)
    y = forwardSubstitution(L,b)';
    x = backwardSubstitution(U,y)';
end
