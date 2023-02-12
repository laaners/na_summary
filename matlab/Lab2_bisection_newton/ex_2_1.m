% EXERCISE 2.1
% closes all figures whose handles are visible
close all
clear all
clc

addpath('../utils')

f = @(x) x .^ 3 - (2 + exp(1)) * x .^ 2 + (2 * exp(1) + 1) * x + (1 - exp(1)) - cosh(x - 1);
%f= @(x) x.^3-(2 + exp(1))*x.^2 + (2*exp(1) + 2)*x + (1 - exp(1)) - sinh(x - 1);

% plot the function f

a = 0.5;
b = 5.5;

x_plot = linspace(a, b, 1000);
plot(x_plot, f(x_plot));
grid on
pause

% from the plot two different roots can be identified. The bisection method,
% nevertheless, can be applied only to the root on the right: the one
% belonging to the interval [3,5]. Actually, in the other case, there isn't
% any interval such that the first derivative has constant sign and the
% root belongs to this interval. Therefore the Bolzano theorem hypothesis
% are not respected in this case.

%%
% find the root belonging to [3,5] by means of the bisection algorithm

a = 3;
b = 5;
tol = 1.e-3;

[x, x_iter] = bisection(f, a, b, tol);
x

%%
% plot the iterations on the function

x_plot = linspace(a, b, 1000);
figure
plot(x_plot, f(x_plot));
title("Iterations required to reach the tollerance:", length(x_iter))
grid on
hold on
disp('Press any key...');

for i = 1:length(x_iter)
    plot(x_iter(i), f(x_iter(i)), 'r*')
end
