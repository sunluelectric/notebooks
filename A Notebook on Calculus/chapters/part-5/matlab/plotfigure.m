% plotfigure.m

x = 0:0.01:10;
y = (x-1).*(x-6);

fig = figure;
ax = subplot(1,1,1);
hold on
plot(x,y,'k-','linewidth',2)
grid on
xlabel(ax,'$x$','interpreter','latex')
ylabel(ax,'$f(x)$','interpreter','latex')
xline(ax,0,'linewidth',1)
yline(ax,0,'linewidth',1)