function [x, x_iter] = fixed_point_FV(phi,x0,tol,Nmax)

k = 0;
x_iter(k+1) = x0;
err = inf;
%err = tol + 1;

while (err > tol) && (k < Nmax)
    
    k = k + 1;
    x_iter(k+1) = phi(x_iter(k));
    err = abs(x_iter(k+1) - x_iter(k));
    
end

x = x_iter(end);

end