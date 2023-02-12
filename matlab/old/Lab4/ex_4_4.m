clc
clear all
close all

A = [50 1 3;
    1 6 0;
    3 0 1];

inverseA = MyInv(A)

% Check

inv(A)