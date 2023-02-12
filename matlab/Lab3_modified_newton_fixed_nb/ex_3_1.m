
% EXERCISE 3.1
clear all
close all
clc

xi = sqrt(5);

% The substitution x{(k+1)} = x{(k)} = xi = sqrt{5} easily shows that all the methods are consistent. The evaluation of the convergence properties of the iterative methods require the computation of the first derivative of phi at x = xi.

% Method 1.

phi1  = @(x) 5 + x - x.^2;
dphi1 = @(x) 1 - 2*x;
abs(dphi1(xi))

% The absolute value of the derivative of phi at xi
% is greater than 1: the method will not converge.

% Method 2.

phi2  = @(x) 5./x;
dphi2 = @(x) -5./x.^2;
abs(dphi2(xi))

% The absolute value of the derivative of phi at xi
% is equal to 1: no theoretical conclusion can be stated in this case.

% Method 3.

phi3  = @(x) 1 + x - 1/5*x.^2;
dphi3 = @(x) 1 - 2/5*x;
abs(dphi3(xi))

% The absolute value of the derivative of phi at xi
% is less than 1: the method will converge provided that the initial guess x{(0)} is close enough to xi (local convergence).

% Method 4.

phi4  = @(x) 1/2*(x + 5./x);
dphi4 = @(x) 1/2 - 5./(2*x.^2);
abs(dphi4(xi))

% The absolute value of the derivative of phi at xi
% is zero (i.e. less than 1): the method will converge provided that the initial guess x{(0)} is close enough to xi (local convergence).

d2phi4 = @(x) 5./x.^3;
abs(d2phi4(xi))

% The second derivative is different from zero,
% so method 4 is expected to be of second order.

%%
pause
tol = 1e-6;
maxit = 1000;

% Method 1.
clc
x0 = xi + 0.001;
[xi1, x1] = fixed_point(phi1, x0, tol, maxit);
xi1
iter1 = numel(x1) - 1
[xi1, x1] = fixed_point_FV(phi1, x0, tol, maxit);
xi1
iter1 = numel(x1) - 1
% The approximation xi is incorrect and the number of performed iterations is the maximum: as expected, the method did not converge.

%fixed_point_plot(phi1, x0, tol, 5);
pause

% Method 2.

x0 = 3;
[xi2, x2] = fixed_point(phi2, x0, tol, maxit);
xi2
% number of iterations of method 2
iter2 = numel(x2) - 1
% different implementation of fixed point method
[xi2, x2] = fixed_point_FV(phi2, x0, tol, maxit);
xi2
iter2 = numel(x2) - 1
% The approximation xi is incorrect and the number of performed iterations is the maximum: the method did not converge.

%fixed_point_plot(phi2, x0, tol, 5);
pause

% Method 3.
x0 = 4;
[xi3, x3] = fixed_point(phi3, x0, tol, maxit);
xi3
iter3 = numel(x3) - 1
[xi3, x3] = fixed_point_FV(phi3, x0, tol, maxit);
xi3
iter3 = numel(x3) - 1

% The method converged to xi.

%fixed_point_plot(phi3, x0, tol, maxit);
pause

% But the convergence is only local...

x0 = 10;
[xi3, x3] = fixed_point(phi3, x0, tol, maxit);
xi3
iter3 = numel(x3) - 1
[xi3, x3] = fixed_point_FV(phi3, x0, tol, maxit);
xi3
iter3 = numel(x3) - 1
% With a different initial guess, the method may not converge to xi.

%fixed_point_plot(phi3, x0, tol, maxit);
pause

% Method 4.
x0 = 4;
[xi4, x4] = fixed_point(phi4, x0, tol, maxit);
xi4
iter4 = numel(x4) - 1
[xi4, x4] = fixed_point_FV(phi4, x0, tol, maxit);
xi4
iter4 = numel(x4) - 1

% The method converged to xi.

%fixed_point_plot(phi4, x0, tol, maxit);




