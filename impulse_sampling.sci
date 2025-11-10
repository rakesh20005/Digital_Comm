f=50;
fs = 1000;
t = 0:1/fs:2*%pi;
y = sin(2*%pi*f*t);
Fs = 10;
Ts = 1 / Fs;

pulse = zeros(y);
indices = 1:round(fs/Fs):length(t);
pulse(indices) = 1;

y_sam = y .* pulse;

// Plotting
subplot(3,1,1);
plot(t, y);
xtitle("Original Sine Wave", "Time", "Amplitude");

subplot(3,1,2);
plot(t, pulse);
xtitle("Impulse Train", "Time", "Amplitude");

subplot(3,1,3);
plot(t, y_sam);
xtitle("Impulse Sampled Signal", "Time", "Amplitude");
