clc
clear all
close all

% Definition of the matrix A
A = ones(5,5);
A(1,1) = 1.001;
A(3,2) = 1.001;
A(2,3) = 1.001;
A(5,5) = 1.001;
% visualization of the matrix A
A 
% Calculation of the conditioning number in inf norm with Matlab
KA = cond(A, inf)
%calculation of the conditioning number wih the definition
KA_def = norm(A, inf) * norm(inv(A), inf)

% Estimation of the conditioning number by inverting the relation
% norm(deltax)/norm(x) <= Kp(A) * norm(deltab)/norm(b)
% to get an estimate for Kp(A):
% Kp(A) >= norm(deltax)/norm(x) * norm(b)/norm(deltab)
n_trials = 100;
KA_store = zeros(n_trials,1);
pert_mag = 1e-6; % Perturbation magnitude
x = ones(5,1);
b = A*x;

for (i=1:n_trials)
  deltab = pert_mag * randn(5,1);
  deltax = A\deltab;
  KA = norm(deltax,inf)/norm(x,inf) * norm(b,inf)/norm(deltab,inf);
  KA_store(i) = KA;
end
KA_est = max(KA_store)

figure
set(gcf, 'Position', [100 100 1000 500])
plot([1:n_trials], KA_store, 'bx-','LineWidth',2, 'MarkerSize',8)
hold on, box on
plot([1:n_trials], cond(A,inf)*ones(n_trials,1), 'r--', 'LineWidth',2)
axis([0 n_trials+1 0 1.1*cond(A,inf)])
set(gca,'LineWidth',1.5)
set(gca,'FontSize',16)
xlabel('trials')
ylabel('K_{est}(A)')
