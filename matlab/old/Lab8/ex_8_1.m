close all
clearvars
clc

% a=============================================================
% Lagrange basis polynomials, interval [-2,6]
% If I have n points, degree must be n-1!
% So if have degree n, I must use n+1 points
a = -2;
b = 6;
f = @(x) x .* sin(x);
x4 = linspace(-2, 6, 4 + 1); % or x = -2:8/4:6;
c4 = polyfit(x4, f(x4), 4);

x6 = linspace(-2, 6, 6 + 1);
c6 = polyfit(x6, f(x6), 6);

x8 = linspace(-2, 6, 8 + 1);
c8 = polyfit(x8, f(x8), 8);

x = linspace(-2, 6, 1000 + 1);

subplot(2, 2, 1);
plot(x, polyval(c4, x), x4, f(x4), 'o'), title('Lagrange 4');

subplot(2, 2, 2);
plot(x, polyval(c6, x), x6, f(x6), 'o'), title('Lagrange 6');

subplot(2, 2, 3);
plot(x, polyval(c8, x), x8, f(x8), 'o'), title('Lagrange 8');

subplot(2, 2, 4);
plot(x, f(x)), title('Real function');

figure, plot(x, polyval(c4, x), "--"), hold on;
plot(x, polyval(c6, x), "--"), hold on;
plot(x, polyval(c8, x), "--"), hold on;
plot(x, f(x));

leg = {};
leg{1} = 'Lagrange 4';
leg{2} = 'Lagrange 6';
leg{3} = 'Lagrange 8';
leg{4} = 'Real function';
legend(leg);

% b=============================================================
% Estimate interpolation error
% when resorting to quadratic interpolation (n=2)
% NOT COMPUTING LAGRANGIAN POLYNOMIAL
% use the inequality

% f = @(x) x .* sin(x);
f_1 = @(x) sin(x) + x .* cos(x);
f_2 = @(x) 2 * cos(x) - x .* sin(x);
f_3 = @(x) -2 * sin(x) - sin(x) + x .* cos(x);

err = (8/1000)^3/12 * max(f_3(x))

c2 = polyfit(x, f(x), 2);

figure, plot(x, polyval(c2, x), "--"), hold on;
plot(x, f(x)), hold on;

% error
err = max(abs(f(x) - polyval(c2, x)))

leg = {};
leg{1} = 'Lagrange 2';
leg{2} = 'Real function';
legend(leg);

% c=============================================================
% Piecewise linear interpolation and cubic spline
% with n+1 = 6, 11, 12
x = linspace(-2, 6, 6 + 1);
figure, plot(x, interp1(x, f(x), x), "--"), hold on;
plot(x, spline(x, f(x), x)), hold on;
plot(x, f(x));

leg = {};
leg{1} = 'Piecewise';
leg{2} = 'Spline';
leg{3} = 'Real function';
legend(leg);

x = linspace(-2, 6, 11 + 1);
figure, plot(x, interp1(x, f(x), x), "--"), hold on;
plot(x, spline(x, f(x), x)), hold on;
plot(x, f(x));

leg = {};
leg{1} = 'Piecewise';
leg{2} = 'Spline';
leg{3} = 'Real function';
legend(leg);

x = linspace(-2, 6, 12 + 1);
figure, plot(x, interp1(x, f(x), x), "--"), hold on;
plot(x, spline(x, f(x), x)), hold on;
plot(x, f(x));

leg = {};
leg{1} = 'Piecewise';
leg{2} = 'Spline';
leg{3} = 'Real function';
legend(leg);