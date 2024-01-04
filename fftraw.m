% filename = uigetfile('*.csv'); 
% M = csvread(filename,1,2); 
rawSignal = Attention; 
[r, c] = size(Attention); 
L = r; 
Fs = 512; 
T = 1/Fs; 
t = (0:L-1)*T; 

figure 
subplot(2,1,1); 
plot(rawSignal); 
title('Raw Signal');
xlabel('Time(s)')
ylabel('Amplitude')
Y = fft(rawSignal); 
P2 = abs(Y/L); 
P1 = P2(1:L/2+1); 
P1(2:end-1) = 2*P1(2:end-1); 
f = Fs*(0:(L/2))/L; 

subplot(2,1,2); 
plot(f, P1); 
title('Spectrum Signal'); 
xlabel('Frequency(Hz)'); 
ylabel('Amplitude');