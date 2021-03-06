% Isaac Pfleegor
% CSCD 409, Homework 6
% <05/08/2016>
%
clc, clear, close all ;

disp('Isaac Pfleegor - CSCD 409 Homework 6');
disp('This assignment was tested in Matlab');

diary ipfleegorHw6.txt
disp('');
disp('=============== Problem 1 ===============');
% 
% %read the file
% 
file_id = fopen('molecule.txt', 'r');
% 
[Symbols, X, Y] = Ihp_parse_molecule(file_id);
figure
title('Problem 1: Atomic Symbol Plot');
hold on
for i = 1:length(Symbols)
    tmp_symbol = Symbols(:,i);
   if strcmp(strcat(tmp_symbol'), 'C') == 1
       plot(X(i),Y(i),'d');
   end
   if strcmp(strcat(tmp_symbol'), 'He') == 1
       plot(X(i),Y(i),'*');
   end
   if strcmp(strcat(tmp_symbol'), 'H') == 1
       plot(X(i),Y(i),'s');
   end
end

 fclose(file_id);

disp('');
disp('=============== Problem 2 ===============');

volume = 1:6; %in m^3 units
pressure = [2494, 1247, 831, 623, 499, 416];%in kPa units

figure
linear1 = interp1(volume, pressure, 3.8)
plot(volume, pressure,'x', 3.8, linear1, 'o');
title('Problem 2:linear1');

figure
spline1 = interp1(volume, pressure, 3.8, 'spline')
plot(volume, pressure,'x', 3.8, spline1, 'o');
title('Problem 2:spline1');

figure
linear2 = interp1(pressure,volume, 1000)
plot(volume,pressure,'x', linear2, 1000, 'o');
title('Problem 2:linear2');

figure
spline2 = interp1(pressure,volume, 1000, 'spline')
plot(volume,pressure,'x', spline2, 1000, 'o');
title('Problem 2:spline2');

disp('');
disp('=============== Problem 3 ===============');

%re-use the volume and pressure vectors from the previous problem
volume = 1:6; %in m^3 units
pressure = [2494, 1247, 831, 623, 499, 416];%in kPa units

volume_inv = volume.^-1;

coef = polyfit(volume_inv, pressure,1);

temp = (pressure .* volume)/ 8.314;
temp = mean(temp)

figure
plot(volume_inv, pressure);
title('Problem 3 P vs 1/V');
xlabel('1/V');
ylabel('Pressure');


disp('');
disp('=============== Problem 4 ===============');

load hwdata.mat

disp('Part A');

coef = polyfit(x,log(y),2);

A0 = coef(3);
A1 = coef(2);
A2 = coef(1);

%width
sigma = sqrt(-1/(A2*2))
%center
mu = sigma.^2 * A1
%amplitude
A = exp(A0+mu.^2/(2*sigma.^2))

newx = -4:0.1:4;
newy = A*(exp(-1*((newx-mu).^2)/(2*sigma.^2)));

figure
h = plot(x,y,'o', newx, newy, '-');
title('Problem 4:1st data set');
disp('Part B');

%pre-condition the y2 data
%by fitting the data to the central-tendency
x2 = x(13:30);
y2_conditioned = y2(13:30);

%get coefficients of the ln of the data
coef = polyfit(x2, log(y2_conditioned),2);

A0 = coef(3);
A1 = coef(2);
A2 = coef(1);

%width
sigma = sqrt(-1/(A2*2))
%center
mu = sigma.^2 * A1
%amplitude
A = exp(A0+mu.^2/(2*sigma.^2))

%plot line of best fit
figure
plot(x2,y2_conditioned,'o',x2, exp(polyval(coef,x2)));
title('Problem 4: 2nd data set');
diary off


