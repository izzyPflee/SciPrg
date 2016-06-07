
% Isaac Pfleegor
% CSCD 409, Final Project
% <06/05/2016>
%

%init workspace
clc, clear, close all;

disp('Isaac Pfleegor - CSCD 409 Final Project');
disp('This assignment was tested in Matlab');

%temp before making a function
%load variables from file
load mix2016.mat

%step size for kurtosis
h = 1e-5;
%step size for gradient ascent
eta = 2e-1;
%tolerance limit before stopping
tol = 1e-5;
mxi = 200;
%call ppursuit function

[y,K] = ppursuit(h,eta,tol,mxi,x);