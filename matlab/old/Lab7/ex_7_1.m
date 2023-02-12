clear all
clearvars
clc

A = diag(8 * ones(8, 1)) + diag(2 * ones(7, 1), 1) + diag(2 * ones(7, 1), -1);
b = A * ones(8, 1);

%% a) Analyze convergence of the Jacobi and Gauss-Seidel====================
% consistency and spectral radius
% JACOBI
% A = D-E+(A-(D-E))
% where D=diagonal part of A=diag(A)
% where E lower triagular part
% B = inv(D)*(D-A)
% g = inv(D)*b
% BUT WE CANNOT USE inv(), but as D is diagonal, inv(D) = 1/D
% Ax = b -> x = A \ b
% DB = (D-A) -> B = D \ (D-A)

D = diag(diag(A));
% diag once gives me vector of diag, call diag on vector gives me diagonal matrix

B_j = D \ (D - A);
g_j = D \ b;

% GAUSS-SEIDEL
% g = inv(D-E)*b
% How to find inv(D-E) without inv()?
% If we have inv(A)w=z, we can both multiply by A
% A*inv(A)w = A*z -> w=Az, so z = A\b!!!
% So for use g = (D-E)\b
% Same holds for matrices, inv(A)*B = C -> C = A\B

E = -tril(A, -1);
% -1 will put diagonal at 0 and uppertriangular 0

B_gs = (D - E) \ (D - E - A);
g_gs = (D - E) \ b;

% Convergence of both, we compute the 2norm of iteration matrices

norm(B_j);
norm(B_gs);

% If bigger than 1, compute spectral radius
rhoB_j = max(abs(eig(B_j)))
rhoB_gs = max(abs(eig(B_gs)))

% We if a spectral norm > 1, the method will not converge

% Alternatively for Gauss-Seidel check if either
% 1 A strictly dominant by rows (works for Jacobi as well)
if all((2 * abs(diag(A))) - sum(abs(A), 2) >= 0) == 1
    disp('Strictly dominant by rows');
end

% 2 A strictly dominant by cols (works for Jacobi as well)
if all((2 * abs(diag(A))) - sum(abs(A)) >= 0) == 1
    disp('Strictly dominant by cols');
end

% 3 A spd
% - all eigenvalues are real (s)
% - all eigenvalues are > 0 (pd)
eigenvalues = eig(A);

if isreal(eigenvalues) == 1 && all(eigenvalues > 0) == 1
    disp('A is spd');
end

% Also, as A is tridiagonal nonsingular, J converges <-> GS converges
% and rhoB_gs = rhoB_j^2

%% b) Initial guess of 0, tol of 1e-12, find #iterations====================
% J
TOL = 1e-12;
x0 = zeros(8,1);
x1 = B_j*x0 + g_j;
kmin = log(TOL * (1 - norm(B_j) / log(norm(x1-x0))))/log(norm(B_j))

% GS
TOL = 1e-12;
x0 = zeros(8,1);
x1 = B_gs*x0 + g_gs;
kmin = log(TOL * (1 - norm(B_gs) / log(norm(x1-x0))))/log(norm(B_gs))

%% c) See pre_rich_method====================

%% d) Solve with Jacobi and Gauss-Seidel====================
alpha = 1; % for both J and GS
% P = D for J
% P = D-E for GS
[x, iter, incr] = prec_rich_method(A, b, D, alpha, zeros(8, 1), TOL, 1000);
x
iter
incr
[x, iter, incr] = prec_rich_method(A, b, D - E, alpha, zeros(8, 1), TOL, 1000);
x
iter
incr
