function [x,x_iter]=newton(f,df,x0,tol,Nmax)
    i=1;
    err=1+tol;
    x_iter(i) = x0;
    while i<=Nmax && err>tol
        if abs(df(x_iter(i))) < 1e-8 % if too near zero, I break, accurate enough for us
            break;
        end
        % update rule of newton method
        x_iter(i+1)=x_iter(i)-f(x_iter(i))/df(x_iter(i));
        % define the estimator for the loop check
        err=abs(x_iter(i+1)-x_iter(i));
        i=i+1;
    end
    x=x_iter(end);
end

%  0.3
% 0.5
% 1e-6
% x = linspace(-0.5,1.5,1000)
% plot(x,f(x))
% semilogy(x)