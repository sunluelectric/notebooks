% fuzzyset_exp.m
x = 0:0.1:100;
y1 = 1.2*sin(2*pi*1/50*(x-10));
y1 = min(max(y1, 0), 1);
y1(x>=40) = 0;

y2 = 1.5*sin(2*pi*1/80*(x-25));
y2 = min(max(y2, 0), 1);
y2(x<=14) = 0;
y2(x>=80) = 0;

figure
hold on
plot(x, y1, 'r-', 'linewidth', 2)
plot(x, y2, 'b-', 'linewidth', 2)
set(gca,'xtick',0:10:120)
legend("Young adult", "Middle-aged adult")
xlabel("Age")
ylabel("Membership function")
grid on