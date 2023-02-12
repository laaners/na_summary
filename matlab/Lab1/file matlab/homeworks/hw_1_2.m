format long


% 	Use Taylor polynomial approximation to avoid the loss of significance
% 	errors in the following function when x approaches 0
% 
%     f(x) = {1-cos(x)}/{x^2}
% 
% 	The limit of f(x) = {1-cos(x)}/{x^2} as x -> 0 is well known:
% 
% 	lim {x -> 0} {1-cos(x)}/{x^2} = {1}/{2}


clear all, close all, clc
k = [1:30]';
x = 2.^(-k);
f = @(x) (1 - cos(x))./(x.^2);
[k x f(x)]


% 	If we try to evaluate f(x) directly with a sequence xk = 2^{-k} that approaches 0, we notice anomalous behaviour at k = 13, k = 27, k = ...
% 	The reason is numerical cancellation of the terms on the numerator. We can use Taylor expansion of cos(x) for x -> 0 to obtain a better approximation. Indeed
% 	
% 	cos(x) = 1 - {1}/{2} x^2 + {1}/{24} x^4 - {1}/{720} x^6 + o(x^8)
% 
% 	so that 
% 
% 	f(x) = {1}/{2} - {1}/{24} x^2 + {1}/{720} x^4 + o(x^6)


f_taylor_4 = @(x) 1/2 - x.^2/24 + x.^4/720;

[k x f(x) f_taylor_4(x)]

%	The obtained formula is more stable that the direct evaluation of f(x), and the computed values approach {1}/{2}.


% 	Reformulate the following function g(x) to avoid the loss of
% 	significance error in its evaluation for increasing values of x towards +infinity.
% 	
% 	g(x) =  x (sqrt{x+1} - sqrt{x}).
% 	
% 	It is well known that 
% 	
% 	lim{x -> +infinity} g(x) = +infinity


clear all, close all, clc
format short e

k = [1:20]';
x = 10.^(k);

g = @(x) x.*(sqrt(x+1) - sqrt(x));

[k x g(x)]


% 	If we try to evaluate g(x) for a sequence xk = 10^{k} that approaches 0, we notice anomalous behaviour at k = 16, k = ..., for which the computed value is 0. This happens since, in floating point representation, x16 + 1 = x16!
% 
% 	Rationalization of the expression in bracket solves this numerical cancellation: indeed, multiplying the numerator and the denominator by sqrt{x+1} + sqrt{x}
% 	
% 	g(x)  = {x (sqrt{x+1} - sqrt{x})(sqrt{x+1} + sqrt{x})}/{(sqrt{x+1} + {x})} = {x}/{(sqrt{x+1} + sqrt{x})}.



g2 = @(x) x./(sqrt(x+1) + sqrt(x));

[k x g(x) g2(x)]

%	This formula is more stable and does not suffer of numerical cancellation.