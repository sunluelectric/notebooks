x1_grid = -2:0.1:2;
x2_grid = -2:0.1:2;
[X1,X2] = meshgrid(x1_grid,x2_grid);
Y = (X1 + 2*X2).^2 + (X1 - X2).^2;

surf(X1,X2,Y)
hold on
shading interp
alpha 0.5
coor = [-2,1,0;2,1,0;2,1,40;-2,1,40];
fill3(coor(:,1),coor(:,2),coor(:,3), 'k', 'FaceAlpha', 0.1)
p = (x1_grid+2).^2 + (x1_grid-1).^2;
plot3(x1_grid, ones(1,length(x1_grid)), p, 'r-', 'linewidth', 2)
coor = [1,-2,0;1,2,0;1,2,40;1,-2,40];
fill3(coor(:,1),coor(:,2),coor(:,3), 'k', 'FaceAlpha', 0.1)
p = (2*x2_grid+1).^2 + (-x2_grid+1).^2;
plot3(ones(1, length(x2_grid)), x2_grid, p, 'b-', 'linewidth', 2)

xlabel('$x_1$', 'interpreter', 'latex')
ylabel('$x_2$', 'interpreter', 'latex')
zlabel('$y = f(x_1,x_2)$', 'interpreter', 'latex')