function [Power,Y,frequency,period,Length_of_signal] = signal_fft(signal,sampling_frequency)

Length_of_signal = size(signal,1); 
Y = fft(signal);
P2 = abs(Y/Length_of_signal);
Power = P2(1:Length_of_signal/2+1);
Power(2:end-1) = 2*Power(2:end-1);
frequency = sampling_frequency*(0:(Length_of_signal/2))/Length_of_signal;
period = 1./frequency;
end