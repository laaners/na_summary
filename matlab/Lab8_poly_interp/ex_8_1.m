clc
clear all
close all


f = @(x) x.*sin(x);
a = -2;
b = 6;

% a) Lagrange interpolation  
% Set the order of lagrange interpolation
n = 4;  %n = 6; %n = 8;

% Set the equally spaced nodes position in the interval a b 
x_nodes = linspace(a, b, n+1);
% Evaluation of the funtion in the equally spaced nodes
y_nodes = f(x_nodes);
% Lagrange interpolation using polyfit function
interp_coeff = polyfit(x_nodes, y_nodes, n);
% Plot the funtion and its polynomial interpolation
x_plot = linspace(a, b, 1000);
f_plot = f(x_plot);
interp_plot = polyval(interp_coeff, x_plot);
figure;
plot(x_plot, f_plot, '--',x_plot, interp_plot, x_nodes, y_nodes, 'o','LineWidth',2,'MarkerSize',12);
xlim([a-0.1, b+0.1]);

% b) Estimation of the interpolation error using what reported in slides
% (Remember the Infinite norm
% corresponds to take the maximum of the ads value)

% calculation of the maximum in the derivative term 
if (n == 4)
  % the n+1-th derivative is 5 sin(x) + x cos(x). An upper bound of its absolute value is
  deriv_upper_bound = 11 ;
elseif (n == 6)
  % the n+1-th derivative is -7 sin(x) - x cos(x). An upper bound of its absolute value is
  deriv_upper_bound = 13 ;
elseif (n == 8)
  % the n+1-th derivative is 9 sin(x) + x cos(x). An upper bound of its absolute value is
  deriv_upper_bound = 15 ;
else
  error('Wrong n');
end
% evaluation of the upper bound of the error (Remember the Infinite norm
% corresponds to take the maximum of the ads value) 
err_est = (x_nodes(2)-x_nodes(1))^(n+1)/(4*(n+1)) * deriv_upper_bound;

% Calculation of the error
% err_norm = norm((f_plot - interp_plot),'inf');
err = abs(f_plot - interp_plot);
% Plotting the 
figure;
plot(x_plot, err, '-b','LineWidth',2,'MarkerSize',12);
hold on;
plot(x_plot, err_est*ones(size(x_plot)), '-r','LineWidth',2,'MarkerSize',12)

% The interpolation on equally spaced nodes produces a non uniform error
% in the interval, which grows towards the extreme points.

% c-1) Computation of the piecewise linear interpolant using interp1 Matlab command  
% on equally spaced nodes

% Setting the posion of the nodes
n = 5; % n=10, n=20
xint = linspace(a, b, n+1);
% Evaluation of the function in the interpolating nodes
yint = f(xint);
% Calculation of the piecewise linear interpolant and evaluation of 
% the interpolant in the x_plot node to visualize the function in the plot
y_plot = interp1(xint, yint, x_plot);
% Plotting 
figure;
plot(x_plot, f(x_plot), 'k-', x_plot, y_plot, 'r-', xint, yint, 'rx', 'LineWidth', 2, 'MarkerSize', 8)
title('Piecewise Linear interpolation') ;

% c-2) Computation of the spine line interpolant using spline Matlab command  
% on equally spaced nodes

xsp = linspace(a, b, n+1);
ysp = f(xsp);
y_plot = spline(xsp, ysp, x_plot);

figure;
plot(x_plot, f(x_plot), 'k-', x_plot, y_plot, 'r-', xsp, ysp, 'rx', 'LineWidth', 2, 'MarkerSize', 8)
title ('Spline interpolation')