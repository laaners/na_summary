clear all
clearvars
clc

A = [
    44 15 29 26 119;
    15 33 32 18 15;
    29 32 252 112 73;
    26 18 112 124 90;
    119 15 73 90 430
    ];

% 1) Verify if Cholesky can be applied, verify that is spd:
% - all eigenvalues are real (s)
% - all eigenvalues are > 0 (pd)
eigenvalues = eig(A);
isreal(eigenvalues);
all(eigenvalues > 0);

% 2) Write myChol
R = myChol(A);
H = R';

% 3) compare with matlab chol(A)
round(R, 4) == round(chol(A), 4)

% 4) Solve Ax = b
b = [1 1 1 1 1]';
y = H \ b;
x = H' \ y;
