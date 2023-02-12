% to show result do not put ;
a = 1
a = 1; % does not show

%function, can only run in command window
% one function per file?
% Call this in terminal by file_name(params...)
function sum = octave_matlab_intro_function(n1,n2)
  sum = n1+n2;
end
function [out1,out2] = name(in1,in2)
  ...;
end

% Insert this command at top of script every time
% deletes all previous variables in memory
clear all

% "man" equivalent in matlab
% in console
help plot
doc plot % better

% see what it is, if matrix, number...
whos a
a = uint8(a) % explicit cast

% vectors
c = [1,2,3]
c = [1 2 3]

% column vectors
d = [1;2;3]
d = [1,2,3]'

% matrices
D = [1 2 3; 3,5,6; 7 8 9]
E = D'

% loop in vectors, matrixes and ranges
e = [1:1:10] % [beginning:step:end], both included, RANGE
e = [1:4] % [beginning:end], both included
linspace(i_included,j_included,n_elems) % e.g. linspace(0,1,11)

% array index starts from 1...
e(1) = 1
e(1:2) % sub vector [1 to 2 indexes included]
M(1,:) % first row of matrix
M(:,2) % second column
M(end,end) % take the bottom right element
M(end,:) % last row
M(M <= 5) % filtering
M(4) % if M 3x3, 4 will get the 2,1 rows adjacent in memory

% matrix of zeros, ones and identity
M = zeros(3,4) % matrix 3x4 of zeros
M = zeros(2) % squared matrix 2x2 of zeros
ones(1,4)
ones(2)
eye(3)
eye(3,5) % rectangular too!
M(1,2)

% diagonal matrix
eye(3)*2
d = [1:4];
D = diag(d) % diagonal matrix with that vector
M = [1:3;4:6;7:9]
diag(M) % using diag on matrix will extract the diagonal
diag(diag(M))
diag(M,-1) % extract the diagonal 1 on the left of the principal
diag(d,1) % create diag matrix with d and additional "L" zeros

% triangular matrices
tril(M) % extracting lower triangular matrix
triu(M) % extracting upper triangular matrix
triu(M,1) % starts from the diagonal 1 on the right of the principal

% concat
a = [1:3]
b = [4:6]
[a,b] % vector
[a b]
[a;b] % matrix
[a' b'] % transpose of [a;b]'

% block matrix
S1 = [1 2; 5 6]
S2 = [3 4; 7 8]
S3 = [9:11]
S4 = [12]
S = [S1,2*S2;S3,S4]

% operations with vectors
a = [1 -2 1 0];
b = [3 4 1 2];
c = a + b
c = a - b
e = a*b' % scalar product, riga per colonna
v = a.*b % elementwise prodcut
v = a./b % elementwise division
v = a.^b % elementwise exponent
% same for matrices
M = K.*L; % ./ .^
% matrix product
M = K*L % only when mxn*nxk

% number format, by default matlab uses format short
format short % 5 significant digits
format long % for more digits
    % format long in console, then newline, then computation
format e

% for loop, VERY INEFFICIENT
vk = zeros(1, k+1);
for (ii = 0:k)
  vk(ii+1) = (2*ii + 1)^2;
end

% rounding
ceil(10.56)
floor(10.56)
round(10.56)

% arithmetic functions
sum([1 2 3 4])
sum([1:4;5:8]) % sum row by row sum([1:4;5:8],1) same
sum([1:4;5:8],2) % sum col by col

% print
disp('Ciaooo');
fprintf('number %f\n', size(M))

