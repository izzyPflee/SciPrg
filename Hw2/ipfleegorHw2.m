% Isaac Pfleegor
% CSCD 409, Homework 2
% <04/05/2016>
%
clc, clear, close all ;

% the following is to help the grader (substitute your name)
diary ipfleegorHw2.txt

% Always display your name at runtime
disp('Isaac Pfleegor- CSCD 409 Homework 2') ;

% change to Octave to Matlab if that's what you use
disp('This assignment was tested in Matlab') ;   

%Create saw180 function as specified by assignment directions
saw180=@(x)x-(x>180)*360;

% Problem 1
disp(' ') ;  % to get a new line
disp('====== Problem 1 ======') ;
disp('Isvarname Tests for legitimate variable names:')
disp('fred')
isvarname fred
% more isvarname testing goes here

disp('which testing:')
% do some which tests too
% test reassignment of tan

% Problem 2
disp(' ') ;  % to get a new line
disp('====== Problem 2 ======') ;
val = log(10);

bases_t= [1:10];
bases_t = log(bases_t);

ans = val ./ bases_t

% Problem 3
disp(' ') ;  % to get a new line
disp('====== Problem 3 ======') ;
max_h = tand(33)*120
min_h = tand(27)*120
% Problem 4
disp(' ') ;  % to get a new line
disp('====== Problem 4 ======') ;
G = [68, 83, 61, 70, 75, 82, 57, 5, 76, 85, 62, 71, 96, 78, 76, 68, 72, 75, 83, 93];
mean = mean(G)
median = median(G)
histogram_fig = histogram(G);
%The  median more accurately represents the typical grade. 
% When looking at the histogram, we can see that most of the 
% grades are in the 60-80's bin. There are outliers that 
% affect that skew the average, so I would say that the median 
% represents the most typical grade.
G_count = nemel(G)
G_sorted = sort(G)
%standard deviation
standard_dev = std(G)


% Problem 5
disp(' ') ;  % to get a new line
disp('====== Problem 5 ======') ;

% Problem 6
disp(' ') ;  % to get a new line
disp('====== Problem 6 ======') ;

%load thermo_scores.dat
load thermo_scores.dat -ascii
student5 = thermo_scores(5,:);
students = thermo_scores(:,1);
test1 = thermo_scores(:,2)';
test2 = thermo_scores(:,3)';
test3 = thermo_scores(:,4)';

final_scores = (test1+test2+test3)/300 * 100;
scores_table = table(students, test1', test2', test3', final_scores',...
    'VariableNames',{'StudentID' 'Test1' 'Test2' 'Test3' 'FinalScore'})

%In case the table should be sorted by scores instead of student ids
% scores_table_score_sorted = sortrows(scores_table,5)


disp('test1 std_dev and var');
std(test1)
var(test1)
disp('test2 std_dev and var');
std(test2)
var(test2)
disp('test3 std_dev and var');
std(test3)
var(test3)






% display the vector for each format
disp('format short:') ;
% etc ...

format short ; % restore things

% Problem 7
disp(' ') ;  % to get a new line
disp('====== Problem 7 ======') ;

R = 0.2870;
[T, P] = meshgrid(100:300:1000, 100:300:1000);
T = R*T;
Ans = T./P
% Problem 8
disp(' ') ;  % to get a new line
disp('====== Problem 8 ======') ;
A = [1 3 5];
B = [-3 -2 4];
disp('dot(A,B)')
dot(A,B)
disp('dot(B,A)')
dot(B,A)
A = [0 -1 -4 -8];
B = [4 -2 -3 24];
disp('dot(A,B)')
dot(A,B)
disp('dot(B,A)')
dot(B,A)




% at the end always do this
diary off
% Problem 9
disp(' ') ;  % to get a new line
disp('====== Problem 9 ======') ;

A = [3 4 2 -0 0 7 0;
2 -2 3 -4 5 2 8;
0 2 3 0 2 4 6;
5 10 4 3 9 -2 0;
3 2 -2 -4 -5 -6 7;
-2 9  0 3 -3 5 0;
0 -2 -8 4 2 4 5];

B = [42;
32;
12;
-5;
10;
18;
17];

%Solve intially using left-division
X = A\B

%now test each method 10,000 times
tic
start_time = toc;
i = 0;
while(i < 100000)
    X = A\B;
    i = i + 1 ;
end

end_time = toc;

total_time = end_time - start_time;
disp('seconds elapsed for 100000 iterations with left div:');
disp(total_time);

%solve using matrix inverse
X = inv(A)*B %#ok<MINV>
i = 0;
start_time = toc;
while(i < 100000)
    X = inv(A)*B;
    i= i + 1;
end
end_time = toc;

total_time = end_time - start_time;
disp('seconds elapsed for 100000 iterations with inverse matrix:');
disp(total_time);




