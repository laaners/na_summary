clc
clear all
close all

% 1)
a = 0;
b = 1;
%alpha = 2;
alpha = 3/2;
%alpha = 5/2;
%alpha = 7/2;
%alpha = 2;
f = @(x) (x.^alpha);

% Use an increasing number of nodes in computing the integral
for (i = 0:9)
  m = 2^i;
  integr_m(i+1) = composite_midpoint(f, a, b, m);
  integr_t(i+1) = composite_trapezoidal(f, a, b, m);
  integr_s(i+1) = composite_simpson(f, a, b, m);
end

int_exact = quad(f, a, b, 1e-12);

err_m = abs(int_exact - integr_m);
err_t = abs(int_exact - integr_t);
err_s = abs(int_exact - integr_s);

p_m = -diff(log(err_m)) / log(2)
p_t = -diff(log(err_t)) / log(2)
p_s = -diff(log(err_s)) / log(2)

% Depending on the considered value of alpha the integrand function is characterized
% by a different level of regularity.
% With alpha = 1/2, all the methods show convergence of order 3/2 (= alpha + 1).
% The regularity of the function is too low for the methods to reach their
% maximum theoretical convergence order.
% With alpha = 3/2 the error decreases quadratically in h for both midpoint
% and trapezoidal rules. For the Simpson rule instead, convergence is of order 5/2 (= alpha + 1).
% Again regularity is not enough for the Simpson method to reach fourth order.
% Similar situation occurs with alpha = 5/2, with Simpson rule showing order 7/2 (= alpha + 1).
% Finally, with alpha = 7/2 all the methods show their theoretical orders.

