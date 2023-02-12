function [ris] = myDet(A)
    n = size(A, 1);

    if n == 1
        ris = A(1);
    else
        ris = 0;

        % for each element call myDet
        for i = 1:n

            for j = 1:n
                ris = ris + (-1)^(j + i) * A(i, j) * myDet(A(i, j));
            end

        end

    end

end
