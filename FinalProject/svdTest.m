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