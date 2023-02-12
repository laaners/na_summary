
% HOMEWORK 2.1

f = @(x) cot(x);
g = @(x) (x.^2 - 1)./(2*x);

epsilon = 0.01;
rootfinding_function_plot(f, 0+epsilon, pi-epsilon, true);
rootfinding_function_plot(f, pi+epsilon, 2*pi-epsilon, false);
rootfinding_function_plot(f, 2*pi+epsilon, 3*pi-epsilon, false);
rootfinding_function_plot(g, 0, 3*pi, false);

% Three intervals for the roots are then [1,2], [3,4] and [6,7].

tol = 1e-6;
h = @(x) cot(x) - (x.^2 - 1)./(2*x);

rootfinding_function_plot(h, 0+epsilon, pi-epsilon, true);
rootfinding_function_plot(h, pi+epsilon, 2*pi-epsilon, false);
rootfinding_function_plot(h, 2*pi+epsilon, 3*pi-epsilon, false);

I = [6.5 7] % cannot use [6, 7] since h is discontinuous there
[xi, x] = bisection(h, I(1), I(2), tol);
xi
iter = numel(x)

% Since the exact value of the roots is NOT known, we perform
% again the bisection method with a very small tolerance, and consider
% the final approximation as the exact root of the equation.

figure

% First root
[xiex, xex] = bisection(h, I(1), I(2), 1e-10*tol);
xiex
err = abs(x - xiex);

subplot(1,2,1)
semilogy(err, 'LineWidth',2)
box on, hold on
semilogy(tol*ones(iter,1), 'r--', 'LineWidth',2)
xlim([0 iter+1])
set(gca,'FontSize',16)
xlabel('Iteration','FontSize',16)
ylabel('Error','FontSize',16)
