% motivatingexp2.m
%%
close all

x = linspace(0,2*pi,100);
y = linspace(0,2*pi,100);
[X,Y] = meshgrid(x,y);
Z = Y.*cos(X+Y)+2*pi;

x_intersect = [2,2];
y_intersect = [0,2*pi];
[X_intersect,Y_intersect] = meshgrid(x_intersect,y_intersect);
Z_intersect = [0,4*pi;0,4*pi];

xb = 2*ones(size(x));
yb = y;
zb = yb.*cos(xb+yb)+2*pi;

figure
hold on
s = surf(X,Y,Z);
s.EdgeColor = 'none';
s.FaceColor = [0,0,0.8];
s.FaceAlpha = 0.2;
s_intersect = surf(X_intersect,Y_intersect,Z_intersect);
s_intersect.EdgeColor = 'none';
s_intersect.FaceColor = [0.8,0,0];
s_intersect.FaceAlpha = 0.2;
plot3(xb,yb,zb,'r-','linewidth',2)
plot3([2,2,2,2],[0,0,2*pi,2*pi],[0*cos(2+0)+2*pi,0,0,2*pi*cos(2+2*pi)+2*pi],'r-','linewidth',2)
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')

figure
hold on
s = surf(X,Y,Z);
s.EdgeColor = 'none';
s.FaceColor = [0,0,0.8];
s.FaceAlpha = 0.2;

x_cube = linspace(0,2*pi,20);
y_cube = linspace(0,2*pi,20);
for iter_x = 1:length(x_cube)-1
    for iter_y = 1:length(y_cube)-1
        x_cube_single = [x_cube(iter_x),x_cube(iter_x+1)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y+1)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        x_cube_central = mean(x_cube_single);
        y_cube_central = mean(y_cube_single);
        cube_height = y_cube_central*cos(x_cube_central+y_cube_central)+2*pi;
        Z_cube_single = cube_height*ones(2,2);
        s_cube0 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube0.FaceColor = [0.8,0.2,0.2];
        s_cube0.FaceAlpha = 0.5;
        
        x_cube_single = [x_cube(iter_x),x_cube(iter_x)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y+1)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        Z_cube_single = [cube_height,0;cube_height,0];
        s_cube1 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube1.FaceColor = [0.8,0.2,0.2];
        s_cube1.FaceAlpha = 0.5;
        
        x_cube_single = [x_cube(iter_x),x_cube(iter_x+1)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        Z_cube_single = [cube_height,cube_height;0,0];
        s_cube2 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube2.FaceColor = [0.8,0.2,0.2];
        s_cube2.FaceAlpha = 0.5;
    end
end
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')

%%

figure
hold on
s = surf(X,Y,Z);
s.EdgeColor = 'none';
s.FaceColor = [0,0,0.8];
s.FaceAlpha = 0.2;

x_cube = linspace(0,2*pi,20);
y_cube = linspace(0,2*pi,20);
for iter_x = 6
    for iter_y = 1:length(y_cube)-1
        x_cube_single = [x_cube(iter_x),x_cube(iter_x+1)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y+1)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        x_cube_central = mean(x_cube_single);
        y_cube_central = mean(y_cube_single);
        cube_height = y_cube_central*cos(x_cube_central+y_cube_central)+2*pi;
        Z_cube_single = cube_height*ones(2,2);
        s_cube0 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube0.FaceColor = [0.8,0.2,0.2];
        s_cube0.FaceAlpha = 0.5;
        
        x_cube_single = [x_cube(iter_x),x_cube(iter_x)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y+1)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        Z_cube_single = [cube_height,0;cube_height,0];
        s_cube1 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube1.FaceColor = [0.8,0.2,0.2];
        s_cube1.FaceAlpha = 0.5;
        
        x_cube_single = [x_cube(iter_x),x_cube(iter_x+1)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        Z_cube_single = [cube_height,cube_height;0,0];
        s_cube2 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube2.FaceColor = [0.8,0.2,0.2];
        s_cube2.FaceAlpha = 0.5;
    end
end
for iter_x = 1:length(x_cube)-1
    for iter_y = 6
        x_cube_single = [x_cube(iter_x),x_cube(iter_x+1)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y+1)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        x_cube_central = mean(x_cube_single);
        y_cube_central = mean(y_cube_single);
        cube_height = y_cube_central*cos(x_cube_central+y_cube_central)+2*pi;
        Z_cube_single = cube_height*ones(2,2);
        s_cube0 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube0.FaceColor = [0.2,0.8,0.2];
        s_cube0.FaceAlpha = 0.5;
        
        x_cube_single = [x_cube(iter_x),x_cube(iter_x)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y+1)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        Z_cube_single = [cube_height,0;cube_height,0];
        s_cube1 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube1.FaceColor = [0.2,0.8,0.2];
        s_cube1.FaceAlpha = 0.5;
        
        x_cube_single = [x_cube(iter_x),x_cube(iter_x+1)];
        y_cube_single = [y_cube(iter_y),y_cube(iter_y)];
        [X_cube_single,Y_cube_single] = meshgrid(x_cube_single,y_cube_single);
        Z_cube_single = [cube_height,cube_height;0,0];
        s_cube2 = surf(X_cube_single,Y_cube_single,Z_cube_single);
        s_cube2.FaceColor = [0.2,0.8,0.2];
        s_cube2.FaceAlpha = 0.5;
    end
end
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')




