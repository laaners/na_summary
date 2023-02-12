clc
clear all
close all

f = @(x) x.^5 + 1;

x = [0 0.2 0.4 0.6];
p3 = polyfit(x, f(x), 3)

x_plot = linspace(0, 0.6, 1000);
p3_plot = polyval(p3, x_plot);

figure
plot(x, f(x), 'rx','LineWidth', 2, 'MarkerSize', 10)
hold on, box on
plot(x_plot, f(x_plot), 'b--', 'LineWidth', 2)
plot(x_plot, p3_plot, 'r-', 'LineWidth', 2)
axis([-0.05 0.65 0.99 1.09])
set(gca, 'FontSize', 16)
set(gca, 'LineWidth', 1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)
leg = legend('nodes', 'f', 'p3', 'Location', 'nw');

err = max(abs(f(x_plot) - p3_plot))
err_estimate = 72*(0.2)^4/(4*4)

% This is consistent with the estimate.

% b)

s3_plot = interp1(x,f(x),x_plot);
plot(x_plot, s3_plot, 'g-','LineWidth', 2)
leg = legend('nodes', 'f', 'p3', 's3', 'Location', 'nw');

err = max(abs(f(x_plot) - s3_plot))
err_estimate = 1/8*0.2^2*20*(0.6)^3

% This is consistent with the estimate.