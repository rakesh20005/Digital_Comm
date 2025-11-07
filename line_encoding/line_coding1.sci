clc;
clear;
close;

bits = [1,0,1,1,1];
A = 1;
n = 100;
Tb = 1;
t = 0:(Tb/n):Tb*length(bits)-(Tb/n);
UNRZ = [];
URZ = [];
PNRZ = [];
PRZ = [];

for i = 1:length(bits)
    if bits(i) == 1 then
        UNRZ = [UNRZ A*ones(1,n)];
        URZ = [URZ A*ones(1,n/2) zeros(1,n/2)];
        PNRZ = [PNRZ A*ones(1,n)];
        PRZ = [PRZ A*ones(1,n/2) zeros(1,n/2)];
    else
        UNRZ = [UNRZ zeros(1,n)];
        URZ = [URZ zeros(1,n)];
        PNRZ = [PNRZ -A*ones(1,n)];
        PRZ = [PRZ -A*ones(1,n/2) zeros(1,n/2)];
    end
end

f = scf(0);
clf(f);

subplot(5,1,1);
tt = 0:Tb:(length(bits)-1)*Tb;
plot2d2(tt, bits);
xtitle('Input Bit Sequence','','Amplitude');
xgrid();

subplot(5,1,2);
plot(t, UNRZ, 'LineWidth', 2);
xtitle('Unipolar NRZ','','Amplitude');
xgrid();

subplot(5,1,3);
plot(t, URZ, 'LineWidth', 2);
xtitle('Unipolar RZ','','Amplitude');
xgrid();

subplot(5,1,4);
plot(t, PNRZ, 'LineWidth', 2);
xtitle('Polar NRZ','','Amplitude');
xgrid();

subplot(5,1,5);
plot(t, PRZ, 'LineWidth', 2);
xtitle('Polar RZ','','Amplitude');
xgrid();

show_window();
