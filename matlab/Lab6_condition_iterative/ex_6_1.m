clc
clear all
close all

% a)
% 2-norm
% norm(A,2) = sqrt(eig_max(A'A))=(since A is diagonal A'A =
% A^2)=sqrt(eig_max(A^2)) = sqrt((eig_max(A))^2) = eig_max(A) = 1.
% For the same reasons, norm(A^-1,2) = 1/epsilon
% => K2 = norm(A,2) * norm(A^-1,2) = 1/epsilon.

% 1-norm / infinity-norm
% Since A is symmetric, the two norms coincide. In particular:
% norm(A,1) = max_j(sum_i(abs(aij))) = 1
% norm(A^-1,1) = max_j(sum_i(abs(aij^-1))) = 1/epsilon
% K1 = Kinf = 1/epsilon

A = eye(3);
epsilon = 1e-6;
A(3,3) = epsilon;


cond(A,2)

cond(A,1)

cond(A,'inf')


% b)
% deltax = A^-1 deltab = [0 0 alpha/epsilon]'
% c)
% deltax = A^-1 deltab = [alpha 0 0]'

% Both cases verify the inequality: norm(deltax)/norm(x) <= K
% norm(deltab)/norm(b).
% In particular, in the case b) we have an equality
% and in the case c) we have a strict inequality.

b = [1 0 0]';
x_ex = [1 0 0]';

for (alpha = [1e-6 1e-12])
	deltab_1 = [0 0 alpha]';
	x1 = A \ (b + deltab_1) % x + delta x
	norm(x1 - x_ex, inf) / norm(x_ex, inf) % ||deltax||/||x||
	alpha/epsilon
	
% 	deltab_2 = [alpha 0 0]';
% 	x2 = A \ (b + deltab_2)
% 	norm(x2 - x_ex, inf) / norm(x_ex, inf)
% 	alpha
end
