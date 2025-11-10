fs = 1000;
t = 0:1/fs:4*%pi;
y = sin(t);

Fs = 10;                            // Frequency of pulse train
pulse = 0.5 * (1 + squarewave(Fs * t)); // 50% duty cycle pulse train

y_sam = y .* pulse;                // Naturally sampled signal

// Plotting
subplot(3,1,1);
plot(t, y);
xtitle("Original Sine Wave", "Time", "Amplitude");

subplot(3,1,2);
plot(t, pulse);
xtitle("Pulse Train", "Time", "Amplitude");

subplot(3,1,3);
plot(t, y_sam);
xtitle("Naturally Sampled Signal", "Time", "Amplitude");
