clear all;
format short e

n = 40;

% alpha = 1/8 not requested in the homework
for (alpha = [1/8, 8])
	I(1) = log((alpha+1)/alpha);
	for (k = 1:n)
		I(k+1) = -alpha*I(k) + 1/k;
	end
	recursion_integral = I(n+1);
	upper_bound = (1/alpha)*(1/(n+1));
	exact_integral = quadl(@(x) (x.^n)./(x+alpha), 0, 1, 1e-16); % Exact value (not requested)
	[recursion_integral, upper_bound, exact_integral]
end


% 	The recursive approximation of I{40}(alpha =  8) is 1.6389 ... 10^{18}: this result is for sure incorrect because it violates the upper bound for $I_{40}(\alpha =  8)$.
% 	
% 	This is due to the finite precision we use and the error propagation: the initial value I0(alpha) = ln({alpha+1}/{alpha}) is represented with a certain error eps; denoting by fl(y) the floating point representation of the number y, we have
% 	
% 	fl(I0(alpha))  = I0(alpha) + eps,
% 	fl(I1(alpha))  = -alpha fl(I0(alpha)) + 1 = -alpha (I0(alpha) + eps) + 1 = I1(alpha) - alpha eps,
% 	... 
% 	fl(Ik(alpha))  = In(alpha) + (-1)^k alpha^k eps,
% 	
% 	Therefore, at the final (n-th) step the error is multiplied by a factor alpha^n, which result in an amplification of the error if alpha > 1. Instead, for alpha < 1, the error is damped and the recursive relation is stable (e.g. see the previous test for alpha = 1/8).
% 	
% 	Now write a numerically stable recursive relation for I{40}(alpha =  8).
% 	
% 	The idea is to transform the factor alpha on the RHS of the recursive relation in a factor {1}/{alpha}; this can be achieved inverting the recursive relation:
% 	
% 		I{k-1}(alpha) = - {1}/{alpha} I{k}(alpha) + {1}/{k alpha}
% 		lim{k -> +infinity} I{k}(alpha) = 0
% 		
% 	The final value lim{k -> +infinity} I{k}(alpha) is equal to zero because 0 <= I{k}(alpha) <= {1}/{alpha} {1}/{k+1} -> 0, as k -> + infinity.


clear all;
n = 40;
big = 1000;

% alpha = 1/8 not requested in the homework
for (alpha = [1/8, 8])
	I(big + 1) = 0;
	for (k = big:-1:n+1)
		I(k) = -1/alpha*I(k+1) + 1/(k*alpha);
	end
	recursion_integral = I(n+1);
	upper_bound = (1/alpha)*(1/(n+1));
	exact_integral = quadl(@(x) (x.^n)./(x+alpha), 0, 1, 1e-16); % Exact value (not requested)
	[recursion_integral, upper_bound, exact_integral]
end

%	The recursion is now stable for alpha > 1 (and note that, now, an additional error is present, because the final condition can be set for an arbitrary large k = k* instead of k = +infinity).