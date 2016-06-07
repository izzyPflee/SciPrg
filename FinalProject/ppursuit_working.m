function [y, K, w] = ppursuit(h, eta, tol, mxi, x)
% This function uses projection pursuit to demix m
% signal mixtures into m estimated source signals.
% h Step size for probing the Kurtosis (K) of the
% demixed signals. K is probed by looking at
% K(w + h) in the m dimensions of w, one at a time.
% eta Distance that the demixing vector w is adjusted
% in the direction of the estimated gradient of
% K. IOW, wnext = w + eta*g where g is the
% (perhaps estimated) gradient of K.
% tol Stopping criterion for gradient ascent. The
% ascent terminates when the relative change in
% abs(K) is < tol (abs change in K divided by K).
% mxi Maximum iterations to execute on the ascent
% of K for each recovered signal.
% x (m x n) matrix of signal mixtures. Each row
% is a 1 x n mixture of m source signals. The
% source signals may be anything, and there is
% no assumed relationship between the n samples
% of a given mixture.
% y The (m x n) source estimates passed out.
% K The (m x ?) history of the ascent of Kurtosis
% for each recovered source. Having this history
% helps the user tune the search parameters.

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
% h = 1e-5;
%step size for gradient ascent
% eta = 2e-2;
%tolerance limit before stopping
% tol = 1e-5;

k_prev = inf;
k = eps;
% maxiter = 400;
maxiter = mxi;

K = @(x)mean(x.^4);
%Stop when the increase in K falls below
%some relative change: abs((Knew - K) / K) > tol
% or max iter is met
i = 1;

%use m for gradient vector
[m,n] = size(x);

while i <= maxiter && abs((k - k_prev)/k) > tol 
%project the data onto the unmixing vector
%for one dimension
y = w'*x;
k_prev = k;
%estimate kurtosis numerator
% k = mean(y.^4);
k = K(y);

%Estimate the gradient vector from the changes in K
%divided by the change in w (which is h)

%put changes in K in a gradient vector(g)
g = zeros(m,1);

for i = 1:m
   h_vec = zeros(m,1);
   h_vec(i,1) = h;
   g(i,1) = (K((w + h_vec)'*x) - k)/h;
    
end

%take a step in the direction of g
w = w + eta*g;
%set w to unit norm
w = w/norm(w);

i = i + 1;
end





end