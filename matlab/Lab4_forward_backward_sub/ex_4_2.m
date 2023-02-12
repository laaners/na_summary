clc
clear all
close all

A = [2 10 4 0;
     1  0 2 2;
     1 4 0 2;
     1 2 1 1];
b = [10 1 3 3]';

[L, U] = lu(A);
% In this case it is not essential to include the matrix P among the output
% variables in order to have L in the form of a lower triangular matrix
% with L_ii = 1 for each i.

y = L \ b; %forward
x = U \ y  %backward

% Alternatively, you could have used the functions for the forward and
% backward substitutions that you defined in Lab4.

% Check
A \ b

% Thanks to the Binet-Cauchy formula, we have, for generic square matrices,
% det(A*B) = det(A)*det(B).
% In our case, since A = L*U, det(A) = det(L*U) = det(L)*det(U).
% However L_ii = 1 for each i, so det(L) = 1
% => det(A) = det(U).

detA = prod(diag(U))

% Check with the command det
det(A)