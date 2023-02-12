
%   Evaluate f(x) for values of x around zero (try with xk = 10^{-k}, k in [1,20]). What do you obtain? Explain the results.


k = [1:20]';
x = 10.^(-k);
f = @(x) (exp(x) - 1) ./ x;
format long
[k x f(x)]
figure;
plot(x, f(x), '*')

% 	The computed f(xk) have the expected behavior until k = 7, in agreement with
% 	lim{x -> 0} f(x) = 1.
% 	
% k = 8 to k = 15: the sequence oscillates with increasing amplitude (bigger and bigger). 
% k = 16: the result becomes 0! The cause of these effects is the loss of accuracy due to 
% numerical cancellation. 

% The numerical cancellation is the most serious consequence related to the
% floating point representation, that is the representation of the real
% numbers with a finite precision. 
% It occurs when you subtract two numbers which are very close to each other.
% So you lose significant digits and consequently accuracy of the finite 
% representation
% a = 1.11e-15, b = 1.12e-15, b-a=1.0e-17_ b-a very close to the machine
% epsilon

% For k = 8, ..., 15 e^{xk} and 1 are very close to each other, 
% still being different in floating point arithmetic. 
% We are subtracting them and the result suffers of a great relative error. 
% Moreover, we are dividing by xk, that approaches 0, hence the error is magnified.

% Finally, for k = 16, e^{xk} and 1 are too close to have a different representation 
% in the floating ploint arithmetic (eps ~ 10^{-16}), hence the difference is 0.
% 	
% 	Write the Taylor expansion of e^x around x0 = 0, truncating it at the fifth order:
% 
% 	e^x  = sum_{k=0}^{+infinity} {f^{(k)}(x0)}/{k!} (x-x0)^k = 
%        = sum_{k=0}^{5}         {f^{(k)}(x0)}/{k!} (x-x0)^k + O(x^6) =
% 		 = 1 + x + {x^2}/{2} + {x^3}/{6} + {x^4}/{24} + {x^5}/{120} + O(x^6)
% 
% 	and substitute it in f(x).
% 
% 	f(x) = 1 + {x}/{2} + {x^2}/{6} + {x^3}/{24} + {x^4}/{120} + O(x^5)
% 
% 	With this formula, at least for x > 0, all the terms have the same sign, so no numerical cancellation occurs.


f_taylor_5 = @(x) 1 + 1/2*x + 1/6*x.^2 + 1/24*x.^3 + 1/120*x.^4;

[k x f(x) f_taylor_5(x)]


%%% How many terms in the Taylor expansion are needed to get double precision accuracy (16 decimal digits) for all x in [0, 1/2]?
% 	
% 	The error in the approximation of a function g(x) at a point x = a with its Taylor expansion up to order n is
% 	E[g,n,a](x) = {g^{(n+1)}(xi)}/{(n+1)!} (x-a)^{n+1} for at least a xi
% 	s.t. |xi -a| < |x -a|.
% 	
% 	In this case
% 	
% 	E[e^x,n+1,0](x) = {e^{xi}}/{(n+2)!} x^{n+2} for xi in [0,x]
% 
% 	and therefore, substituting in f(x) 
% 
% 	E[f,n,0](x) = {E[e^x,n+1,0](x)}/{x} = {e^{xi}}{(n+2)!} x^{n+1} for xi in [0,x]
% 
% 	We want 
% 
% 	E[f,n,0](x) < eps for all x in [0, 0.5]:
% 
% 	since both e^xi and x^{n+1} are increasing functions, it's enough to choose xi = x = 0.5 and seek the first n* such that
% 
% 	{e^{1/2}}/{(n*+2)!} (1/2)^{n*+1} < eps


format short e
n = [1:20]';
err = 1./factorial(n+2) .* (0.5).^(n+1).*exp(0.5);

[n err]

%   Therefore n* = 13$.

