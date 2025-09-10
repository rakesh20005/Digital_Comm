t = -6:0.01:6;                    
u = double(t >= 0);          

plot(t, u, 'r','LineWidth',4);
xgrid(4, 1, 7);                   
xlabel("t", "fontsize", 4);
ylabel("u(t)", "fontsize", 4);
title("Unit step", "fontsize", 4);
