x = -1:0.0002:1;
y = sin(1./x);

y(x==0) = NaN;

figure 
hold on
plot(x,zeros(1,length(x)),'k','linewidth',0.5)
plot([0,0],[-2,5],'k','linewidth',0.5)
plot(x,y,'b','linewidth',1)
axis([-1,1,-1.5,1.5])
grid on
xlabel('$x$','interpreter','latex')
ylabel('$y=f(x)$','interpreter','latex')