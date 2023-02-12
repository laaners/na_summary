clear all
close all
clc

a = -1;
b = 6;
f = @(x) atan(7 * (x - pi / 2)) + sin((x - pi / 2).^3);
% plot it to find zeros
plot(a:b, f(a:b));
% we will find xi = pi/2

xi_ex = pi / 2;
df = @(x) 7 ./ (1 + 49 * (x - pi / 2).^2) + 3 * (x - pi / 2).^2 .* cos((x - pi / 2).^3);
df(xi_ex);

% evaluate the derivative at zero to find the multiplicity
% in this case we get m = 1! So we can use standard Newton
x0 = 1.5; % initial guess
tol = 1e-10;
maxit = 1000;
[xi1, x_iter1] = newton (f, df, x0, tol, maxit);
xi1
iter1 = numel(x_iter1) -1
err1 = abs(xi1 - xi_ex)

% to show that Newton does not converge
x0 = 4;
[xi2, x_iter2] = newton(f, df, x0, tol, maxit);
xi2
iter2 = numel(x_iter2) - 1
err2 = abs(xi2 -xi_ex)
% we would like to perform bisection 5 times
% as Nmax = ceil(log((b-a)/tol)/log(2));, we choose a
% TOL = (b-a)/2^k

% point d
tol = (b - a) / (2^30); % so 30 k/Nmax iterations
[xi3, x_iter3] = bisection(f, a, b, tol);
xi3
numel(x_iter3) - 1

% point e
tol_bisection = (b - a) / (2^5);
tol_newton = 1e-10;
maxit_newton = 1000;
[xi4, x_iter_bisection, x_iter_newton] = bisection_newton(f, df, a, b, tol_bisection, tol_newton, maxit_newton, 1);
xi4
numel(x_iter_bisection)
numel(x_iter_newton)
