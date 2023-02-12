function [x,x_iter_b,x_iter_N] = bisection_newton_FV(f,df,a,b,tol_b,tol_N,Nmax_N,m)

    [x_b,x_iter_b] = bisection_FV(f,a,b,tol_b);
    [x,x_iter_N] = modified_newton_fun(f,df,x_b,tol_N,Nmax_N,m)
    
end