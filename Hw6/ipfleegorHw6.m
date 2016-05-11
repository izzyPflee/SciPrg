% Isaac Pfleegor
% CSCD 409, Homework 6
% <05/08/2016>
%
clc, clear, close all ;


disp('');
disp('=============== Problem 1 ===============');
% 
% %read the file
% 
% file_id = fopen('molecule.txt', 'r');
% 
% temp = fgetl(file_id);
% 
% while ischar(temp)
%     disp(temp)
%     temp = fgetl(file_id);
% end
% 
% fclose(file_id);

% disp('');
% disp('=============== Problem 2 ===============');
% 
% volume = 1:6; %in m^3 units
% pressure = [2494, 1247, 831, 623, 499, 416];%in kPa units
% 
% figure
% val1 = interp1(volume, pressure, 3.8);
% plot(volume, pressure,'x', 3.8, val1, 'o');
% title('linear1');
% 
% figure
% val2 = interp1(volume, pressure, 3.8, 'spline');
% plot(volume, pressure,'x', 3.8, val2, 'o');
% title('spline1');
% 
% figure
% val3 = interp1(pressure,volume, 1000);
% plot(volume,pressure,'x', val3, 1000, 'o');
% title('linear2');
% 
% figure
% val4 = interp1(pressure,volume, 1000, 'spline');
% plot(volume,pressure,'x', val4, 1000, 'o');
% title('spline2');
% 
% disp('');
% disp('=============== Problem 3 ===============');




disp('');
disp('=============== Problem 4 ===============');

%example data
% x = 0:5;
% y=[15,10,9,6,2,0];
% coef=polyfit(x,y,2);
% new_y = polyval(coef,x);
% new_y
% plot(x,y,'o',x,new_y,'-x');
% axis([-1,6,-1,16])

% x = 1:5;
% y = [5.5 13 22 49 92];
% % 
% coef = polyfit(x,log(y),1)
% q = exp(coef(2))
% r = exp(coef(1))
% newx = 1:0.1:5;
% newy = q*r.^newx;
% figure
% h = plot(x,y,'o', newx, newy, '-');
% 
% set(h,'linewidth',2);
% 

load hwdata.mat

%formula taken from matlab forum
% sigma=sqrt(-1/(2*A2)); 
% mu=A1*sigma^2; 
% A=exp(A0+mu^2/(2*sigma^2));

%Part A

coef = polyfit(x,log(y),2);

A0 = coef(3);
A1 = coef(2);
A2 = coef(1);

% sigma = sqrt(A2/2);
% mu = sigma.^2 * A1;
% A = exp(A0+mu.^2/(2*sigma.^2));

sigma=sqrt(-1/(2*A2)); 
mu=A1*sigma^2; 
A=exp(A0+mu^2/(2*sigma^2));

newx = -4:0.1:4;
newy = A*(exp(-1*((newx-mu).^2)/(2*sigma.^2)));

figure
h = plot(x,y,'o', newx, newy, '-');
return
%Part B

%pre-condition the y2 data
x2 = x(12:33);
y2_conditioned = y2(12:33);

%get coefficients of the ln of the data
coef = polyfit(x2, log(y2_conditioned),2);
%plot line of best fit
plot(x2, exp(polyval(coef,x2)));

% A0 = coef(1);
% A1 = coef(2);
% A2 = coef(3);
% 
% sigma = sqrt(A2/2);
% mu = sigma.^2 * A1;
% A = exp(A0+mu.^2/(2*sigma.^2));
% 
% newx = -4:0.1:4;
% newy = A*(exp(-1*((newx-mu).^2)/(2*sigma.^2)));
% 
% figure
% h = plot(x,y,'o', newx, newy, '-');
% 




