

clc, clear, close all;

disp('');
disp('========== Problem 1 ==========');

disp('Test IhpBabylonian function on input:5,7,8');

res1 = IhpBabylonian(5)
res2 = IhpBabylonian(7)
res3 = IhpBabylonian(8)

disp('Test results by squaring');

res1 .^ 2
res2 .^ 2
res3 .^ 2

disp('');
disp('========== Problem 2 ==========');

% Use fminbnd() to find a minimum of (x ? 0.7)2 on the interval [0,1].

f = @(x)(x-0.7).^2;

min = fminbnd(f,0,1)

%visual root check
% plot(0:10,f(0:10))

disp('');
disp('========== Problem 3 ==========');

% Use bisect.m from the website to find the square roots of 
% the same numbers to a tolerance of 0.0001.
% Show double-checks on your answers as above.

tol = .0001;
%functions to obtain roots
f1 = @(x)x.^2 - 5;
f2 = @(x)x.^2 - 7;
f3 = @(x)x.^2 - 8;
%results for each function
disp('Square Roots for inputs: 5,7,8');
r1 = bisect(f1,0,5,tol)
r2 = bisect(f2,0,7,tol)
r3 = bisect(f3,0,8,tol)

disp('Test results by squaring');

r1 .^ 2
r2 .^ 2
% ask why result doesn't always produce 8
r3 .^ 2 
disp('');
disp('========== Problem 4 ==========');

disp('');
disp('========== Problem 5 ==========');


[x,fval] = fminsearch('IhpProb5Cost',[0.5, 0.5])


disp('');
disp('========== Problem 6 ==========');

p1 = [0,0];
p2 = [1.8,0];
p3 = [1.5,1];
p4 = [0.3,1.6];

%guess points for p5 and p6
p5 = [1,1];
p6 = [2,2];
%want to pass p5 and p6 as a single parameter
points = [p5, p6];

[x, fval] = fminsearch('IhpProb6Cost', points)




