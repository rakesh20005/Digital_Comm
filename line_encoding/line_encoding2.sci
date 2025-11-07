clc;
clear;
close;

bits = [1,0,1,1,1];
A = 1;
n = 100;
Tb = 1;
t = 0:(Tb/n):Tb*length(bits)-(Tb/n);

manchester = [];
bipolar_nrz = [];
bipolar_rz = [];
last_bipolar = -A;

for i = 1:length(bits)
    if bits(i) == 1 then
        last_bipolar = -last_bipolar; // Alternate polarity for 1s
        bipolar_nrz = [bipolar_nrz last_bipolar*ones(1,n)];
        bipolar_rz = [bipolar_rz last_bipolar*ones(1,n/2) zeros(1,n/2)];
        manchester = [manchester A*ones(1,n/2) -A*ones(1,n/2)];
    else
        bipolar_nrz = [bipolar_nrz zeros(1,n)];
        bipolar_rz = [bipolar_rz zeros(1,n)];
        manchester = [manchester -A*ones(1,n/2) A*ones(1,n/2)];
    end
end

// --- Plotting Section ---
f = scf(0);
clf(f);

tt = 0:Tb:(length(bits)-1)*Tb;

// Plot Input Bit Sequence
subplot(4,1,1);
plot2d2(tt, bits);
xtitle('Input Bit Sequence','','Amplitude');
xgrid();

// Plot Manchester
subplot(4,1,2);
plot(t, manchester, 'LineWidth', 2);
xtitle('Manchester Line Coding','','Amplitude');
xgrid();

// Plot Bipolar NRZ
subplot(4,1,3);
plot(t, bipolar_nrz, 'LineWidth', 2);
xtitle('Bipolar NRZ Line Coding','','Amplitude');
xgrid();

// Plot Bipolar RZ
subplot(4,1,4);
plot(t, bipolar_rz, 'LineWidth', 2);
xtitle('Bipolar RZ Line Coding','','Amplitude');
xgrid();

show_window();
