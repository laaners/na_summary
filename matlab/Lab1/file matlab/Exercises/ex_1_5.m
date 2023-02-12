% Pay attention, you cannot use "eps" since it is a built-in variable
k = 0;
EPS = 1/2;
while (1 + EPS) > 1
  EPS_old = EPS;    % keep track of the value
  EPS = EPS / 2;
  k = k + 1;
end
format long
EPS_old		% computed with the ad-hoc procedure
(1 + EPS_old) > 1
EPS
(1 + EPS) > 1
k			% Number of iterations, which is also the numer of digits in the mantissa, according to the standard
eps			% Octave/MATLAB built-in
