close all
clearvars
clc

% [a]--------------------------------------
eps = 1e-6;

A = diag([1, 1, eps]);
% we are using single precision, eps will show 0.000
% Use "format long"

format long

K_1 = cond(A, 1)
K_2 = cond(A, 2) % or just cond(A)
K_inf = cond(A, inf)
"================================"
% [b]--------------------------------------
b = [1 0 0]';
x = A \ b
% perturbed solution
for alfa = [1e-6, 1e-12]
    deltab = [0 0 alfa]';
    x_pert = A \ (b + deltab)
    % we want to find delta x
    deltax = x_pert - x;
    % perturbation on solution
    pert = norm(deltax) / norm(x)
end
"================================"
% [c]--------------------------------------
for alfa = [1e-6, 1e-12]
    deltab = [alfa 0 0]';
    x_pert = A \ (b + deltab)
    % we want to find delta x
    deltax = x_pert - x;
    % perturbation on solution
    pert = norm(deltax) / norm(x)
end
