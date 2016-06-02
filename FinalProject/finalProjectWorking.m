

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
w = r / n

%step size for kurtosis
%values has been taken from online example
h = 1e-5;
%step size for gradient ascent
eta = 2e-2;
%tolerance limit before stopping
tol = 1e-5;

k_prev = inf;
k = eps;
maxiter = 400;

K = @(x)mean(x.^4);
%Stop when the increase in K falls below
%some relative change: abs((Knew ? K) / K) < tol
% or max iter is met
i = 1;
while i <= maxiter && abs((k - k_prev)/k) > tol 
%project the data onto the unmixing vector
%for one dimension
y = w'*z;
k_prev = k;
%estimate kurtosis numerator
% k = mean(y.^4);
k = K(y);

%Estimate the gradient vector from the changes in K
%divided by the change in w (which is h)

%todo: make this generalized for multiple dimensions
k_w1 = (K((w + [h;0;0;0])'*z) - k)/h;
k_w2 = (K((w + [0;h;0;0])'*z) - k)/h;
k_w3 = (K((w + [0;0;h;0])'*z) - k)/h;
k_w4 = (K((w + [0;0;0;h])'*z) - k)/h;
%put changes in K in a gradient vector(g)
g = [k_w1;k_w2;k_w3;k_w4];
%take a step in the direction of g
w = w + eta*g;
%set w to unit norm
w = w/norm(w);

i = i + 1;
end

%Record the final w as the basis vector for the current dimension

% Remove the data projections onto that final w from the dataset,
%leaving the residuals to work on for the next axis 
%(which needn't be orthogonal in the original space)

%Xnew = X ? wy = X ? ww'X
%use the uncorrelated data(z)
z = z - w*w'*z;

%y is the unmixed signal(we want to keep these in a matrix)

%repeat unmixing process for all other dimensions of z
 

