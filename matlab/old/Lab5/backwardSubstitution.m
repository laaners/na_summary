function [x] = backwardSubstitution(U, y)
    n = size(U, 1);
    x(n) = y(n) / U(n, n);

    for i = n - 1:-1:1
        x(i) = y(i);

        for j = i + 1:n
            x(i) = x(i) - U(i, j) * x(j);
        end


        x(i) = x(i) / U(i, i);
    end

end
