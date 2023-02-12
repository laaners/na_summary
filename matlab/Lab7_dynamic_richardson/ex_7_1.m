clc
clear all
close all

n = 8;
A = diag(8*ones(8,1)) + diag(2*ones(7,1),1) + diag(2*ones(7,1),-1);
eig(A)
b = A*ones(8,1);

% Preconditioner
D = diag( diag(A) );
E = -tril(A, -1);

eig(D)
eig(D-E)
pause

Bj = D \ (D-A) ;      % Jacobi method
Bgs =  (D-E) \ (D-E-A);       % Gauss-Seidel method

rhoBj = max( abs( eig(Bj) ) )
rhoBgs = max( abs( eig(Bgs) ) )

% It can be noted that both spectral radii are less than 1, so that both 
% method are convergent, and that the spectral radius of the 
% Gauss-Seidel method is the square of the spectral radius of the Jacobi method.

% A tridiag, non singular, a_ii !=0 --> Jac conv iff GS conv
% If both convergent, then rho(B_gs)=rho(B_j)^2

% Iteration vector

x0 = zeros(n, 1);
tol = 1e-12;
maxit = 1000;

% Jacobi
normBj = norm(Bj, 2);
gj = D \ b;
x1j = Bj*x0 + gj;
kjmin_2 = log(tol*(1 - normBj)/norm(x1j-x0)) / log(normBj);

% Rounding up to the first integer the estimate says that tolerance
% will be satisfied in no more than 40 iterations.

% Estimate implemented at lesson
% P = D;
% C = (cond(P\A) - 1)/(cond(P\A) + 1);
% kjmin = log(tol/sqrt( (x1j-x0)'*A*(x1j-x0) ))/log(C)

% Gauss-Seidel
normBgs = norm(Bgs);
ggs = (D-E) \ b;
x1gs = Bgs*x0 + ggs;
kgsmin_2 = log(tol*(1 - normBgs)/norm(x1gs-x0)) / log(normBgs);

% The estimate says that tolerance will be satisfied in no more than 26 iterations

% Estimate implemented at lesson
% P = D-E;
% C = (cond(P\A) - 1)/(cond(P\A) + 1);
% kgsmin = log(tol/sqrt( (x1j-x0)'*A*(x1j-x0) ))/log(C)

% Jacobi method
[xj, iterj, incrj] = prec_rich_method(A, b, D, 1., x0, tol, maxit);

% Gauss-Seidel method
[xgs, itergs, incrgs] = prec_rich_method(A, b, D-E, 1., x0, tol, maxit);


