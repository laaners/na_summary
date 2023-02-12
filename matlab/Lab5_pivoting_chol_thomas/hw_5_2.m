clc
clear all
close all

A = [10 0 3 0;
     0 5 0 -2;
     3 0 5 0;
     0 -2 0 2];
 
eig(A)>0

% All the eigenvalues are positive => A is spd (the simmetry is trivial).

b = [2 2 2 2]';

H = chol(A)';

% Alternatively you can use your own function MyChol.

y = H\b;
x = H'\y

% Alternatively you can use your own functions for the forward and backward substitution.

xex = A\b

detA = (prod(diag(H)))^2
det(A)

% Since A = H * H^T and det(H) = det(H^T) = product of the diagonal entries of H,
% we have det(A) = det(H) * det(H^T) = det(H)^2 = (product of the diagonal
% entries of H)^2.