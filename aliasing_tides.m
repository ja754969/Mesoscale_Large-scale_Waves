clear;clc;close all
%% hourly data
n = 0:1:24*300';
random_phase = normrnd(0,0.1,1,numel(n)); % r = normrnd(mu,sigma,sz1,...,szN)
F = cos(2*pi/23.93*n + random_phase)' + sin(2*pi/12.42*n + random_phase)';
mean_F = mean(F);
%% Sampling interval is 8-hour
F_sample = F(1:8:end);
mean_F_smaple = mean(F_sample);
%% Compare the signals
figure
ax1 = axes;
ax1.Position = [0.05 0.7 0.9 0.3];
plot(n,F,'-','Color',[0.5 0.5 0.5])
ylabel('sea level height')
axis tight

ax2 = axes;
ax2.Position = [0.05 0.37 0.9 0.3]
plot(n(1:8:end),F_sample,'.r:')
ylabel('sea level height')
axis tight

ax3 = axes;
ax3.Position = [0.05 0.05 0.9 0.3]
plot(n,F,'-','Color',[0.5 0.5 0.5])
ylabel('sea level height')
hold on;
plot(n(1:8:end),F(1:8:end),'.r-')
axis tight
%% Sepctral Analysis
figure
[Power,Y,frequency,period,Length_of_signal] = signal_fft(F,1);
semilogx(period,Power)
xlabel('period (hour)')
ylabel('Spectral Power')
figure
[Power,Y,frequency,period,Length_of_signal] = signal_fft(F_sample,1);
semilogx(period*8,Power)
xlabel('period (hour)')
ylabel('Spectral Power')