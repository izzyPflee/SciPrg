
%init workspace
clc, clear, close all;

%temp before making a function
%load variables from file
load mix2016.mat

%step size for kurtosis
%values has been taken from online example
h = 1e-5;
%step size for gradient ascent
eta = 2e-1;
%tolerance limit before stopping
tol = 1e-5;
mxi = 400;
%call ppursuit function

ppursuit2(h,eta,tol,mxi,x);