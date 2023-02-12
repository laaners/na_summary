%% Homework 1.2

v_1=2.^(0:10);
v_2=cos(pi./(1:10))';
v_3=0.1./(2.^(0:5));

% hint:  6=5*1+1;
%       11=5*2+1;
%       51=5*10+1;
v_4(1:2:19) =  exp(1:10) + (-1).^(2:11).*((1:10)*5+1);

v_1
v_2
v_3
v_4

%% Homework 1.3

A=magic(4)
% sum up by columns and by rows
sumAc=sum(A);
sumAr=sum(A');
% sum up the elements of the diagonal
sumAdiag=sum(diag(A));


%% Homework 1.4

% building of the matrix A

A=2*diag(ones(5,1))+...
  5*diag(ones(4,1),-1)+10*diag(ones(3,1),-2)+40*diag(1,-4)+...
  10*diag(ones(3,1),2)+40*diag(1,4)

% sum of all elements
sumA=sum(A(:))
% or
sumA=sum(sum(A))

% 

% submatrices 
A_1=A(1:3,1:3)
A_2=A(1:2:5,[1,2,4])
A_3=A(3:5,[2,4,5])

%% Homework 1.5

% matrix B construction
clear B_2
% first way: three instructions

B_3=eye(10);
B_3(2:end-1,[1 end])=1;
B_3([1 end],2:end-1)=1;

B_3

% or, second way: two instructions

B_2(1:10,[1,10]) = [0,0 ; ones(8,2); 0,0]; 
B_2 = B_2 + B_2' + diag(ones(10,1));

B_2

% or, third way: one instruction

B_1 = [[ones(1,9),0] ; [ones(8,1),eye(8),ones(8,1)]; [0,ones(1,9)]];

B_1

%% Homework 1.6

C=diag(1:200)+...
  diag(ones(199,1),-1)+0.5*diag(ones(198,1),-2)+...
  diag(ones(199,1),+1)+0.5*diag(ones(198,1),+2);

% print of some submatrices

C_1=C(1:5,1:5)
C_100=C(floor(end/2):floor(end/2)+4,floor(end/2):floor(end/2)+4)
C_196=C(end-4:end,end-4:end)  


%% Homework 1.7

D=diag(20:-2:2)+0.5*diag(ones(8,1),-2)+diag(3.^(0:8),+1)
