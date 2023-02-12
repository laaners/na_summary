function [x,x_iter]=bisection(f,a,b,tol) % returns vector of approximations and x, the one that approximates alpha
    Nmax = ceil(log((b-a)/tol)/log(2));
    for i=1:Nmax
        x_iter(i)=(b+a)/2 % contains ALL the midpoints
        f(x_iter(i))
        f(a)
        if f(x_iter(i)) == 0
            x = x_iter(i);
            return;
        elseif f(x_iter(i))*f(a)<0
            b=x_iter(i);
            b
        else
            a=x_iter(i);
        end
        i
    end
    Nmax
    x=x_iter(end);
end