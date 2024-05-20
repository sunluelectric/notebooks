x = -1:0.01:2;
y = x.^2;

N = 3;

x_segment = linspace(0, 1, N+1);
y_segment = x_segment.^2;
% [x_stairs, y_stairs] = stairs(x_segment, y_segment);
stairsplot = zeros(2,4*N);
for temp = 1:N
    x1 = (temp - 1)*(1/N);
    x2 = x1;
    x3 = temp*(1/N);
    x4 = x3;
    y1 = 0;
    y2 = x1^2;
    y3 = x3^2;
    y4 = 0;
    stairsplot(:,(temp-1)*4+1:temp*4) = [x1, x2, x3, x4; y1, y2, y3, y4];
end

stairsplot2 = zeros(2,4*N);
for temp = 1:N
    x1 = (temp - 1)*(1/N);
    x2 = x1;
    x3 = temp*(1/N);
    x4 = x3;
    y1 = 0;
    y2 = x3^2;
    y3 = y2;
    y4 = 0;
    stairsplot2(:,(temp-1)*4+1:temp*4) = [x1, x2, x3, x4; y1, y2, y3, y4];
end

figure
hold on
plot(x, y, 'k-', 'linewidth', 2)
plot([-1,2], [0,0], 'k-', 'linewidth', 1)
plot([0,0], [-1,4], 'k-', 'linewidth', 1)
plot([1,1], [-1,4], 'k-', 'linewidth', 1)
plot([0, 1, 1], [0, 0, 1], 'r-', 'linewidth', 2)
plot([0:0.01:1], [0:0.01:1].^2, 'r-', 'linewidth', 2)
plot(stairsplot(1,:), stairsplot(2,:), 'b--', 'linewidth', 2)
% plot(stairsplot2(1,:), stairsplot2(2,:), 'g--', 'linewidth', 0.5)
grid on
set(gca, 'xtick', [-0.6:0.2:1.6])
set(gca, 'ytick', [-0.6:0.2:1.6])
axis([-0.6, 1.6, -0.6, 1.6])
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y = x^2$', 'interpreter', 'latex')

