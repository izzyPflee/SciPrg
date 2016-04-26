% Isaac Pfleegor
% CSCD 409, Homework 4
% <04/23/2016>
%
clc, clear, close all ;

% the following is to help the grader (substitute your name)
diary ipfleegorHw4.txt

% Always display your name at runtime
disp('Isaac Pfleegor- CSCD 409 Homework 4') ;

% change to Octave to Matlab if that's what you use
disp('This assignment was tested in Matlab') ;   



%problem 1
disp('');
disp('================Problem 1 ==============');
% create unit circle data

	t = linspace(0,2*pi,100);
	x = sin(t);
	y = cos(t);
	
	M = [x;y];
	
    stretcher_M = [ [1.2, 0]', [0,0.5]'];
	
	M_1 = M'*stretcher_M;
	
	plot(M_1(:,1),M_1(:,2))
	
hanger_M = [[1/sqrt(2);1/sqrt(2)], [1/sqrt(2);-1/sqrt(2)]];
M_2 = M_1*(hanger_M);

plot(M_2(:,1),M_2(:,2))




%problem 2
disp('');
disp('================Problem 2 ==============');


% turn off diary logging
diary off