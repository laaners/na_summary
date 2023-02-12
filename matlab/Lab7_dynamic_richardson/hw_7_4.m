clc
clear all
close all

% Definition of the matrix A
A = diag(3*ones(6,1)) - diag(ones(5,1), 1) - diag(ones(5,1), -1);
A(1, 6) = -1;
A(2, 5) = -1;
A(5, 2) = -1;
A(6, 1) = -1;
% Visualization of the matrix A
A
% Definition of the vector b
b = [1 0 1 1 0 1]';

A == A'
eig(A) > 0
% The matrix is clearly symmetric, and the computation of the eigenvalues 
% shows that is positive definite, so the Gauss-Seidel method converges. 
% We cannot conclude anything on the convergence of the Jacobi method because
% the matrix is only weakly diagonally dominant.

% Calculation of the spectral radius of the iteration matrices
D = diag( diag(A) );
E = -tril(A, -1);
% Bj= inv(D)*(D-A)
Bj = D \ (D-A) 
% Bgs =  inv(D-E)*(D-E-A)
Bgs =  (D-E) \ (D-E-A)
rhoBj = max( abs( eig(Bj) ) )
rhoBgs = max( abs( eig(Bgs) ) )

% Both Jacobi and Gauss-Seidel method will converge because 
% their spectral radius are less than 1

x0 = zeros(6,1);
tol = 1e-8;

% Jacobi
normBj = norm(Bj, 2)     % Choose 2-norm becuase the implementation of stationary_method provides stopping criterion in 2-norm. This is actually the spectral radius itself, since matrix A is symmetric.
gj = D \ b;
x1j = Bj*x0 + gj;

% norm(e^{k+1}) <= norm(Bj)*norm(e^{k}); or with tringular inequality
% norm(e^{k+1}) <= norm(Bj)*(norm((x-x^{k+1})+(x^{k+1}-x^{k})))<=norm(Bj)*(norm(x-x^{k+1})+norm(x^{k+1}-x^{k}))
% = norm(Bj)*(norm(e^{k+1})+norm(x^{k+1}-x^{k})) from which
% norm(x-x^{k+1})<= norm(Bj)*norm(x^{k+1}-x^{k})) / (1-norm(Bj)) because norm(Bj)<1 
% now starting from k=0 and applying recursively the inequality we end up
% with the following estimation:
% norm(x-x^{k+1}) <= norm(Bj)^{k+1}*norm(x^{1}-x^{0})) / (1-norm(Bj)
% from which taking the log having set norm(x-x^{k+1}) = tol:
% k ~= log(tol*(1-norm(Bj)/norm(x^{1}-x^{0}))/ log (norm(Bj)

kjmin_2 = log(tol*(1 - normBj)/norm(x1j-x0)) / log(normBj)

% Rounding up to the first integer tbhe estimate says that tolerance
% will be satisfied in no more than 91 iterations.

% Gauss-Seidel
%normBgs = norm(Bgs)
ggs = (D-E) \ b;
x1gs = Bgs*x0 + ggs;
normBgs = norm(Bgs, 2) ;

% following the same procedure used for the jacobi method
kgsmin_2 = log(tol*(1 - normBgs)/norm(x1gs-x0)) / log(normBgs)

% The estimate says that tolerance will be satisfied in no more than 89 iterations

[xj,niterj] = stationary_method(Bj, gj, x0, tol, 1000)
[xgs,nitergs] = stationary_method(Bgs, ggs, x0, tol, 1000)

% We get convergence in respectively 83 and 45 iteration, in accordance
% with what we found from the estimates.
