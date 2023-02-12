clc
clear all
close all

% a)

weights_1 = 2/3*[2 -1 2];
nodes_1   = [-1/2 0 1/2];
f = @(x) x.^0; sum(weights_1 .* f(nodes_1))
f = @(x) x.^1; sum(weights_1 .* f(nodes_1))
f = @(x) x.^2; sum(weights_1 .* f(nodes_1))
f = @(x) x.^3; sum(weights_1 .* f(nodes_1))
f = @(x) x.^4; sum(weights_1 .* f(nodes_1)) % inexact
pause

weights_2 = 1/4*[1 3 3 1];
nodes_2   = [-1 -1/3 1/3 1];
f = @(x) x.^0; sum(weights_2 .* f(nodes_2))
f = @(x) x.^1; sum(weights_2 .* f(nodes_2))
f = @(x) x.^2; sum(weights_2 .* f(nodes_2))
f = @(x) x.^3; sum(weights_2 .* f(nodes_2))
f = @(x) x.^4; sum(weights_2 .* f(nodes_2)) % inexact

% Both formulae are exact up to degree 3.

% b)

% The integral can be rewritten as
% int_{-1}^{1} log(t+2) dt;
% we then apply the quadrature rule.

f = @(t) log(t+2)
Q1 = sum(weights_1 .* f(nodes_1))
Q2 = sum(weights_2 .* f(nodes_2))

F = @(x) x.*log(x) - x;
int_exact = F(3) - F(1)

err_Q1 = abs(int_exact - Q1)
err_Q2 = abs(int_exact - Q2)

% The second rule behaves better.