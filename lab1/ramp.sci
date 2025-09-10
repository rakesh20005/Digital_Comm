t=-6:1:6;
r=t.*(t>=0);
plot(t,r,'r','LineWidth',4);
xgrid(4, 1, 7);                   
xlabel("t", "fontsize", 4);
ylabel("u(t)", "fontsize", 4);
title("Unit step", "fontsize", 4);

