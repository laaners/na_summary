%	Set x0 = 1, compute x1, x2, ... , x{71} and explain the obtained results.
	
clear all, close all, clc
format long

n_max = 71;
x = zeros(n_max+1, 1);

x(1) = 1;         % x0 set to 1
for n = 0:n_max-1
  x(n+2) = 2^(n+1)*(sqrt(1 + x(n+1)/2^(n)) - 1);    % Pay attention to the indexing!!!
end
x(end)            
x_lim = log(1 + x(1))

figure
hold on, box on
plot([0:71], x, 'bx-','Linewidth',3)
plot([0:71], x_lim*ones(n_max+1,1)', 'r-','Linewidth',3)
axis([-1 72 -0.05 1.05])
set(gca,'LineWidth',2)
set(gca,'FontSize',16)

%	When computing the sequence with Octave/MATLAB we find that x{71} differs a lot from ln(1+x0) = ln(2). The plots also shows that xn = 0, for all n >= n* = 52: this is due to numerical cancellation effects, because at n = n* it holds {x{n*}}/{2^{n*}} < eps, hence in finite precision arithmetic x{n*} = 0!

x(53)

%%

% 	The value of n* can also be computed with the following argument: since (hopefully) numerical cancellation will occur for large n
% 	x{n} ~ ln(1+x0)
% 	therefore
% 	{x{n}}/{2^{n}} < eps is approximately equivalent to {ln(1+x0)}/{2^{n}} < eps
% 	which can be solved for n, finding
% 	n > log2({ln(1+x0)}/{eps}

    
x_0 = 1;
n = log(log(1 + x_0)/eps)/log(2)


% 	Transform the sequence in an equivalent one that converges to the theoretical limit.
% 	
% 	After a razionalization, the recurrence can be written as
% 	x{n+1} = 2^{n+1} [ sqrt{1+{xn}/{2^{n}}} - 1 ] = {2 xn}{ sqrt{1 + {xn}/{2^{n}}} + 1}
	
	
clc, clear all

n_max = 71;
x = zeros(n_max+1, 1);

x(1) = 1;           % x0 set to 1
for n = 0:n_max-1
  x(n+2) = 2*x(n+1)/(sqrt(1 + x(n+1)/2^(n)) + 1);
end
x(end)

%   The error in this case is
x(end) - log(1 + x(1))

figure
hold on, box on
plot([0:n_max], x,'bx-','Linewidth',3)
plot([0:n_max], log(1+x(1))*ones(n_max+1), 'r-','Linewidth',3)
axis([-1 72 0.67 1.02])
set(gca,'LineWidth',2)
set(gca,'FontSize',14)

%   Using the previous calculations we know that (1 + xn/2^n) approximately 1 for n >= 52, so x(n+1) = 2*xn/(1 + 1) = xn

