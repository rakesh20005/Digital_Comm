clc;
clear;

bits = [1,0,1,0,0,1,0,1,1,0];
n = length(bits);
Tb = 1;

fc = 100; 
A = 1;

t = linspace(0, 1, 100);  


sinwave = A * sin(2 * %pi * fc*t );


QPSK = [];

for i = 1:2:n-1
    first = bits(i);
    second = bits(i+1);

    if first==0 & second==0 then
        phase = 45*%pi/180;
    elseif first==0 & second==1 then
        phase = 135*%pi/180;
    elseif first==1 & second==1 then
        phase = 225*%pi/180;
    else
        phase = 315*%pi/180;
    end

    QPSK_BIT = A * sin(2*%pi*fc*t + phase);
    QPSK = [QPSK QPSK_BIT];
end

// ------------ Bit Axis ------------
tt = 0:Tb:(n-1)*Tb;
full_carr=[];
for i=1:n/2
    full_carr=[full_carr sinwave]
end

clf;

subplot(3,1,1);
plot2d2(tt, bits);              // 10 bits, step plot
title("Input Bits");
xlabel("Bit Index");
ylabel("Value");
xgrid();




// ------------------ Demodulation ------------------
samples_per_symbol = length(t);  // 100 samples per symbol
num_symbols = n/2;

received = QPSK;  // using your QPSK signal

detected_bits = [];  // to store demodulated bits

for k = 1:num_symbols
    % Extract the symbol from the received signal
    idx_start = (k-1)*samples_per_symbol + 1;
    idx_end = k*samples_per_symbol;
    sym = received(idx_start:idx_end);
    
    % Reference carriers for coherent detection
    t_sym = linspace(0, Tb, samples_per_symbol);
    ref_I = A * cos(2*%pi*fc*t_sym);   // in-phase
    ref_Q = A * sin(2*%pi*fc*t_sym);   // quadrature
    
    % Multiply and sum to get I and Q components
    I = sum(sym .* ref_I);
    Q = sum(sym .* ref_Q);
    
    % Determine transmitted phase
    angle = atan(Q/I) * 180/%pi;  // convert to degrees
    if angle < 0 then angle = angle + 360; end
    
    // Map phase back to bits
    if angle >= 0 & angle < 90 then
        bits_sym = [0 0];
    elseif angle >= 90 & angle < 180 then
        bits_sym = [0 1];
    elseif angle >= 180 & angle < 270 then
        bits_sym = [1 1];
    else
        bits_sym = [1 0];
    end
    
    detected_bits = [detected_bits bits_sym];
end

disp("Demodulated Bits:");
disp(detected_bits);

