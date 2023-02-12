clc
clear all
close all

% Set the Runge function
f = @(x) 1./(1 + x.^2); 
% Set the point to build the plot of the Rung function
xx = linspace(-5, 5, 1000);
fxx = f(xx);

% Plot the Runge function
figure
subplot(1,2,1)
hold on, box on
plot(xx, fxx, 'k-', 'LineWidth',2)
axis([-5.1 5.1 -0.4 1.2])
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)

% Plot the Linear interpolant polynomial
for k = [2:2:10]
  x = linspace(-5, 5, k);
  fx = f(x);
  coef = polyfit(x, fx, k-1);
  yy = polyval(coef, xx);
  plot(xx, yy, 'r-', 'LineWidth',2)
  norm((fxx-yy),'inf')
  pause
end

% Plot the Runge function
subplot(1,2,2)
hold on, box on
plot(xx, fxx, 'k-', 'LineWidth',2)
axis([-5.1 5.1 -1.2 2.4])
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)

% Plot the Linear interpolant polynomial
for k = [12:2:16]
  x = linspace(-5, 5, k);
  fx = f(x);
  coef = polyfit(x, fx, k-1);    
  yy = polyval(coef, xx);
  plot(xx, yy, 'r-', 'LineWidth',2)
  norm((fxx-yy),'inf')
  pause
end

% The interpolation polynomials approach the function in the middle
% of the interval, but close to the boundaries increasing oscillations appear.

% b) Compute the piecewise linear interpolation (interp1 command) with
% n = 1, 2, 4, 8, 16, 32 elements and plot the result. Find the error

clear all
a = -5;
b = 5;
f = @(x) 1./(1+x.^2); 
x_plot = linspace(a, b, 101);

n_vect = [1 2 4 8 16 32 64 128];

figure
for (i = 1:numel(n_vect))
  n = n_vect(i)
  
  x = linspace(a, b, n+1);
  y = f(x);

  y_plot = interp1(x, y, x_plot);
  plot(x_plot, f(x_plot), 'k-', x_plot, y_plot, 'r-', x, y, 'rx', 'LineWidth', 2, 'MarkerSize', 8)
  axis([a-0.2 b+0.2 -0.1+min(f(x_plot)) 0.1+max(f(x_plot))])
  set(gca,'FontSize', 16)
  set(gca,'LineWidth', 1.5)
  
  error(i) = max(abs(f(x_plot) - y_plot));
  pause
end

H = 10./n_vect
pause

figure
loglog(H, error, 'bx-', 'LineWidth', 2, 'MarkerSize', 8)
hold on, box on
loglog(H, H.^(2), 'g-', 'LineWidth', 2)
axis([1e-1 1e1 1e-3 1e2])
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('h','FontSize',16)
ylabel('error','FontSize',16)
legend('error', 'O(h^2)', 'Location', 'ne');

% From the graph we can conclude that the convergence order is 2,
% as predicted by the theory.
% Calculation of the error
order = (log(error(1:end-1) ./ error(2:end))/log(2))'
% or using the diff command build in in matlab
p = -diff(log(error)) / log(2)

% c) Interpolation of the Runge function using a piecewise cubic spline on
% the same number of iterpolating points

figure
for (i = 1:numel(n_vect))
  n = n_vect(i)
  
  x = linspace(a, b, n+1);
  y = f(x);

  y_plot = spline(x, y, x_plot);
  plot(x_plot, f(x_plot), 'k-', x_plot, y_plot, 'r-', x, y, 'rx', 'LineWidth', 2, 'MarkerSize', 8)
  axis([a-0.2 b+0.2 -0.1+min(f(x_plot)) 0.1+max(f(x_plot))])
  set(gca,'FontSize', 16)
  set(gca,'LineWidth', 1.5)
  
  pause
end

% d) Computation of the linera interpolant by using the Chebyshev nodes

xx = linspace(-5, 5, 1000);

figure;
for (i = 1:numel(n_vect)-2)
  n = n_vect(i) ;
  
  % Calculation of the Chebyshev nodes
  ii = 0:n;
  x_cap = -cos(pi*ii/n);
  x = 0.5*(a+b) + 0.5*(b-a)*x_cap;
  y = f(x);
  
  coef = polyfit(x, y, n);    
  yy = polyval(coef, xx);
  
  plot(xx, f(xx), 'k-', xx, yy, 'r-', x, y, 'rx', 'LineWidth', 2, 'MarkerSize', 8)
  axis([a-0.2 b+0.2 -0.1+min(f(xx)) 0.1+max(f(xx))])
  set(gca,'FontSize', 16)
  set(gca,'LineWidth', 1.5)
  
  error(i) = max(abs(f(xx) - yy));
  
  
  pause
  
end

order = (log(error(1:end-1) ./ error(2:end))/log(2))'