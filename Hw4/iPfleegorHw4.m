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

q = [ 0.5; 0.866];
p = [ 2; 1];
R = [ cosd(60), sind(60); -sind(60), cosd(60)];

% part a (rotate point)
q_rotate = R*q
p_rotate = R*p
%part b (stretcher matrix to extract x value)
S = [ 1, 0; 0, 0];
s_rot_trans = S*p_rotate
%part c(rotate the point back)
s_rot_trans_back = R'*s_rot_trans
%part d (plot original point and projected point)

%problem 3
disp('');
disp('================Problem 3 ==============');
r = 0.5 +(1.5 -0.5).*rand(1000,1);
t = linspace(0,2*pi,1000);

y_t = cos(t).*r';
x_t = sin(t).*r';
plot(x_t,y_t,'.')

M = [x_t;y_t];

% turn off diary logging
diary off