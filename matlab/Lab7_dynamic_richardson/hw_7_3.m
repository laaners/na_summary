clc
clear all
close all

% Matrix definition.
n = 5;
B = rand(5) + diag (10* ones (n ,1)) ;
A = B*B' ;

A == A' % the matrix i symmetric
eig(A) > 0 % the matrix is positive definte

% --> Gauss-Seidel method converges for any initialguess x (0)

% Iteration matrices.
D = diag( diag(A) );
E = -tril(A, -1);
% Bj= inv(D)*(D-A)
Bj = D \ (D-A) 
% Bgs =  inv(D-E)*(D-E-A)
Bgs =  (D-E) \ (D-E-A)

% Moreover, the 1,2 and infinity norms of Bj and Bgs for all matrices A are
% ALL bigger than 1. So we cannot use this argument to conclude convergence
% for any case.
% Hence we have to compute the spectral radii of both matrices to determine
% whether the methods are convergent or not.

rhoBj = max( abs( eig(Bj) ) )
rhoBgs = max( abs( eig(Bgs) ) )

% --> Jacobi  (and Gauss-Seidel) method converges for any initialguess x (0)

xex = ones(n,1);       % Exact solution
b = A*xex;            % Right hand side

% Iteration vector
gj  = D \ b;
ggs = (D-E) \ b;

x0 = zeros(n,1);
tol = 1e-12;
maxit = 100;

% Jacobi method
[xj, iterj, incrj] = stationary_method(Bj, gj, x0, tol, maxit)

% Gauss-Seidel method
[xgs, itergs, incrgs] = stationary_method(Bgs, ggs, x0, tol, maxit)

