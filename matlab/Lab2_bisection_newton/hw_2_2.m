
% HOMEWORK 2.2

f = @(x) exp(-(x-2).^2) + exp(x-4) - 1;
rootfinding_function_plot(f, 0, 5);

% There are three solutions in the interval [1, 5].

tol = 1e-6;

I1 = [0 5];
[xi1, x_iter1] = bisection(f, I1(1), I1(2), tol);
xi1

I2 = [1 6];
[xi2, x_iter2] = bisection(f, I2(1), I2(2), tol);
xi2

I3 = [1 5];
[xi3, x_iter3] = bisection(f, I3(1), I3(2), tol);
xi3

I4 = [-1 5];
[xi4, x_iter4] = bisection(f, I4(1), I4(2), tol);
xi4


% In the first and fourth interval the bisection method converges to the root with
% minimum magnitude; similarly, in the second and third interval the bisection method
% converges to the root with maximum magnitude. The second root cannot be reached.
% 
% This is caused by the iterative procedure that halves the interval: at the 
% very first iteration the half-interval that contains the second root is discarded.

bisection_plot(f, I2(1), I2(2), tol);
bisection_plot(f, I3(1), I3(2), tol);

% This example shows that the choice of the initial interval is important.


