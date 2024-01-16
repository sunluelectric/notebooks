% plotfigs.m
x = -5:0.01:5;
y = normpdf(x);
x1 = 2.58:0.01:5;
y1 = normpdf(x1);
x2 = -5:0.01:2.58;
y2 = normpdf(x2);
figure
ax = subplot(1,1,1);
hold on
plot(ax,x,y,'k-', 'linewidth', 2)
patch([x2 fliplr(x2)], [zeros(size(x2)) fliplr(y2)], 'g')
patch([x1 fliplr(x1)], [zeros(size(x1)) fliplr(y1)], 'r')
xline(2.58)
xlabel('$\mu-\mu^*$','interpreter','latex')
ylabel('$\mathcal{N}\left(\mu; \mu^*, {\sigma}^2\right)$','interpreter','latex')
grid on