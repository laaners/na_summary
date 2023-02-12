clc
clear all
close all

A = [1    1e10 1     1;
     1e10 1    1     1e10;
     1    1    1e-10 1;
     1    1e10 1     1e10];
x = [1 1 1 1]';
b = [1e10 + 3; 2e10 + 2; 3 + 1e-10; 2e10 + 2];

% solution with LU decomposition without pivoting
[L1, U1] = lu_decomposition(A);
y1 = L1 \ b;
x1 = U1 \ y1

% The computed solution is incorrect! The third component is not 1.

% solution with LU decomposition with pivoting
[L2, U2, P2] = lu(A);
y2 = L2 \ (P2*b);
x2 = U2 \ y2
% The computed solution is ok.

% infinity norm of the error
norm(x - x1, inf)
norm(x - x2, inf)
% As already noted, the best solution is that obtained with the pivoting.

% Cholesky decomposition? -> no, because A is symmetric but not definite
% positive definite, since the eigenvalues are not all positive.
eig(A)

% normalized residual
norm(b - A*x1, inf) / norm(b, inf)
norm(b - A*x2, inf) / norm(b, inf)

% In both cases the normalized residuals are very small. 
% Nevertheless the relative error is not small in both cases. 
% The normalized residual is a good estimate of the relative error 
% only when the condition number of the matrix is small!

cond(A, inf)