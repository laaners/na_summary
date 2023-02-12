clear all
clearvars
clc

% a) define in sparse mode, check size with full mode
a = [1:10]';
c = [10:19]';
e = [102:111]';
n = length(e);

n = 10;
A = spdiags([e a c], [-1 0 1], n, n); % [-1 0 1] indicate the diagonals I want to occupy!
% c truncated starting from the start, so no 10
% e truncated starting from the end, so no 111

A_full = full(A);

whos

% b) Solve with thomas