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
%V' matrix
V = [ cosd(60), sind(60); -sind(60), cosd(60)];

% part a (rotate point)
q_rotate = V*q;
p_v = V*p
%part b (stretcher matrix to extract x value)
S = [ 1, 0; 0, 0];
p_s = S*p_v
%part c(rotate the point back)
p_u = V'*p_s

%"hang" the point back using the U matrix "R'"
%part d (plot original point and projected point)


origin = [0;0]
projeted_point = [p_u(1,1);p_u(2,1)]

q_vec = [origin,projeted_point];

%plot the original vector to the projected point

plot(q_vec);
hold on
% plot projected point
plot(p_u(1,1),p_u(2,1),'o');

%plot original point
plot(p(1,1),p(2,1),'ro');


%part e
disp('point projection using vector project matrix derived from q');
x_1 = q*q'*p
disp('point projection using svd')
p_u



%problem 3
disp('');
disp('================Problem 3 ==============');
r = 0.5 +(1.5 -0.5).*rand(1000,1);
t = linspace(0,2*pi,1000);

y_t = cos(t).*r';
x_t = sin(t).*r';
figure
% plot(x_t,y_t,'.')

M = [x_t;y_t];
% Part A
r = 0.7 +(1.2 - 0.7).*rand(500,1);
t = linspace(0,2*pi,500);


x_t = cos(t).*r';
y_t = sin(t).*r';
figure
plot(x_t,y_t,'.')

M = [x_t;y_t];

% get covariance matrix
cov_M = cov(M');
% get eigen values from cov matrix
[V_e,S_e] = eig(cov_M);


a = V_e(1,:);
a_plot = [0,0;a];
b = V_e(2,:);
b_plot = [0,0;b];
hold on 
axis equal
plot(a_plot, b_plot);
%get pricipcal component vectors
%  [U,S,V] = svd(M);
%principal components in U
% disp(U);




%get x and y values from projected data
% x_1 = M_1(1,:);
% y_1 = M_1(2,:);

%Part B

%project values onto basic vectors

%plot new data
%  plot(x_1,y_1, 'o');
x_1= a'*a*M;
x_2 = b'*b*M;
figure
hold on
plot(x_1(1,:), x_1(2,:),'o');
plot(x_2(1,:), x_2(2,:),'o');
% turn off diary logging
diary off