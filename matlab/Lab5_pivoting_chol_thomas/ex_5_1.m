clc
clear all
close all

E = [4 1 1 1 5;
     4 1 2 0 0;
     1 0 15 5 1;
     0 2 4 10 2;
     3 1 2 4 20];
 
 b = [12 19 22 18 30]';
 
 n = length(E(1,:));
 
 % Let calculate the determinant of the all the minor fo the matrix E
 
 for i = 1:n-1
     det(E(1:i, 1:i))
 end
 
 % Since one of the minor determinants is equal to zero, the LU
 % factorization without pivoting does not exist!
 
 % ATTENTION
 % if a matrix E does not admit a LU factorization and you
 % call lu command without the output P, matlab does not 
 % return the lu factorization of P*E but a factorization
 % of E which is not lower-upper triangular
 [L, U] = lu(E);
 detA = prod(diag(U))
 L % is not triangular!
 figure()
 % spy plots the sparsity pattern of matrix S. 
 % Nonzero values are colored while zero values are white
 spy(L)
 U
 
 [L, U, P] = lu(E);
 detA = prod(diag(U))
 L
 figure()
 spy(L)
 U
 P % is not the identity matrix => pivoting is needed
 
 % backward substitutions
 y = L\(P*b); 
 % forward substitutions
 x = U\y
 
 xex = E\b