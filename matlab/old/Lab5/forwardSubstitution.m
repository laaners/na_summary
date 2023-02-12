function [y] = forwardSubstitution(L, b)
    n = size(L, 1);
    y(n) = 0;
    y(1) = b(1) / L(1, 1);

    for i = 2:n
        %y(i) = b(i);
        %
        %for j = 1:i - 1
        %    y(i) = y(i) - L(i, j) * y(j);
        %end
        %        y(i) = y(i) / L(i, i);

        y(i) = (b(i) - sum(L(i, 1:i - 1) .* y(1:i - 1))) / L(i, i);

    end

end
