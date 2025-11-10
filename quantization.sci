fs = 10000;
t = 0:1/fs:0.1;
f_signal = 50;
Am = 5;
x = Am * sin(2 * %pi * f_signal * t);

// Number of bits
N = 4; // you can change this

// Number of quantization levels
no_levels = 2^N; // L = 16 (Even number)

// Signal range
Amin = min(x);
Amax = max(x);

// Step size
stepSize = (Amax - Amin) / no_levels;

// Choose quantization type: 'mid-rise' or 'mid-tread'
quant_type = "mid-rise"; // change to "mid-tread" if needed

if quant_type == "mid-tread" then
    // Mid-tread quantization: Origin (zero) is a level (tread).
    // Uses the round function for implementation.
    x_quantized = round((x - Amin) / stepSize) * stepSize + Amin;
elseif quant_type == "mid-rise" then
    // Mid-rise quantization: Origin (zero) is in the middle of a step (rise).
    // Uses floor(v + 0.5) for implementation.
    x_quantized = floor((x - Amin) / stepSize + 0.5) * stepSize + Amin;
else
    error("Unknown quantization type");
end

clf();

subplot(2,1,1);
plot(t, x);
title("Original Signal");
xlabel("Time (s)");
ylabel("Amplitude");
xgrid();

subplot(2,1,2);
plot(t, x_quantized, "r");
title("Quantized Signal - " + quant_type + ", N = " + string(N) + " bits (Corrected Logic)");
xlabel("Time (s)");
ylabel("Amplitude");
xgrid();
