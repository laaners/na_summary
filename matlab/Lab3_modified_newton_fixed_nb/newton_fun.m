function [x,x_iter] = newton_fun(f,df,x0,tol,Nmax)

i = 1;
err = 1 + tol;
%err = inf;

x_iter(i) = x0;

% if ( abs(df(x_iter(i)))  < 1e-8 )
%     return;
% end

while (i <= Nmax) && (err > tol)
    
%     if ( abs(df(x_iter(i)))  < 1e-8 )
%         return;
%     end
    
    x_iter(i+1) = x_iter(i) - f(x_iter(i))/df(x_iter(i));
    err = abs(x_iter(i+1) - x_iter(i));
    i = i + 1;
    
end

x = x_iter(end)

end