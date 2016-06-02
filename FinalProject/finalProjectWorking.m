

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

%project the data onto the unmixing vector
%for one dimension
y = w'*z;

%Measure the numerator of the kurtosis in y
%current kurtosis numerator

k = mean(y.^4);

% Either compute or estimate the direction of the gradient
% in K with respect to w (delta K/delta w).
