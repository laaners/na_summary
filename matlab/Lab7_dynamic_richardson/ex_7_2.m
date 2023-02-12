

clc
clear all
close all

n = 50;
A = 4*eye(n) - diag(ones(n-1, 1), 1) - diag(ones(n-1, 1), -1) - diag(ones(n-2, 1), 2) - diag(ones(n-2, 1), -2);
b = 0.2*ones(n, 1);
I = eye(n);
T = 2*eye(n) - diag(ones(n-1, 1), 1) - diag(ones(n-1, 1), -1);

% Both matrices are clearly symmetric. The fact that all eigenvalues are
% positive reveals that they are also positive definite.

eig_A = eig(A)
eig_T = eig(T)

x0 = zeros(n, 1);
tol = 1e-6;
maxit = 10000;

alpha = 0.2
max(abs(eig(I - alpha*A))) % less than 1
[x1, iter1, incr1] = prec_rich_method(A, b, I, alpha, x0, tol, maxit)

alpha = 0.33
max(abs(eig(I - alpha*A))) % greater than 1
%[x2, iter2, incr2] = prec_rich_method(A, b, I, alpha, x0, tol, maxit) % we already know that it will not converge

alpha = 2/(min(eig_A) + max(eig_A))
max(abs(eig(I - alpha*A))) % less than 1
[x1, iter1, incr1] = prec_rich_method(A, b, I, alpha, x0, tol, maxit)

% Among the proposed values, the minimum number of iterations is obtained
% at alpha = alpha_opt

x0 = zeros(n, 1);
tol = 1e-6;
maxit = 10000;

Tinv_A = T\A;
eig_Tinv_A = eig(Tinv_A);
alpha = 2/(min(eig_Tinv_A) + max(eig_Tinv_A))
max(abs(eig(I - alpha*Tinv_A))) % less than 1
[x4, iter4, incr4] = prec_rich_method(A, b, T, alpha, x0, tol, maxit)

cond_A = cond(A)
cond_Tinv_A = cond(Tinv_A)

% Preconditioning the linear system with T results both in a
% better performance of the method (less iterations are needed) and a smaller condition number.

