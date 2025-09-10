t=0:0.1:5;
f=1;
phi = 0;
A=1;
y=A*sin(2*%pi*f*t+phi);
plot(t,y,"r");
xlabel('time');
ylabel('amplitude');
xgrid
