t=0:0.01:4;
f=1;
A=4;
phi=1/4*%pi;
y=2+A*sin(3*%pi*f*t + phi);
figure(0);
plot(t,y,"r");
xlabel('time-->')
ylabel('y-->')
xgrid;



