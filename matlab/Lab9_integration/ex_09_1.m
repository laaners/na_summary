clc
clear all
close all

% c)

f1 = @(x) x.^3;
f2 = @(x) x.^5;
a = 0;
b = 1;

% Midpoint rule: the number of subintervals is equal to the number of total nodes.

I1_m_1  = composite_midpoint(f1, a, b, 1)
I1_m_10 = composite_midpoint(f1, a, b, 10)

% The function to be integrated is a polynomial of order 3. Hence the rule,
% of degree 1, is not able to compute the integral exactly.
% The error decreases while increasing the number of nodes
% (i.e., increasing the number of subintervals)

% Trapezoidal rule: the number of subintervals is equal to the number of total nodes minus 1.

I1_t_2  = composite_trapezoidal(f1, a, b, 1)
I1_t_10 = composite_trapezoidal(f1, a, b, 9)

% Same behaviour as before, since the trapezoidal rule is of degree 1.

% d)

% Simpson rule: the number of subintervals is equal to (t - 1)/2,
% where t is the number of total nodes.

I1_s_3 = composite_simpson(f1, a, b, 1)
I1_s_7 = composite_simpson(f1, a, b, 3)

% The result does not depend on the number of nodes.
% The reason of this is the fact that Simpson rule has degree of exactness
% equal to 3 and the integral on any subinterval is computed exactly!

I2_s_3 = composite_simpson(f2, a, b, 1)
I2_s_7 = composite_simpson(f2, a, b, 3)

% Instead, when considering the approximation of I_2,
% the integrand function is a polynomial of order higher than 3, hence the rule is not exact.

% e)

% Recall that the error for the composite trapezoidal rule is given in
% slide 6.

h_star = sqrt(12 * 1e-3 / ((b-a) * 20))
m_star = ceil((b-a) / h_star)

% ... and the number of nodes is m_star + 1.

% Check
I1_t_star = composite_trapezoidal(f1, a, b, m_star)
err_star = abs(1/4 - I1_t_star)

% Similarly for the composite Simpson rule:

h_star = ((180 * 1e-3) / ((b-a) * 120))^(1/4)
m_star = ceil((b-a) / (2*h_star))
% ... and the number of nodes is 2 m_star + 1.

err_star = abs(1/6 - I2_s_7)
pause

% f)

for (i = 0:9)
  m = 2^i;
  integr_m(i+1) = composite_midpoint(f2, a, b, m);
  integr_t(i+1) = composite_trapezoidal(f2, a, b, m);
  integr_s(i+1) = composite_simpson(f2, a, b, m);
end

err_m = abs(1/6 - integr_m);
err_t = abs(1/6 - integr_t);
err_s = abs(1/6 - integr_s);

p_m = -diff(log(err_m)) / log(2)
p_t = -diff(log(err_t)) / log(2)
p_s = -diff(log(err_s)) / log(2)

% As expected, the error decreases quadratically in h for both midpoint
% and trapezoidal rules. For Simpson rule instead, convergence is of fourth order in h.

% Graphical visualization of the order of accuracy.
h = 1./2.^[0:9]; % [1/1; 1/2; 1/4; ...; 1/2^9]
figure
loglog(h, err_m, 'rs-', 'LineWidth', 2)
hold on, box on
loglog(h, err_t, 'bs-', 'LineWidth', 2)
loglog(h, err_s, 'ks-', 'LineWidth', 2)
loglog(h, h.^2, 'k--', 'LineWidth', 2)
loglog(h, h.^4, 'k-', 'LineWidth', 2)
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('h','FontSize',16)
ylabel('error','FontSize',16)
leg = legend('Midpoint', 'Trapezoidal', 'Simpson', 'O(h^2)', 'O(h^4)', 'Location', 'NorthWest');
set(leg,'FontSize',16)
set(leg,'LineWidth',1.5)
