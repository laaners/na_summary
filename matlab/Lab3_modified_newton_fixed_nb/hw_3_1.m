
% HOMEWORK 3.1

xi = 0
% In both cases phi'(xi) = 1: this example confirms that in the case abs{phi'(xi)} = 1 no general statement about convergence/non-convergence can be provided.

phi  = @(x) x - x.^3;
tol = 1e-6;
maxit = 1000;
x0 = -1 + 2*rand(1); % random initial value in [-1,1]
[xi, x] = fixed_point(phi, x0, tol, maxit);
xi
iter = numel(x) - 1

% The fixed point method converges to xi, very slowly.

phi  = @(x) x + x.^3;
tol = 1e-6;
maxit = 1000;
x0 = -1 + 2*rand(1); % random initial value in [-1,1]
[xi, x] = fixed_point(phi, x0, tol, maxit);
xi
iter = numel(x) - 1

% The fixed point method diverges.