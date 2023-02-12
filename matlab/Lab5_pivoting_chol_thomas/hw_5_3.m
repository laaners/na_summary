clc
clear all
close all

a = 2;
b = 1;
n = 10;
A = diag(a * ones(n, 1)) + diag(b * ones(n-1,1), -1) + diag(b * ones(n-1,1), +1);
eig(A)
% All the eigenvalues are positive and it is trivial to prove the simmetry.

V = chol(A)
format short e
V'*V - A
% V is bidiagonal since Cholesky decomposition preserves the pattern of the
% matrix.