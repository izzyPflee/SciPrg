
% init workspace
clc, clear, close all;

% disp('');
% disp('=========== Problem 1 ==========');
% 
% 
% %create step wave form
% 
% step_t = [ones(1,4),zeros(1,4)];
% 
% %part A
% % Use the dfs() function on the course website to look at the trigonometric (Fourier)
% % interpolation for the value of m that the theory says should give you an exact interpolation.
% % Tell it to plot the sinusoidal (Fourier) interpolation with a stepsize of 1 (you’ll then be
% % looking at a strictly linear interpolation provided by the plot function).
% figure
% dfs(step_t,4,1,1);
% title('1A: m=4,n=8');
% 
% % part B
% % Do it again, but tell it to plot with the default stepsize (which is 10 points per original
% % sample). This will reveal the shape of the summed sinusoids between samples. This time let
% % it print the coefficients, as you’ll need to compare them to the coefficients produced by the
% % equivalent Fourier analysis produced by the fft() function below
% figure
% dfs(step_t,4,1,0);
% title('1B: m=4,n=8, interpolated');
% 
% %part C
% % Now look at the interpolation for m one less than that used in part a. The results may
% % surprise you. Provide a short explanation (in a disp or fprintf) as to why this looks the same
% % as part a, even though we’re using fewer basis functions for the fit. Or are we?
% figure
% dfs(step_t,3,1,0);
% title('1C: m=3,n=8, interpolated');
% 
% %Part D
% % Now look at the interpolation for m two less than that used in part a. Provide a short
% % explanation for why the fit does not pass through the sample points.
% figure
% dfs(step_t,2,1,0);
% title('1C: m=2,n=8, interpolated');

% disp('');
% disp('=========== Problem 2 ==========');
% 
% %Part A
% pulse_wave = [zeros(1,5),ones(1,4),zeros(1,5)];
% 
% % [a0,a,b] = dfs(pulse_wave,0,1,0);
% 
% X = fft(pulse_wave);
% X_1 = fftshift(X);
% fs = 1;
% time_domain = -fs/2:1/length(pulse_wave):fs/2;
% 
% plot(time_domain,X_1,'o');
% 

% % Part B
% 
% pulse_wave_2 = [zeros(1,10),ones(1,8),zeros(1,10)];
% [a0,a,b] = dfs(pulse_wave_2,0,1,0);
% 
% 
% %Part C
% X = fft(pulse_wave,256);

disp('');
disp('=========== Problem 4 ==========');

%loads Fs and s variables
load modulated.mat

%generate demodulating sinusoid at desired frequency
t = 0:1/Fs:length(s)/Fs - (1/Fs);
A = 1;
%5 channels are centered at 10 kHz, 20 kHz, 30 kHz, 40 kHz, and 50 kHz.
f =1e4;
y = A*sin(2*pi*f*t);
% plot(t(1:100),y(1:100))

demod_sig = s .* y;

%decimate by a factor of 15 to get to 8.192Khz range

dec_sig = decimate(demod_sig,15);

%extract the real parts of signal and play back
sound(dec_sig)

