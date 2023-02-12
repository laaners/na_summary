clc
clear all
close all

a = -1;
b = 1;
f = @(x) abs(x - pi / 12);

xx = linspace(a, b, 100);

%% a) RUNGE
for n = [2:2:14]
    x = linspace(a, b, n + 1);
    y = f(x);
    coef = polyfit(x, y, n);
    yy = polyval(coef, xx);
    plot(xx, yy);
    hold on;
end

%% b) PIECEWISE
% n subintervals, n+1 interpolating nodes obviously (partitions)
% for interpolation error use max(abs(Error(plotting_nodes)))
% or use norm(Error(plotting_nodes),'inf')
a = -1;
b = 1;
f = @(x) abs(x - pi/12); 
x_plot = linspace(a, b, 101);

n_vect = [1 2 4 8 16 32];

figure;
for (i = 1:numel(n_vect))
    n = n_vect(i)
    
    x = linspace(a, b, n+1);
    y = f(x);
  
    y_plot = interp1(x, y, x_plot);
    plot(x_plot, f(x_plot), 'k-', x_plot, y_plot, 'r-', x, y, 'rx', 'LineWidth', 2, 'MarkerSize', 8)
    
    error(i) = norm((f(x_plot) - y_plot),'inf');
    pause
end

error

% to estimate order of the convergence, we have to plot the step size H versus the error
H = (b-a)./n_vect;

figure;
loglog(H,error);
loglog(H,H);
loglog(H,H.^2);
% slope of the lines are convergence rate
