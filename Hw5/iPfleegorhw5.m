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
disp('==================Problem 2================');
load lake_powell.dat;
%sum each column
year_sums = sum(lake_powell(:,:));

disp('part a');
year_averages = (year_sums / 12)

%for total average sum all years and divide by total number of months
total_average = sum(year_sums)/(12*8)

disp('part b');
higher_than_average_months = find(year_averages>=total_average);

total_higher_months = max(higher_than_average_months);

fprintf('Number of months higher than total average: %d\n', total_higher_months);

years = 2000:2007;
%parse years and averages using index
years_above_average = years(higher_than_average_months)';
averages_above_average = year_averages(higher_than_average_months)';
disp('part c');
table(years_above_average, averages_above_average)

%problem 2
disp('');
disp('==================Problem 3================');

val1 = input('enter the first value of a fibonacci sequence: ');
val2 = input('enter the second value of a fibonacci sequence: ');

ratio = ihpFibRatio(val1,val2);

fprintf('ratio returned: %d\n', ratio);

%problem 4
disp('');
disp('================Problem 4 ==============');
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
cummulative_savings = balance_ledger(1,end);

fprintf('total savings accumulated: %d\n', cummulative_savings);
% Find the amount in the savings account each month for the next 18 years (create a vector of the
% values). A for loop is fine here. Plot the amount in the account as a function of elapsed time in
% months.

disp('');
disp('==================Problem 5================');
PercentIncrease  =  [10, 0, 10, 0, 10, 5, 5, 0, 5, 5, 0, 10, 0, 5, 10, 5, 0, 10, 0, 0, 5, 5] ;
%adjust percentage increase vector to represent decimal val
PercentIncrease = PercentIncrease *.01;
tuition_cost = 7200;
cummulative_cost = 0;
for i = 1:length(PercentIncrease)
   
    tuition_cost = tuition_cost*PercentIncrease(i) + tuition_cost;
    %total cost while student is in college
    %sum of last 4 years of tuition_cost

    if i > 18
       cummulative_cost = cummulative_cost + tuition_cost;   
    end
end

fprintf('total cost of college over 4 years: %d\n', cummulative_cost);

disp('');
disp('==================Problem 6================');
fprintf('Total savings - cummulative cost of college = %d\n', cummulative_savings - cummulative_cost);
disp('');
disp('==================Problem 7================');
figure
%calculate vals as a function of t
t = 0:30;
vals = (-9.8/2)*(t.^2)+125*t+500;
%plot the trajectory values
plot(vals)
grid on
%click on the max Y values for height
%and max x values for time elapse
%

disp('please click the approximate height of the trajectory and the');
disp('landing (x=0) and press enter');

[X,Y] = ginput;

%find Y values where Y <= 0 (landing point)
est_land_time_index = find(Y <=0);
%return time where rocket has landed
est_land_time = X(est_land_time_index);
%max function for finding max height(Y value)
est_max_height = max(Y);

fprintf('estimated max height of rocket: %d\n', est_max_height);
fprintf('estimated landing time of rocket: %d\n', est_land_time);

%end of file
diary off
