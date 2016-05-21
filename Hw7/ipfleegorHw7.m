% Isaac Pfleegor
% CSCD 409, Homework 7
% <05/19/2016>
%
clc, clear, close all ;

disp('Isaac Pfleegor - CSCD 409 Homework 7');
disp('This assignment was tested in Matlab');

diary ipfleegorHw7.txt

disp('');
disp('=========== Problem 1 ==========');


%create step wave form

step_t = [ones(1,4),zeros(1,4)];

%Part A
figure
subplot(2,2,1);
dfs(step_t,4,1,1);
title('1A: m=4,n=8');

%Part B

subplot(2,2,2);
[a0,a,b] = dfs(step_t,4,1,0)
title('1B: m=4,n=8, interpolated');

%Part C

subplot(2,2,3);
[a0,a,b] =  dfs(step_t,3,1,0)
title('1C: m=3,n=8, interpolated');
disp('Part C: We can see through observation of the coefficients in');
disp('part b that the coefficients for the last sin and cos basis functions are');
disp('0, so when they are missing in part C, the shape doesnt change.');
disp('');
%Part D

subplot(2,2,4);
[a0,a,b]= dfs(step_t,2,1,0)
title('1D: m=2,n=8, interpolated');
disp(' ');
disp('Part D: We can see by looking at the coefficients of the basis functions');
disp('that the second sin and cos basis functions are also 0, so the fit is ');
disp('made by 2 basis functions which are insufficient to fit through the points.');
disp(' ');

%Part E
disp('Part E: ');
disp('There is a difference in scale factor between the coefficients');
disp('We can get to the coefficients from the fft to the dfs by multiplying the');
disp('values by the appropriate scalar');

[a0,a,b]= dfs(step_t,4,0,0)
X = fft(step_t)'


disp('');
disp('=========== Problem 2 ==========');
figure
%Part A
pulse_wave = [zeros(1,5),ones(1,4),zeros(1,5)];

subplot(3,2,1);
dfs(pulse_wave,0,1,0);
title('time series n = 14');
X = fft(pulse_wave);
X_1 = fftshift(X);


fs = 1;
time_domain = -fs/2:1/length(X):fs/2-1/length(X);
subplot(3,2,3);
plot(time_domain,abs(X_1),'-o');
title('spectrum n = 14');
% Part B

pulse_wave_2 = [zeros(1,10),ones(1,8),zeros(1,10)];
subplot(3,2,2);
dfs(pulse_wave_2,0,1,0);
title('time series n = 28');
X = fft(pulse_wave_2);
X_2 = fftshift(X);

fs = 2;
time_domain = -fs/2:1/length(pulse_wave):fs/2-1/length(pulse_wave);
subplot(3,2,4);
plot(time_domain, abs(X_2),'-o');
title('spectrum n = 28');
% [a0,a,b] = dfs(pulse_wave_2,0,1,0);

%Part C

pulse_wave = [zeros(1,5),ones(1,4),zeros(1,5)];
X = fft(pulse_wave, 256);
X_2 = fftshift(X);
fs = 1;
time_domain = -fs/2:1/length(X_2):fs/2-1/length(X_2);

subplot(3,2,5);
plot(time_domain,abs(X_2),'-');
title('spectrum n = 14 padded to 256');
%pad the singal with twice the samples

pulse_wave_2 = [zeros(1,10),ones(1,8),zeros(1,10)];
X = fft(pulse_wave_2,256);
X_2 = fftshift(X);

fs = 2;
time_domain = -fs/2:1/(length(X_2)/2):fs/2-1/(length(X_2)/2);
subplot(3,2,6);
plot(time_domain, abs(X_2),'-');
title('spectrum n = 28 padded to 256');

disp('');
disp('=========== Problem 3 ==========');

figure
pulse_wave = [zeros(1,9),ones(1,1),zeros(1,9)];
subplot(2,1,1);
dfs(pulse_wave,0,1,0);
title('impulse');
X = fft(pulse_wave);
X_1 = fftshift(X);


fs = 1;
time_domain = -fs/2:1/length(X):fs/2-1/length(X);
subplot(2,1,2);
sp2 = plot(time_domain,abs(X_1),'-');
title('spectrum');
disp('');
disp('=========== Problem 4 ==========');

%loads Fs and s variables
load modulated.mat


%5 channels are centered at 10 kHz, 20 kHz, 30 kHz, 40 kHz, and 50 kHz.
choice = menu('Choose a demodulating sin frequency',...
    '10Khz','20Khz','30Khz','40Khz','50Khz','Quit');
while choice ~= 6
    %generate demodulating sinusoid at desired frequency
    switch choice
        case 1
            f = 1e4;
        case 2
            f = 2e4;
        case 3 
            f = 3e4;
        case 4
            f = 4e4;
        case 5
            f = 5e4;
        case 6
            % do nothing in this case (Quit)
    end
            
t = 0:1/Fs:length(s)/Fs - (1/Fs);
A = 1;

y = A*sin(2*pi*f*t);

demod_sig = s .* y;

%decimate by a factor of 15 to get to 8.192Khz range
dec_sig = decimate(demod_sig,15);

%extract the real parts of signal and play back
soundsc(dec_sig)

choice = menu('Choose a demodulating sin frequency',...
    '10Khz','20Khz','30Khz','40Khz','50Khz','Quit');
end

diary off
