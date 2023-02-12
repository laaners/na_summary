clc
clear all
close all

A = [50 1 3;
    1 6 0;
    3 0 1];

[L, U] = lu(A);

% Let us check if the matrices L and U are as we expect them to be.

L
U

xex = [1; 1; 1];
b = A*xex;

y = forward_substitution(L, b);
x = backward_substitution(U, y);

% Finally, let's check if x is equal to xex:

x
