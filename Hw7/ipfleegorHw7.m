
% init workspace
clc, clear, close all;

disp('');
disp('=========== Problem 1 ==========');


%create step wave form

step_t = [ones(1,4),zeros(1,4)];

%Part A

subplot(2,2,1);
dfs(step_t,4,1,1);
title('1A: m=4,n=8');

%Part B

subplot(2,2,2);
dfs(step_t,4,1,0);
title('1B: m=4,n=8, interpolated');

%Part C

subplot(2,2,3);
dfs(step_t,3,1,0);
title('1C: m=3,n=8, interpolated');

%Part D

subplot(2,2,4);
dfs(step_t,2,1,0);
title('1D: m=2,n=8, interpolated');

%Part E


return

disp('');
disp('=========== Problem 2 ==========');

%Part A
pulse_wave = [zeros(1,5),ones(1,4),zeros(1,5)];

subplot(3,2,1);
dfs(pulse_wave,0,1,0);

X = fft(pulse_wave);
X_1 = fftshift(X);


fs = 1;
time_domain = -fs/2:1/length(X):fs/2-1/length(X);
subplot(3,2,3);
plot(time_domain,abs(X_1),'-o');

% Part B

pulse_wave_2 = [zeros(1,10),ones(1,8),zeros(1,10)];
subplot(3,2,2);
dfs(pulse_wave_2,0,1,0);

X = fft(pulse_wave_2);
X_2 = fftshift(X);

fs = 2;
time_domain = -fs/2:1/length(pulse_wave):fs/2-1/length(pulse_wave);
subplot(3,2,4);
plot(time_domain, abs(X_2),'-o');

% [a0,a,b] = dfs(pulse_wave_2,0,1,0);

%Part C

pulse_wave = [zeros(1,5),ones(1,4),zeros(1,5)];
X = fft(pulse_wave, 256);
X_2 = fftshift(X);
fs = 1;
time_domain = -fs/2:1/length(X_2):fs/2-1/length(X_2);

subplot(3,2,5);
plot(time_domain,abs(X_2),'-');

%pad the singal with twice the samples

pulse_wave_2 = [zeros(1,10),ones(1,8),zeros(1,10)];
X = fft(pulse_wave_2,256);
X_2 = fftshift(X);

fs = 2;
time_domain = -fs/2:1/(length(X_2)/2):fs/2-1/(length(X_2)/2);
subplot(3,2,6);
plot(time_domain, abs(X_2),'-');


disp('');
disp('=========== Problem 3 ==========');

pulse_wave = [zeros(1,9),ones(1,1),zeros(1,9)];
subplot(2,1,1);
dfs(pulse_wave,0,1,0);

X = fft(pulse_wave);
X_1 = fftshift(X);


fs = 1;
time_domain = -fs/2:1/length(X):fs/2-1/length(X);
subplot(2,1,2);
sp2 = plot(time_domain,abs(X_1),'-');

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
sound(dec_sig)

choice = menu('Choose a demodulating sin frequency',...
    '10Khz','20Khz','30Khz','40Khz','50Khz','Quit');
end
