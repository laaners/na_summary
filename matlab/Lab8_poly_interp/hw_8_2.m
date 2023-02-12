clc
clear all
close all

f = @(x) 1./((x - 0.3).^2 + 0.01) + 1./(x.^2 + 0.04) - 6;

% a)

n = 10;
x = linspace(-1, 3, n)';
fx = f(x);

coeff_polyfit = polyfit(x, fx, n-1);

x_plot = linspace(-1, 3, 1000);

p_equally = polyval(coeff_polyfit, x_plot);

figure
subplot(2,1,1)
plot(x_plot, f(x_plot), '-b', 'LineWidth', 2)
hold on, box on
plot(x_plot, p_equally, '-r', 'LineWidth',2)
plot(x, f(x), 'rx','LineWidth',2, 'MarkerSize',10)
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)
legend('f', 'p_{equally}')

% b)

err_equally = abs(f(x_plot) - p_equally);

subplot(2,1,2)
hold on, box on
plot(x_plot, err_equally, '-r', 'LineWidth',2)
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('|e(x)|','FontSize',16)
legend('p_{equally}')

