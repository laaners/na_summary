clc
clear all
close all

n = 4;

alpha = 1e-4;

A = eye(n);
A(1, n) = 1/alpha;

D = diag( diag(A) );
L = tril(A,-1);
U = triu(A,1);

J = -D \ (L+U);
J^2
J^3

% Since J^2 is null the method will converge after the first iteration
% to the exact solution.

b = ones(n, 1);
x = b;
gJ = D \ b;
dx = b;
counter = 0;
while norm(dx, inf) >= 1e-9 
  xold = x;
  x = J*x + gJ;
  dx = x - xold;
  norm(dx);
  counter = counter + 1;
end
counter
x

B = A'*A

DD = diag( diag(B) );
LL = tril(B,-1);
UU = triu(B,1);

G = -(DD+LL) \ UU;

% B is built to be symmetric and positive definite.
% Gauss -Seidel method converges

format long e
rhoG = max(abs(eig(G)))

% However the spetral radius is very close to 1!!
% We expect extremely slow convergence!
