

clear all
close all
clc
% HOMEWORK 2.5

f = @(x) x.^3 - x.^2 - x + 1;
df = @(x) 3*x.^2 - 2*x - 1;
rootfinding_function_plot(f, -2, 2, true);

tol = 1e-6
nmax = 100;
[xin, xn] = newton25(f, df, 2, tol, nmax);
xin
itern = numel(xn)

[xinmod, xnmod] = newton25(f, df, 2, tol, nmax, 2);
xinmod
iternmod = numel(xnmod)

err_newton = abs(xn - 1);
err_newton2 = abs(xnmod - 1);

figure
semilogy(err_newton, 'bs--','LineWidth',2)
hold on, box on
semilogy(err_newton2, 'ro-','LineWidth',2)
axis([0 itern+1 1e-12 10])
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('iterations','FontSize',16)
ylabel('error','FontSize',16)
h = legend('Newton', 'Modified Newton');
set(h,'FontSize',16)
