
% HOMEWORK 2.3

f = @(x) tan(x) - 2*x;
epsilon = 0.01;
rootfinding_function_plot(f, 0+epsilon, pi/2-epsilon, true);

% From the plot we choose the interval I = [1, 1.5] that ensures the validity of the Bolzano's
% theorem, and we can use e.g. the bisection method to find x*.

xstar = bisection(f, 1, 1.5, 1e-15);


% The Newton method for the approximation of $\sin(x) = 0$ is 
% 
% x{(k+1)} = x{(k)} - {sin(x{(k)})}/{cos(x{(k)})} = x{(k)} - tan(x{(k)}).
%
% Therefore, if x{(0)} = x*
% 
% x{(1)} = x{(0)} - tan(x{(0)}) =  x* - tan(x*) =  x* - 2x* = -x* = -x{(0)}\\
% x{(2)} = x{(1)} - tan(x{(1)}) = -x* + tan(x*) = -x* + 2x* =  x* =  x{(0)}
% 
% The method is describing the orbit {x*, - x*}, and thus cannot converge!


g = @(x) sin(x);
dg = @(x) cos(x);

[xi, x_iter] = newton25(g, dg, xstar, 1e-6, 25);
x_iter

% The first 10 iterations of the Newton method seem to describe the orbit {x*, - x*}, but
% after the first few iterations some numerical error arises and this makes the algorithm move from the orbit and then to converge to the solution.