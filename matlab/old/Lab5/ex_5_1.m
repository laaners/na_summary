clear all
clearvars
clc

E = [
    4 1 1 1 5;
    4 1 2 0 0;
    1 0 15 5 1;
    0 2 4 10 2;
    3 1 2 4 20
    ];

% 1) necessary and sufficient condition
for i = 1:length(E) - 1 % the principal matrix nxn == E does not have to be invertible

    if det(E(1:i, 1:i)) == 0
        "Determinant zero for dimension "+i + ", matrix: "
        E(1:i, 1:i)
    end

end

% 2) LU, spy if pivoting takes place
[L, U, P] = lu(E);
E
L
U % if its equal to the identity, it means I did not swap the rows
P

% 3) Solve Ex=b
b = [12 19 22 18 30]';
% y = forwardSubstitution(L, P * b)';
y = (L \ (P * b));
% x = backwardSubstitution(U, y)';
x = (U \ y);
