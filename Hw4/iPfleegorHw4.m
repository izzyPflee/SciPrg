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
	figure
	plot(M_1(:,1),M_1(:,2))
    title('p1: unit circle')
	
hanger_M = [[1/sqrt(2);1/sqrt(2)], [1/sqrt(2);-1/sqrt(2)]];
M_2 = M_1*(hanger_M);

figure
plot(M_2(:,1),M_2(:,2))
title('p1: final plot');


%problem 2
disp('');
disp('================Problem 2 ==============');

q = [ 0.5; 0.866];
p = [ 2; 1];
%V' matrix
V = [ cosd(60), sind(60); -sind(60), cosd(60)];

% part a (rotate point)
disp('problem 2, part a answer:');
q_rotate = V*q;
p_v = V*p
%part b (stretcher matrix to extract x value)
S = [ 1, 0; 0, 0];
disp('problem 2, part b answer: ');
p_s = S*p_v

%part c(rotate the point back)
%"hang" the point back using the U matrix "R'"
disp('problem 2, part c answer:');
p_u = V'*p_s
%part d (plot original point and projected point)
x_vals = [0, p_u(1,1)];
y_vals = [0, p_u(2,1)];

%plot the original vector to the projected point
figure
% plot(q_vec);
plot(x_vals, y_vals);
hold on
% plot projected point
plot(p_u(1,1),p_u(2,1),'o');

%plot original point
plot(p(1,1),p(2,1),'ro');

title('problem 2 plot');

%part e
disp('problem 2, part e answer: ');
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

% plot(x_t,y_t,'.')

M = [x_t;y_t];
% Part A
%create cloud of data
r = 0.7 +(1.2 - 0.7).*rand(500,1);
t = linspace(0,2*pi,500);
%get x and y values using t
x_t = cos(t).*r';
y_t = sin(t).*r';
figure
plot(x_t,y_t,'.')

M = [x_t;y_t];

% get covariance matrix
cov_M = cov(M');
% get eigen values from cov matrix
[V_e,S_e] = eig(cov_M);

%get pricipcal component vectors
a = V_e(1,:);
a_plot = [0,0;a];
b = V_e(2,:);
b_plot = [0,0;b];
hold on 
axis equal
plot(a_plot, b_plot);

title('problem 3, part a plot');


%Part B

%project values onto basic vectors

%plot new data

%project data cloud onto principal components
x_1= a'*a*M;
x_2 = b'*b*M;
figure
hold on
%plot each component on each vector
plot(x_1(1,:), x_1(2,:),'o');
plot(x_2(1,:), x_2(2,:),'o');
title('problem 3, part b plot');
%Part C
%square x and y values
x_t2 = x_t.^2;
y_t2 = y_t.^2;
figure
plot(x_t2, y_t2, '.');
title('problem 3, part c plot');
%problem 4
disp('');
disp('================Problem 4 ==============');

% Start by generating 1024 samples for R and I around the unit circle.
% Then approximate the unit magnitude
% using the linear approximation with the following coefficients:
% i) a = 0.94754, b = 0.39249: these values minimize the RMS error
% ii) a = 0.96043, b = 0.39782: these values ensure that the max 
%and min errors are balanced around 0.


angles = 0:360/1200:360;
R = cos(angles);
I = sin(angles);

circle_M = [R,I];
figure
polar(angles,ones(1,1201))
hold on

%coefficients
rms_a = 0.94754;
rms_b = 0.39249;
min_max_error_a = 0.96043;
min_max_error_b = 0.39782;

%vectors to hold value * coefficents
rms_R = zeros(1,1201);
rms_I = zeros(1,1201);
min_max_error_R = zeros(1,1201);
min_max_error_I = zeros(1,1201);


%cycle through all values of R and I
for i = 1:1201
    %for storing temp values
    temp_r = abs(R(1,i));
    temp_i = abs(I(1,i));
    %conditional for multiplying coefficents
    if(temp_r >= temp_i)
        rms_R(1,i) = temp_r*rms_a;
        min_max_error_R(1,i) = temp_r*min_max_error_a;
        
        rms_I(1,i) = temp_i*rms_b;
        min_max_error_I(1,i) = temp_i*min_max_error_b;
    else
        rms_R(1,i) = temp_r*rms_b;
        min_max_error_R(1,i) = temp_r*min_max_error_b;
        
        rms_I(1,i) = temp_i*rms_a;
        min_max_error_I(1,i) = temp_i*min_max_error_a;
    end
end

%add vectors
rms_error_mag = rms_R +rms_I;
min_max_error_mag = min_max_error_R + min_max_error_I;
%plot results
polar(angles, rms_error_mag )
polar(angles, min_max_error_mag)

title('problem 4: polar plot');



   
legend('unit circle', 'min RMS error', 'min = max error');


% turn off diary logging
diary off