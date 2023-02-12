function [xi, x_iter] = fixed_point(phi, x0, tol, maxit)
    x_iter(1) = x0;

    for iter = 1:maxit
        x_iter(iter + 1) = phi(x_iter(iter));

        if (abs(x_iter(iter + 1) - x_iter(iter)) < tol) % stopping criterion with TOL
            break;
        end

    end

    xi = x_iter(end);
end


% function [xi, x_iter] = fixed_point(phi, x0, tol, maxit)
%     x_iter(1) = x0;
%     err = inf;
% 
%     while (err > tol) && (k < Nmax)
%         k = k + 1;
%         x_iter(iter + 1) = phi(x_iter(iter));
%         err = abs(x_iter(iter + 1) - x_iter(iter)) % stopping criterion with TOL
%     end
% 
%     xi = x_iter(end);
% end
