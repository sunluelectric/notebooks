%% opt_equalityconstraint
x1_grid = -3:0.1:3;
x2_grid = -2:0.1:2;
[X1,X2] = meshgrid(x1_grid,x2_grid);
Y = 2*sin(0.5*X1) + sin(0.1*X1+pi) + sin(X2);
Y = Y + 3;

x = -3:0.1:3;
y = exp(-x-1.5)-1;

figure
hold on
contour(X1,X2,Y,0:0.5:10,'showtext','on')
plot(x, y, 'r-', 'linewidth', 2)
xlabel('$u_1$', 'interpreter', 'latex')
ylabel('$u_2$', 'interpreter', 'latex')
axis([-3, 3, -2, 2])
grid on