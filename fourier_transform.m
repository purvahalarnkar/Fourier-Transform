clc
clear all
close all

%% Generate multispectral noise signal

%simulation parameters
rate = 1234; %in Hz
points = rate*2; % 2 seconds 
time = (0:points-1)/rate;

%frequencies to include
f = [10 20 30 40 50];

%create the signal
signal_t=zeros(size(time));
for i=1:length(f)
    signal_t=signal_t+i*sin(2*pi*f(i)*time);
end

%Add noise to this signal
signal_n=signal_t+randn(size(signal_t));

plot(time,signal_n)
xlabel('Time(s)')
ylabel('Amplitude')
title('Noisy Signal: Time Domain')

%% Amplitude Spectrum via Fourier Transform

signal_f=2*abs(fft(signal_n))/points;

%Vector of frequencies in Hz
hz=linspace(0,rate/2,floor(points/2)+1);

figure
stem(hz,signal_f(1:length(hz)))
set(gca,'xlim',[0 max(f)*2])
title('Spectrum of Noisy Signal: Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Amplitude')
