close all
clearvars
clc

A1 = [
    1 2 2;
    1 1 1;
    2 2 1
    ];

A2 = [
    2 1 -2;
    1 2 1;
    2 1 2
    ];

A3 = [
    1 2 -2;
    1 1 1;
    2 2 1
    ];

A4 = [
    1 1 -2;
    1 2 1;
    2 1 2
    ];

x = [1 2 3]';

A = A2;
b = inv(A) \ x;

% JACOBI
% A = D-E+(A-(D-E))
% where D=diagonal part of A=diag(A)
% where E lower triagular part
% B = inv(D)*(D-A)
% g = inv(D)*b
% BUT WE CANNOT USE inv(), but as D is diagonal, inv(D) = 1/D

D = diag(diag(A));
% diag once gives me vector of diag, call diag on vector gives me diagonal matrix

E = -tril(A, -1);
% -1 will put diagonal at 0 and uppertriangular 0

B_j = D \ (D - A);
g_j = D \ b;

% GAUSS-SEIDEL
% g = inv(D-E)*b
% How to find inv(D-E) without inv()?
% If we have inv(A)w=z, we can both multiply by A
% A*inv(A)w = A*z -> w=Az, so z = A\b!!!
% So for use g = (D-E)\b
% Same holds for matrices, inv(A)*B = C -> C = A\B

B_gs = (D - E) \ (D - E - A);
g_gs = (D - E) \ b;

% Convergence of both, we compute the 2norm of iteration matrices

norm(B_j);
norm(B_gs);

% If bigger than 1, compute spectral radius
rhoB_j = max(abs(eig(B_j)));
rhoB_gs = max(abs(eig(B_gs)));

% If a spectral norm > 1, the method will not converge
% Finally solve the system

x0 = [0 0 0]';
tol = 1.e-6;
max_it = 100;
[x, iter, incr] = stationary_method(B_gs, g_gs, x0, tol, max_it)

% In this case Jacobi does not converge, so we will reach max number of iteration
% While gs reaches [1 2 3]
