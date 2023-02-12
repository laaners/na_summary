
%edit backward_substitution

A = [1 2 3 4;
     0 1 2 3;
     0 0 1 2;
     0 0 0 1];
b = [1 1 1 1]'

x = backward_substitution(A, b)

% Check with builtin \ operator of MATLAB
A \ b

%edit forward_substitution

x = forward_substitution(A', b)

% Check with builtin \ operator of MATLAB
A' \ b

y = forward_substitution(A', b);
x = backward_substitution(A, y)

% Check with builtin \ operator of MATLAB
(A'*A) \ b
