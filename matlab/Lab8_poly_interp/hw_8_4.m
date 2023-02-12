clc
clear all
close all

x_plot = linspace(0, 2, 1000);
f = @(x) 1*(x >= 1);

figure
plot(x_plot, f(x_plot), 'b-', 'LineWidth', 2)
hold on, box on
axis([-0.1 2.1 -1 2])
set(gca, 'FontSize', 16)
set(gca, 'LineWidth', 1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)

% Equispaced nodes

for n = [2, 4, 8, 16, 32]
  x = linspace(0, 2, n);

  coeff = polyfit(x, f(x), n-1);

  pn = polyval(coeff, x_plot);

  plot(x_plot, pn, 'r-', 'LineWidth',2)
  pause
end

% The result is very poor, for many reasons.
% The function to be interpolated is discontinuous,
% the interpolating polynomial has too many oscillations and
% the computation of the polynomial becomes ill-conditioned when
% the number of nodes increases.

% Piecewise linear polynomials

figure
plot(x_plot, f(x_plot), 'b-', 'LineWidth', 2)
hold on, box on
axis([-0.1 2.1 -1 2])
set(gca, 'FontSize', 16)
set(gca, 'LineWidth', 1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)

for n = [2, 4, 8, 16, 32]
  x = linspace(0, 2, n);

  s_plot = interp1(x,f(x),x_plot);
  plot(x_plot, s_plot, 'g-','LineWidth', 2)

  pause
end

% With linear splines the interpolation approximates the function
% with increasing precision, since for big n the slope at
% the discontinuity gets higher.

figure
plot(x_plot, f(x_plot), 'b-', 'LineWidth', 2)
hold on, box on
axis([-0.1 2.1 -1 2])
set(gca, 'FontSize', 16)
set(gca, 'LineWidth', 1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)

x = linspace(0, 2, 15);

for n = [2, 4, 8, 16, 32]
  
  v = polyfit(x,f(x), n);
  s_plot = polyval(v, x_plot);
  plot(x_plot, s_plot, 'g-','LineWidth', 2)

  pause
end

% Once again the result is very poor.
% The function to be interpolated is discontinuous,
% the interpolating polynomial has too many oscillations and
% the computation of the polynomial becomes ill-conditioned when
% the number of nodes increases because the interpolant tends to be smooth.
