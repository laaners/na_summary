clc
clear all
close all

A = [44 15 29 26 119;
     15 33 32 18 15;
     29 32 252 112 73;
     26 18 112 124 90;
     119 15 73 90 430];
b = [1 1 1 1 1]';

eig(A)
eig(A)>0
% All the eigenvalues are strictly positive, so A is positive definite. The
% simmetry comes from the fact that eig(A) is a real vector

% Mat_R upper triangular
Mat_R = chol(A);
Mat_H = Mat_R'
% My_H lower triangular
My_H = MyChol(A)

% Pay attention to the output of the functions: chol(A) returns H^T (upper
% triangular),
% whereas the function MyChol we wrote returns the matrix H (lower
% triangular).
% Now, let's solve H*H^T*x=b, with H lower triangular

y = My_H\b;
x = My_H'\y

% Let us compare the result obtained with the one furnished by the
% backslash implemented in Matlab.
xex = A\b
