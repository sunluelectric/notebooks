x = -1:0.01:3;
y = (abs(x)-1).^2;

figure 
hold on
plot(x,zeros(1,length(x)),'k','linewidth',0.5)
plot([0,0],[-2,5],'k','linewidth',0.5)
plot(x,y,'b','linewidth',1)
axis([-1,3,-1,4])
grid on
xlabel('$x$','interpreter','latex')
ylabel('$y=f(x)$','interpreter','latex')

figure 
hold on
plot(x,zeros(1,length(x)),'k','linewidth',0.5)
plot([0,0],[-2,5],'k','linewidth',0.5)
plot(x,y,'b','linewidth',1)
plot([2,2.5],[1,1.5^2],'r-', 'linewidth',1,'markersize',15)
plot([2,2.5],[1,1.5^2],'r.', 'linewidth',1,'markersize',15)
plot([2,2.9],[1,1.9^2],'r--.', 'linewidth',1,'markersize',15)
plot([2,1.5],[1,(0.5)^2],'r.-.', 'linewidth',1,'markersize',15)
plot([0,3],[-3,3],'b--', 'linewidth',1,'markersize',15)
axis([1.4,3,0,4])
set(gca,'xtick',1.4:0.2:3);
set(gca,'ytick',0:0.5:4);
grid on
xlabel('$x$','interpreter','latex')
ylabel('$y=f(x)$','interpreter','latex')