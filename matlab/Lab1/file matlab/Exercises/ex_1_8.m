% Implement the two relations in order to generate the first 100 terms of the sequence.

% First recursive relation

p(1) = 1;
p(2) = 1/3;
for i = 2:100
    p(i+1) = 10/3*p(i) - p(i-1);
end

figure
subplot(2,1,1)
plot(0:100, p, 'LineWidth',3)
% gca return the current axes 
% setting the fontsize on axes
set(gca,'FontSize',16)
xlabel('n','FontSize',16)
ylabel('p_n','FontSize',16)
% The sequence explodes!

% Second recursive relation

q(1) = 1;
for i=1:100
    q(i+1) = 1/3*q(i);
end

subplot(2,1,2)
plot(0:100, q, 'LineWidth',3)
set(gca,'FontSize',16)
xlabel('n','FontSize',16)
ylabel('q_n','FontSize',16)
% The sequence is ok.


% 	Study the stability of the two algorithms and justify the obtained results.
% 	
% 	Error analysis: since we use finite precision numbers, we know the initial 
%  data up to an error eps. Actually, if we start from 1, we know it exactly, 
%  but we may introduce anyway errors in the following steps.
% 	Indeed, denoting by fl(pi) the floating point representative for pi:
% 	
% 	fl(p0) = p0 + eps,  fl(p1) = p1 + eps.
% 	
% 	It follows
% 	
% 	fl(p2)  = {10}\{3} fl(p1) - fl(p0) = {10}\{3}(p1 + eps)- (p0 + eps) = p2 + {7}\{3} eps
% 	fl(p3)  = {10}\{3} fl(p2) - fl(p1) = {10}\{3}(p2 + {7}\{3}eps) - (p1 + eps) = p2 + {61}\{9} eps
% 	fl(p4)  = ...
% 	
% 	The error is amplified! 
% 	
% 	Instead, with the second formula
% 
% 	fl(q0)  = q0 + eps
% 	fl(q1)  = {1}\{3} fl(q0) = {1}\{3} q0 + {1}\{3} eps = q1 + {1}\{3} eps
% 	fl(q2)  = {1}\{3} fl(q1) = {1}\{3} q1 + {1}\{9} eps = q2 + {1}\{9} eps
% 	fl(q3)  = ...
% 	
% 	The error is reduced!


