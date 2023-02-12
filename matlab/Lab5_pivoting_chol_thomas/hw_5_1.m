clc
clear all
close all

A = [1 2 1 1;
     1 4 0 2;
     2 10 4 0;
     1 0 2 2];
 
b = [3 3 10 1]';

[L, U] = lu(A);
figure()
spy(L) % L is not lower triangular => pivoting is needed
 
[L, U, P] = lu(A);
figure()
spy(L) % OK!

y = L\(P*b);
x = U\y

xex = A\b

detA = prod(diag(U))/det(P)
det(A)

% Thanks to the usual Binet formula, we have det(PA) = det(P)det(A) =
% det(LU) = det(L)det(U)