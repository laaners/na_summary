
% HOMEWORK 2.4

a = 200;
f = @(x) exp(a*x) - 1;
df = @(x) a*exp(a*x);

maxit = 1000;
x0 = 1;

[xi, x] = newton25(f, df, x0, 1e-3, maxit);
err_1_3 = abs(xi)
absres_1_3 = abs( f(xi) )

[xi, x] = newton25(f, df, x0, 1e-12, maxit);
err_1_12 = abs(xi)
absres_1_12 = abs( f(xi) )

%%
a = 1e-3;
f = @(x) exp(a*x) - 1;
df = @(x) a*exp(a*x);

maxit = 1000;
x0 = 1;

[xi, x] = newton25(f, df, x0, 1e-3, maxit);
err_2_3 = abs(xi)
absres_2_3 = abs( f(xi) )

[xi, x] = newton25(f, df, x0, 1e-12, maxit);
err_2_12 = abs(xi)
absres_2_12 = abs( f(xi) )


disp('      tol         absres        error')
disp([1e-3  absres_1_3  err_1_3;
      1e-12 absres_1_12 err_1_12])

disp('      tol         absres        error')
disp([1e-3  absres_2_3  err_2_3;
      1e-12 absres_2_12 err_2_12])


% We know that abs{f(x)} < abs{f'(xi)}abs{x - xi}
% Hence if the derivative of f at xi is big the residual can be big
% while the solution is already well approximated.
% Conversely if the derivative is small, the residual decreases fast and
% the convergence criterion can result to be too weak.