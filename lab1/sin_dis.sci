A = 1.5;
fm = 50;
fs = 200;
phi = 0;
N = 10;
n = 0:0.1:N-1;

x1 = A * sin(2 * %pi * (fm/fs) * n + phi);
subplot(2, 2, 1);
plot(n, x1, 'b', 'LineWidth', 2);
xgrid();
xlabel("Sample index n");
ylabel("Amplitude");
title("cont Sine Wave 1");

x2 = A * sin(2 * %pi * (fm/fs) * n + phi ); 
subplot(2, 2, 2);
plot2d3(n, x2);
xgrid();
xlabel("Sample index n");
ylabel("Amplitude");
title("Discrete-time Sine Wave 2");
