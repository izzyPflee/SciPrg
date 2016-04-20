% Isaac Pfleegor
% CSCD 409, Homework 3
% <04/20/2016>
%
clc, clear, close all ;

% the following is to help the grader (substitute your name)
diary ipfleegorHw3.txt

% Always display your name at runtime
disp('Isaac Pfleegor- CSCD 409 Homework 3') ;

% change to Octave to Matlab if that's what you use
disp('This assignment was tested in Matlab') ;   



%problem 1
disp('');
disp('================Problem 1 ==============');

i = 0;
x1 = 1
x2 = 2
while(i < 20)
    x1 = 19 - 3*x2
    x2 = 25 - 3*x1
    i = i + 1;
    %we could print the diff between the old and new
    %vals to show difference over time
end  


disp('');
disp('================Problem 2 ==============');

%Recreate the problem B&C had in the module 5b notes

A1 = [
    93.477 10.202 -28.832;
    1.963 32.816 62.414;
    26.821 36.816 57.234;
    23.2134 -86.3925 44.693];
A2 = A1(1:3,:);

m1 =[34.7177;70.9241;82.9271;-26.2222];
m2 = m1(1:3,:);

% original m solution
res1 = A2\m2
m2_rounded = round(m2,1);

% rounded m solution
res2 = A2\m2_rounded


disp('');
disp('================Problem 3 ==============');

 
% Then compute an inverse to A from the reduced
% (economy, truncated)SVD and show that the
% solution to Ax = m is similar for both versions
% of the measurement vector m. The economy svd can be
% obtained directly from svd(A,0).  

disp('using Svd pseudo-inverse');
disp('original m');
[U,S,V] = svd(A1,0);
A_inv = V*inv(S)*U';
m_orig = A_inv * m1


disp('using Svd pseudo-inverse');
disp('rounded m');
m1_rounded = round(m1,1)
m_rounded = A_inv*m1_rounded


disp('');
 disp('================Problem 4 ==============');
% Using Bruce and Campbell’s full set of 
% equations, and the original vector,
% compare the solution in part 4 to the
% following: (i) a least-squares solution
% (solve the least-squares formulation 
% explicitly using the transpose of A),
% (ii) a solution obtained using 
% pinv(), (iii) a solution obtained
%  using the backslash operator.

disp('using least-sqaures');
% check this answer
x = A1'*m1

disp('using pinv()');
x = pinv(A1)*m1

disp('using left division');

x = A1\m1

disp('');
disp('================Problem 6 ==============');

% load the overunder file
load overunder.mat
%set min arbitrarily large, so min can be set lower
min = 10000.012;
% Create sub-matrices for residual values

for i = 1:6

    for j = (i+1):7
       
        for k = (j+1):8
           
%             fprintf('%d %d %d ', i,j,k);
%             disp(' ');
%               get sub matrix
              m_1 = [M(:,i),M(:,j),M(:,k)];
              %get x vector
              x = pinv(m_1)*y;
              %get magnitude of residual
              res_mag = sum((m_1*x - y).^2);
             %test current res_mag against min
             %if < min, set min values and indices as min
              if res_mag < min
                  min = res_mag;
                  min_i = i;
                  min_j = j;
                  min_k = k;
                  min_x = x;
              end
        end
    end
    
end

%create 8 x 1 X vector using min indices
new_x = zeros(8,1);
new_x(min_i, 1) = min_x(1)
new_x(min_j, 1) = min_x(2)
new_x(min_k, 1) = min_x(3)

%test output
disp('M*new_x');
M*new_x
disp('Existing y value:');
disp(y)

diary off