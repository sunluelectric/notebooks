x = 0:0.01:2*pi;
y = sin(x) + 0.5;

redindex = find(y>0);
blueindex = find(y<0);

figure
hold on
plot(x, y, 'k-', 'linewidth', 2)
plot([0,2*pi], [0,0], 'k-', 'linewidth', 1)
% plot([0,0], [-1,4], 'k-', 'linewidth', 1)
% plot([1,1], [-1,4], 'k-', 'linewidth', 1)
plot([0,0,x(redindex),2*pi,0], [0,0.5,y(redindex),0,0], 'r--', 'linewidth', 2)
xblueindex = x(blueindex);
plot([x(blueindex),xblueindex(1)], [y(blueindex),0], 'b--', 'linewidth', 2)
% plot([0:0.01:1], [0:0.01:1].^2, 'r-', 'linewidth', 2)
% plot(stairsplot(1,:), stairsplot(2,:), 'b--', 'linewidth', 2)
% plot(stairsplot2(1,:), stairsplot2(2,:), 'g--', 'linewidth', 0.5)
grid on
% set(gca, 'xtick', [-0.6:0.2:1.6])
% set(gca, 'ytick', [-0.6:0.2:1.6])
axis([0, 2*pi, -1, 2])
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y = \textup{sin}(x)+0.5$', 'interpreter', 'latex')