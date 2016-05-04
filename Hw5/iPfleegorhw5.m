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

load lake_powell.dat

%sum each year and put into a column vector
[num_months,num_years] = size(lake_powell)
year_sums = lake_powell'*ones(num_months,1)
year_avgs = year_sums / num_months
total_sum = year_sums' * ones(num_years,1)
total_avg = total_sum / num_years

%problem 4

base = 2000;
mo_contrib = 175;
mo_interest = 0.0041;
%12 months * 18years
total_months = 12 * 18;

balance_ledger = zeros(1,total_months);

balance_ledger(1,1) = base + (base + mo_contrib)*mo_interest + mo_contrib;

% 
% New balance = Old balance + interest + your contribution
for i = 2:total_months
    %get the old balance from ledger
    old_balance = balance_ledger(1, i-1);
    %add interest and new contribution to old_balance
    new_balance = old_balance + old_balance*mo_interest + mo_contrib;
    balance_ledger(1,i) = new_balance;
end

count = 1:total_months;
figure
plot(count,balance_ledger);
xlabel('months');
ylabel('balance');
% Find the amount in the savings account each month for the next 18 years (create a vector of the
% values). A for loop is fine here. Plot the amount in the account as a function of elapsed time in
% months.

%end of file
diary off
