% filename = uigetfile('*.csv'); 
% M = csvread(filename,1,2); 
rawSignal = Attention; 
[r, c] = size(Attention); 
L = r; Fs = 512; 
T = 1/Fs; 
t = (0:L-1)*T; 
figure
Y = fft(rawSignal); 
P2 = abs(Y/L); 
P1 = P2(1:L/2+1); 
P1 (2:end-1) = 2*P1(2:end-1); %P1 nilai tertinggi
f = Fs*(0:(L/2))/L; 
plot(f, P1); 
grid on;
[pks,locs] = findpeaks(P1, 0.75);
excel = findpeaks(P1, 0.75); %excel nilai terendah
findpeaks(P1,f);
findpeaks(P1,f, 'MinPeakDistance', 0.75)
text(locs-.1,pks+1,num2str((1:numel(pks))'));
xlim([0 256])
ylim([0 20.22])
legend('EEG Signal (FFT)', 'Frequency above 0,75Hz')
title('Spectrum Signal');
xlabel('Frequency(Hz)'); 
ylabel('Amplitude');
%xlswrite('one.xlsx',[excel]);