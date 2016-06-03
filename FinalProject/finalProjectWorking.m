

%init workspace
clc, clear, close all;

%load variables from file
load mix2016.mat

[m,n] = size(x);

%pre-process data with PCA using SVD

%principal components are in U
[U,S,V] = svd(x,0);
%project data
z = U'*x;

%scale z to unit variance
for i=1:m
   z(i,:)=z(i,:)/std(z(i,:)) ;
end


%generate a m-dimensional random unmixing vector(w)
%with dimensions between 0 and 2pi

%Generate values from the uniform distribution on the
% interval [a, b] : r = a + (b-a).*rand(100,1);

%generate 4 random values in range 0 to 2pi
r = 0 + (2*pi - 0).*rand(4,1);
n = norm(r);
%set w to unit-norm vector
w = r / n;

%step size for kurtosis
%values has been taken from online example
h = 1e-5;
%step size for gradient ascent
eta = 2e-2;
%tolerance limit before stopping
tol = 1e-5;
max_iter = 400;
%call ppursuit function
[y,K] = ppursuit(h,eta,tol,max_iter,z);



%Record the final w as the basis vector for the current dimension

% Remove the data projections onto that final w from the dataset,
%leaving the residuals to work on for the next axis 
%(which needn't be orthogonal in the original space)

%Xnew = X ? wy = X ? ww'X
%use the uncorrelated data(z)
z = z - w*w'*z;

%y is the unmixed signal(we want to keep these in a matrix)

%repeat unmixing process for all other dimensions of z
 

