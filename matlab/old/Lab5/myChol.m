function [H] = myChol(A)
    n = length(A);
    H = zeros(n, n);

    H(1, 1) = sqrt(A(1, 1));

    for i = 2:n

        for j = 1:(i - 1)
            H(i, j) = 1 / H(j, j) * (A(i, j) - H(i, 1:j - 1) * H(j, 1:j - 1)');
        end

        H(i, i) = sqrt(A(i, i) - H(i, 1:i - 1) * H(i, 1:i - 1)');

    end

    H = H';

end
