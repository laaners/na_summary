clc
clear all
close all

% Setting the function and its visualization
a = -1;
b = 1;
f = @(x) abs(x - pi/12); 

xx = linspace(a, b, 1000);
fxx = f(xx);

figure
subplot(1,2,1)
hold on, box on
plot(xx, fxx, 'k-', 'LineWidth',2)
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)

% a) The interpolating polynomials Π n f (x ) using equally
% spaced nodes show the same Runge’s phenomenon

for k = [2:2:10]
  % k = n+1 nodes, degree is k-1 = n
  x = linspace(a, b, k);
  fx = f(x);
  coef = polyfit(x, fx, k-1);
  yy = polyval(coef, xx);
  plot(xx, yy, 'r-', 'LineWidth',2)
  axis([a-0.2 b+0.2 -0.1+min(f(xx)) 0.1+max(f(xx))])
  %pause
end

subplot(1,2,2)
hold on, box on
plot(xx, fxx, 'k-', 'LineWidth',2)
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('f(x)','FontSize',16)

for k = [12:2:16]
  x = linspace(a, b, k);
  fx = f(x);
  coef = polyfit(x, fx, k-1);    
  yy = polyval(coef, xx);
  plot(xx, yy, 'r-', 'LineWidth',2);
  hold on;
  axis([a-0.2 b+0.2 -0.1+min(f(xx)) 0.1+max(f(xx))])
  %pause
end

% The interpolation polynomials approach the function in the middle of the 
% interval, but close to the boundaries increasing oscillations appears.

% b) Computation of the piecewise linear interpolation (interp1 command)
% and calculation of the convergence order ( f(x) is not C2(I) function!!)

clear all
a = -1;
b = 1;
f = @(x) abs(x - pi/12); 
x_plot = linspace(a, b, 101);

% vector containing number of subintervals
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
  
  %error(i) = max(abs(f(x_plot) - y_plot));
  error(i) = norm((f(x_plot) - y_plot),'inf');
  %pause
end

% detetmination of the element width
H = (b-a)./n_vect;

figure
loglog(H, error, 'bx-', 'LineWidth', 2, 'MarkerSize', 8)
hold on, box
loglog(H, H, 'k-', 'LineWidth', 2)
hold on, box on
loglog(H, H.^2, 'r-', 'LineWidth', 2)
%axis([0.7 600 1e-4 3])
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('n','FontSize',16)
ylabel('error','FontSize',16)

% THIS LEGEND REQUIRED
% to understand behavior at infinite we have to increase the number of subinterval
% increase n_vect [1 2 4 8 16 32 64 128];
% look at the line that at the BEGINNING is ALMOST parallel to the error line
legend('error', 'O(h)', 'O(h^2)', 'Location', 'ne');

% A second order convergence cannot be expected, since the function is not smooth enough.
% Calculation of the error
order = (log(error(1:end-1) ./ error(2:end))/log(2))'
% or using the diff command build in in matlab
p = -diff(log(error)) / log(2)

% c) Interpolate the function using a piecewise cubic spline (spline
% command) with n = 1, 2, 4, 8, 16, 32 elements.

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
  
  %pause
end

% d) Interpolation of the points generated with the above function with nodes n = 10
% and using the least square approach with varying the degree of the interpolant.

close all

a = -1;
b = 1;
f = @(x) abs(x - pi/12); 
x_plot = linspace(a, b, 101);
x_nodes = linspace(a, b, 10);
y_nodes = f(x_nodes);

plot(x_nodes, y_nodes, 'rO');
hold on;

% to use least squares, if we have n+1 nodes,
% the  least square with degree n == Lagrange interpolant
% differently from before, #nodes does not vary

for ii = 2:1:15
    v = polyfit(x_nodes, y_nodes, ii);
    y_plot = polyval(v, x_plot);
    plot(x_plot, y_plot)
    %pause
end