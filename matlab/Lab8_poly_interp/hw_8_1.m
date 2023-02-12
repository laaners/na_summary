clc
clear all
close all

f = @(x) exp(x);

% a)
% Using Theorem 10.2 and imposing that the right hand side is less or equal
% than 1e-3 

h = sqrt( 1e-3 * 8 / exp(1) )

n = ceil(2 / h) + 1 % = 38


% b)

x = linspace(-1, 1, n);
y = exp(x);

x_plot = linspace(-1, 1, 1000);
y_plot = interp1(x,y,x_plot);

figure
plot(x_plot, f(x_plot), 'k-', x_plot, y_plot, 'r-', x, y, 'rx', 'LineWidth', 2, 'MarkerSize', 8)
axis([-1.1 1.1 0 3])
set(gca,'FontSize', 16)
set(gca,'LineWidth', 1.5)

err = max(abs(f(x_plot) - y_plot))

% The requirement is satisfied.
