

%init workspace
clc, clear, close all;

%load variables from file
load mix2016.mat

%pre-process data with PCA using SVD

%principal components are in U
[U,S,V] = svd(x,0);
%project data
z = U'*x;

%zero-mean the data
z = z - mean(z(:));

%scale z to unit variance
z=z/std(z(:));


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
h = 1e-4;
%step size for gradient ascent
eta = 2e-2;
%tolerance limit before stopping
tol = 1e-4;

maxiter = 100;

K = @(x)mean(x.^4);
% for i = 1:maxiter
%project the data onto the unmixing vector
%for one dimension
y = w'*z;

%estimate kurtosis numerator
k = mean(y.^4);

k1_w1 = K((w + [h;0;0;0])'*z);
g = 

% Either compute or estimate the direction of the gradient
% in K with respect to w (delta K/delta w).
% end