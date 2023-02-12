% Solve x^2-5 = 0 to find the root sqrt(5)

clear all
close all
clc

xi = sqrt(5);

% method 1
phi1 = @(x) 5 + x - x.^2;
dphi1 = @(x) 1 - 2 .* x;
abs(dphi1(xi)) % check if converges, |\phi'(\alpha)| < 1?
% in this case does not converges, doe the check for all

phi2 = @(x) 5 ./ x;
dphi2 = @(x) -5 ./ x.^2;
abs(dphi2(xi)) % in this case == 1, we can't say anything

% phi3 and phi4....

phi4 = @(x) 1/2 * (x + 5 ./ x);
dphi4 = @(x) 1/2 - 5 ./ (2 * x.^2);
abs(dphi4(xi)) % will give like zero, so must derive again, we need order of convergence
% in this case we will find that ddphi4(xi) != 0, so quadratic convergence

% fixed point
tol = 1e-6;
maxit = 1000;

clc
x0 = xi + 0.001; % initial guess, assume we take it very close to zero
[xi1, x1] = fixed_point(phi1, x0, tol, maxit);
xi1 % does not converge as expected!
iter1 = numel(x1) - 1
% numel return number of components, so in this case number of iterations done
% -1 as vector of iteration contains starting point too, must not consider it

[xi2, x2] = fixed_point(phi2, x0, tol, maxit);
xi2
iter2 = numel(x2) -1

[xi4, x4] = fixed_point(phi4, x0, tol, maxit);
xi4
iter4 = numel(x4) -1
% in this case converges fast

