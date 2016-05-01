% Isaac Pfleegor
% CSCD 409, Homework 5
% <05/04/2016>
%
clc, clear, close all ;

% the following is to help the grader (substitute your name)
diary ipfleegorHw5.txt

% Always display your name at runtime
disp('Isaac Pfleegor- CSCD 409 Homework 5') ;

% change to Octave to Matlab if that's what you use
disp('This assignment was tested in Matlab') ;   

%problem 1
disp('');
disp('================Problem 1 ==============');

x = -5:0.5:5; 
y = -5:0.5:5;

%create 2d matrix with x and y
[X,Y] = meshgrid(x,y);

X_2 = X.^2;
Y_2 = Y.^2;

Z = sin(sqrt(X_2 + Y_2));
%TODO:find a way to adjust figure size by default 
figure
subplot(1,3,1);

%plot subplots and add labels

mesh(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z');

subplot(1,3,2);
surf(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z');

subplot(1,3,3);
mysurfc(1.2, X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z');

%problem 2
disp('');
disp('================Problem 2 ==============');

%end of file
diary off
