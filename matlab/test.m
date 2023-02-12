close all
clear all
clc

addpath('./utils')
DEBUG = false;

a = 0;
b = 2;

f1 = @(x) x .^ 5;
f2 = @(x) x .^ 4;

df1_4 = @(x) 5 * 4 * 3 * 2 * x;
max_val = df1_4(b);
H = (180 * 1e-2 / ((b - a) * max_val)) ^ (1/4)
m = ceil((b - a) / H)
2 * m + 1 % number of nodes

F1 = @(x) x .^ 6/6;
exact_int = F1(b) - F1(a);
err = abs(exact_int - composite_simpson(f1, a, b, m))
err < 1e-2
