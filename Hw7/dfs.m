function [a0, a, b] = dfs(x, m, plotme, stepsize)
% [a0, a, b] = dfs(x, m, plotme, stepsize)
% 
% interpolate or approximate x using a constant
% term (a0), m cosinusoids (a) and m sinusoids (b)
% 
% x should be a row vector
% n=length(x)
% if m==0, then m=floor(n/2) sines and cosines are used
% m<floor(n/2) gives a low frequency approximation
% m=floor(n/2) gives an exact interpolation
% m>floor(n/2) will work, but the fit will be bad
% if plotme is not 0, the function and its interpolation
%    are plotted with stepsize points per sample
% if stepsize<1 then a stepsize of 10 (pts per sample) is used
%    for the interpolation
% if n is even the last entry in b (for full m) will be zero
%
% the interpolation is reconstructed from:
% k = [1 : 1/stepsize : n] with stepsize >= 1
%     stepsize > 1 will reveal Fourier interpolation
% xapprox = a0/2 + summation [ a(i) * cos(2*pi*i/n * k) 
%                            + b(i) * sin(2*pi*i/n * k]
% where the summation is taken over the frequency components
% i=1:m
%
n = length(x) ;
if m==0
    m=floor(n/2) ; 
end ;
if stepsize<1
    stepsize=10 ; 
end ;

a = zeros(1,m) ;
b = zeros(1,m) ;

% compute the sinusoidal coefficients
k = 0:(n-1) ;
for i=1:m
    w = 2*pi*i/n ;
    a(i)=x*cos(w*k)' ;
    b(i)=x*sin(w*k)' ;
end ;

% Here we use the Discrete Fourier Series convention 
% of Module 11a, which puts the scale factors on the 
% coefficient calculation so that no additional scaling
% is needed during reconstruction of x (except on a0).  
% It is worth noting that Matlab's fft() uses the most 
% common definition of the Discrete Fourier Transform, 
% which uses the opposite convention and puts the scale 
% factors on the reconstruction side. I've seen material 
% on Fourier Series and Trigonometric Analysis using both
% conventions and the convention of splitting them
% equally. Whatever. You say potato, I say pototo.
a=2*a/n ;
b=2*b/n ;

% Compute the constant coefficient
% Some texts divide this by 2
% I'm using the convention on Module 11a
% which puts the division by 2 in the
% reconstruction of x, not in the calculation
% of the coefficients.  This is more consistent
% with what you'll get from the fft() function.
a0 = 2*sum(x)/n ;

% Adjust last cos coef for even data lengths
% See module 11a, Normalization of Sinusoids,
% Special case when n is even
if n==2*m
   a(m)=a(m)/2 ;
end ;

% evaluate the approximation/interpolation
% with 10 points per sample
kk = 0:1/stepsize:(n-1) ;
xx = a0 * ones(1,length(kk)) / 2 ;
for i = 1:m
    w = 2*pi*i/n ;
    xx = xx + a(i)*cos(w*kk) + b(i)*sin(w*kk) ;
end ;

if plotme ~= 0
   plot(kk, xx, k, x, '*') ;
end ;