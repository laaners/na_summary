function [xi, x_iter_bisection, x_iter_newton] = bisection_newton(f, df, a, b, tol_bisection, tol_newton, maxit_newton, multiplicity)

    if (nargin < 0)
        multiplicity = 1;
    end

    [xi_bisection, x_iter_bisection] = bisection(f, a, b, tol_bisection);
    [xi_newton, x_iter_newton] = newton(f, df, xi_bisection, tol_newton, maxit_newton, multiplicity);
    xi = xi_newton;
end
