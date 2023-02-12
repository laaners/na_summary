% ESERCIZIO 2.2

close all
clear all

f = @(x) sin(x) .* (1 - x) .^ 2;
df = @(x) cos(x) .* (1 - x) .^ 2 - 2 * sin(x) .* (1 - x);
x_plot = linspace(-0.5, 1.5, 1000);
plot(x_plot, f(x_plot));
grid on

% x0=0.3 --> root = 0

[x1, x1_iter] = newton(f, df, 0.3, 1.e-6, 100);
err1 = abs(x1_iter - 0)
pause

% estimate of the convergence order
p = log(err1(3:end) ./ err1(2:end - 1)) ./ log(err1(2:end - 1) ./ err1(1:end - 2))
figure;
plot(p);
title('convergence order, root x1=0');

% Simple zero => p = 2

% x0=0.5 --> root = 1

[x2, x2_iter] = newton(f, df, 0.5, 1.e-6, 100);
err2 = abs(x2_iter - 1);

% estimate of the convergence order
p = log(err2(3:end) ./ err2(2:end - 1)) ./ log(err2(2:end - 1) ./ err2(1:end - 2))
figure;
plot(p);
title('convergence order, root x2=1');

% Double zero => p = 1

% Errors behaviour
figure;
semilogy(err1);
hold on
semilogy(err2, 'g');
legend('x1=0', 'x2=1');
title('Errors');

% The error for x1 = 0 gets small faster than the error for x2 = 1
% This is due to the different order of convergence of the scheme for x1 e
% x2

% For details on the order of convergence, wait for next lab.
