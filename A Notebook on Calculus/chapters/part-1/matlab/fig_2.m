x = -1:0.01:3;
y = (x-1).^2;

y(x==1) = NaN;

figure 
hold on
plot(x,zeros(1,length(x)),'k','linewidth',0.5)
plot([0,0],[-2,5],'k','linewidth',0.5)
plot(x,y,'b','linewidth',1)
plot([1],[1],'b.','markersize',15)
plot([1],[0],'bo','markersize',5)
axis([-1,3,-1,4])
grid on
xlabel('$x$','interpreter','latex')
ylabel('$y=f(x)$','interpreter','latex')