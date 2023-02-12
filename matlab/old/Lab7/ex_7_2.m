clear all
clearvars
clc
disp('-------------------------------------------------')
A = diag(4 * ones(50, 1)) + diag(-1 * ones(49, 1), 1) + diag(-1 * ones(49, 1), -1) + diag(-1 * ones(48, 1), 2) + diag(-1 * ones(48, 1), -2);

T = diag(2 * ones(50, 1)) + diag(-1 * ones(49, 1), 1) + diag(-1 * ones(49, 1), -1);

b = 0.2 * ones(50, 1);

%% a) check spd=================================================
% - all eigenvalues are real (s)
% - all eigenvalues are > 0 (pd)
eigenvalues = eig(A);

if isreal(eigenvalues) == 1 && all(eigenvalues > 0) == 1
    disp('A is spd');
end

norm(A)

eigenvalues = eig(T);

if isreal(eigenvalues) == 1 && all(eigenvalues > 0) == 1
    disp('T is spd');
end

norm(T)

%% b) richardson from x0 = 0 =================================================
TOL = 1e-6;
P = eye(50);
alpha = 0.2;
[x_0_2, iter, incr] = prec_rich_method(A, b, P, alpha, zeros(50, 1), TOL, 1000)

alpha = 0.33;
[x_0_33, iter, incr] = prec_rich_method(A, b, P, alpha, zeros(50, 1), TOL, 1000)

alpha = 2 / (max(eig(P \ A))+min(eig(P \ A))) % but as P = eye, the preconditioned matrix P^-1A=P\A is A itself
[x_opt, iter, incr] = prec_rich_method(A, b, P, alpha, zeros(50, 1), TOL, 1000)

%% c) T as P=================================================
P = T;
alpha = 2 / (max(eig(P \ A))+min(eig(P \ A)))
[x_T, iter, incr] = prec_rich_method(A, b, P, alpha, zeros(50, 1), TOL, 1000)
% this one will be the most accurate with kmin

x_real = A \ b

%% a) check spd=================================================
%% a) check spd=================================================
%% a) check spd=================================================
