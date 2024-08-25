% plotfigure.m
%%

x = 0:0.01:10;
y = (x-1).*(x-6);

fig = figure;
ax = subplot(1,1,1);
hold on
plot(ax, x,y,'k-','linewidth',2)
grid on
xlabel(ax,'$x$','interpreter','latex')
ylabel(ax,'$f(x)$','interpreter','latex')
xline(ax,0,'linewidth',1)
yline(ax,0,'linewidth',1)

%%

x = -10:0.01:10;
y1 = x.^2-2;
y2 = x;

fig = figure;
ax = subplot(1,1,1);
hold on
plot(ax, x, y1,'k-','linewidth',2)
plot(ax, x, y2,'k--','linewidth',1)
grid on
axis([-3,3,-3,5])
xlabel(ax,'$x$','interpreter','latex')
ylabel(ax,'$g(x)$','interpreter','latex')
xline(ax,0,'linewidth',1)
yline(ax,0,'linewidth',1)

%%

x = 0:0.01:10;
y1 = sqrt(x);
y2 = x;

fig = figure;
ax = subplot(1,1,1);
hold on
plot(ax, x, y1,'k-','linewidth',2)
plot(ax, x, y2,'k--','linewidth',1)
grid on
axis([0,1.2,0,1.2])
xlabel(ax,'$x$','interpreter','latex')
ylabel(ax,'$g(x)$','interpreter','latex')
xline(ax,0,'linewidth',1)
yline(ax,0,'linewidth',1)

N = 10;

p_series = zeros(2,N);
p_helper = zeros(2,N);
p_series(:,1) = [0.2;sqrt(0.2)];
p_helper(:,1) = [NaN;NaN];
for ind = 2:N
    p_helper(:,ind) = [p_series(2,ind-1);p_series(2,ind-1)];
    p_series(:,ind) = [p_helper(1,ind);sqrt(p_helper(1,ind))];
end
p_plot = zeros(2,2*N);
for ind = 1:N
    p_plot(:,2*ind-1) = p_helper(:,ind);
    p_plot(:,2*ind) = p_series(:,ind);
end

plot(ax, p_plot(1,:), p_plot(2,:), 'r-')
for ind = 1:4
    text(ax, p_series(1,ind)-0.15, p_series(2, ind)+0.05, sprintf('$p_{%d}=%.2f$', ind, p_series(1, ind)), 'interpreter', 'latex')
end

%%

x = 0:0.01:3;
y = x.^2-2;

N = 6;
newton_series = zeros(1,N);
newton_series(1) = 2.5;

for ind = 2:N
    newton_series(ind) = newton_series(ind-1)-(newton_series(ind-1)^2-2)/(2*newton_series(ind-1));
end

fig = figure;
ax = subplot(1,1,1);
hold on
plot(ax, x, y,'k-','linewidth',2)
grid on
xlabel(ax,'$x$','interpreter','latex')
ylabel(ax,'$f(x)$','interpreter','latex')
xline(ax,0,'linewidth',1)
yline(ax,0,'linewidth',1)

newton_series_plot = zeros(2,8);
for ind = 1:5
    newton_series_plot(:,2*ind-1) = [newton_series(ind);newton_series(ind)^2-2];
    newton_series_plot(:,2*ind) = [newton_series(ind+1);0];
end

plot(ax, newton_series_plot(1,:), newton_series_plot(2,:),'r-')
for ind = 1:3
    text(ax, newton_series(ind)-0.15, newton_series(ind)^2-2+0.05, sprintf('$p_{%d}=%.2f$', ind, newton_series(ind)), 'interpreter', 'latex')
end













