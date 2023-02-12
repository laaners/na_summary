clc
clear all
close all

% Definition of the matrix A
A = [50 1 2;
      1 5 2; 
      2 2 7];
% Definition of the B vector  
b = [1 0 0]';
% calculation of the 1-norm and inf-norm of the matrix A
norm(A,1)
norm(A,inf)

% Cheking the symmetry of matrix A
A == A'
% Checking the positive definite (i.e eigenvalues all positive)
eig(A) > 0
% yes the matrix is symmetry and psotive definite

% Let calculate the LU decomposition
[L1, U1] = lu(A)

% Let calculate the conditioning number 
cond(A,2) 
% The condition number is quite small, so the matrix is well conditioned.

% All the methods we saw are suitable for the solution of the linear system,
% since the matrix is symmetric and positive definite.
		  
% let consider the Jacobi method
D = diag( diag(A) );
E = -tril(A, -1);
% Bj= inv(D)*(D-A)
Bj = D \ (D-A) 
% calculation of the spectral radoius of the matrix
rhoBj = max(eig(Bj))

% calculation of the ssymptotic convergence rate
rate_jacobi = -log10(rhoBj)

% We now compute the estimate of the error after 4 iterations
x0 = zeros(3,1);
x1 = Bj*x0 + D\b;
% We estimate the error after four iteration with
% norm(x-x^{k+1}) <= norm(Bj)^{k+1}*norm(x^{1}-x^{0})) / (1-norm(Bj)
esterr4 = norm(Bj)^4/(1-norm(Bj))*norm(x1-x0)

% We now compute the approximated solution after four steps.
xj = x0;
gj = D \ b;
for i=1:4
    xj = Bj*xj + gj;
end

% Let rewrite the solution at the forrth step in the variable x4
x4 = xj
% Let calculate the xact solution
xtrue = A\b;
% The real error at the fourth iteration is
norm(xtrue-x4)

% The error is lower than the estimate as we expected it to be.
