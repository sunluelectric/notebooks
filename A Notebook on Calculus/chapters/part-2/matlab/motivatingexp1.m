% motivatingexp1.m
%% Plot cone v1
cone_circle_theta = linspace(0, 2*pi, 100);
cone_circle_x = 2*ones(length(cone_circle_theta), 1);
cone_circle_y = cos(cone_circle_theta);
cone_circle_z = sin(cone_circle_theta);

cone_bus_theta = linspace(0, 2*pi, 15);
cone_bus_x = 0:0.01:2;
cone_bus_y = (0.5*cone_bus_x'*cos(cone_bus_theta))';
cone_bus_z = (0.5*cone_bus_x'*sin(cone_bus_theta))';

cone_bus_1_x = 0:0.01:2;
cone_bus_1_z = 0.5*cone_bus_1_x;
cone_bus_1_y = zeros(length(cone_bus_1_x), 1);
cone_bus_2_x = 0:0.01:2;
cone_bus_2_z = -0.5*cone_bus_1_x;
cone_bus_2_y = zeros(length(cone_bus_1_x), 1);

figure
hold on
plot3(cone_circle_x, cone_circle_y, cone_circle_z, 'k-');
plot3(cone_bus_1_x,cone_bus_1_y,cone_bus_1_z, 'k-');
plot3(cone_bus_2_x,cone_bus_2_y,cone_bus_2_z, 'k-');
for temp = 1:length(cone_bus_theta)
   plot3(cone_bus_x, cone_bus_y(temp,:), cone_bus_z(temp,:), 'k--');
end
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')

%% plot cone v2
cone_x = 0:0.01:2;
cone_y = -1:0.01:1;
[cone_X, cone_Y] = meshgrid(cone_x, cone_y);
cone_Z1 = zeros(size(cone_X));
cone_Z2 = zeros(size(cone_X));

for iter_x = 1:length(cone_x)
    for iter_y = 1:length(cone_y)
        if abs(cone_y(iter_y)) > 0.5*cone_x(iter_x)
            cone_Z1(iter_y, iter_x) = NaN;
            cone_Z2(iter_y, iter_x) = NaN;
        else
            cone_Z1(iter_y, iter_x) = sqrt((0.5*cone_x(iter_x))^2 - cone_y(iter_y)^2);
            cone_Z2(iter_y, iter_x) = -sqrt((0.5*cone_x(iter_x))^2 - cone_y(iter_y)^2);
        end
    end
end

figure
hold on
surf(cone_X, cone_Y, cone_Z1, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
surf(cone_X, cone_Y, cone_Z2, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
grid on

%% plot cone v3
cone_height = 3;
cone_radius = 1;
cone_x = -cone_radius:0.005:cone_radius;
cone_y = -cone_radius:0.005:cone_radius;
[cone_X, cone_Y] = meshgrid(cone_x, cone_y);
cone_Z = cone_height*(1-sqrt(cone_X.^2 + cone_Y.^2)/cone_radius);
cone_Z(cone_Z<0) = NaN;

circle_theta = linspace(0,2*pi,100);
circle_x = cos(circle_theta);
circle_y = sin(circle_theta);

intersect_x = -cone_radius:0.005:cone_radius;
intersect_y = -cone_radius:0.005:cone_radius;
[intersect_X, intersect_Y] = meshgrid(intersect_x, intersect_y);
intersect_Z = ones(size(intersect_X));
intersect_circle_theta = linspace(0,2*pi,100);
intersect_circle_z = 1;
intersect_circle_x = cone_radius*(cone_height-intersect_circle_z)/cone_height*cos(intersect_circle_theta);
intersect_circle_y = cone_radius*(cone_height-intersect_circle_z)/cone_height*sin(intersect_circle_theta);

figure
hold on
s1 = surf(cone_X, cone_Y, cone_Z);
s1.FaceColor = [0,0,0.8];
s1.EdgeColor = 'none';
s1.FaceAlpha = 0.2;
s2 = surf(intersect_X, intersect_Y, intersect_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.2);
s2.FaceColor = [0.8,0,0];
plot3(circle_x, circle_y, zeros(size(circle_theta)), 'k-', 'linewidth', 2)
plot3(intersect_circle_x, intersect_circle_y, intersect_circle_z*ones(size(intersect_circle_theta)), 'r-', 'linewidth', 2)
plot3([0,0,-1,0], [0,0,0,0], [0,3,0,0], 'k--', 'linewidth', 2)
plot3([0,-cone_radius*(cone_height-intersect_circle_z)/cone_height], [0,0], [intersect_circle_z,intersect_circle_z], 'r--', 'linewidth', 2)
grid on;
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')

%% plot cone v4
cone_height = 3;
cone_radius = 1;
cone_x = -cone_radius:0.005:cone_radius;
cone_y = -cone_radius:0.005:cone_radius;
[cone_X, cone_Y] = meshgrid(cone_x, cone_y);
cone_Z = cone_height*(1-sqrt(cone_X.^2 + cone_Y.^2)/cone_radius);
cone_Z(cone_Z<0) = NaN;

circle_theta = linspace(0,2*pi,100);
circle_x = cos(circle_theta);
circle_y = sin(circle_theta);

intersect_x = -cone_radius:0.005:cone_radius;
intersect_y = -cone_radius:0.005:cone_radius;
[intersect_X, intersect_Y] = meshgrid(intersect_x, intersect_y);
intersect_Z = ones(size(intersect_X));
intersect_circle_theta = linspace(0,2*pi,100);
intersect_circle_z = 1;
intersect_circle_x = cone_radius*(cone_height-intersect_circle_z)/cone_height*cos(intersect_circle_theta);
intersect_circle_y = cone_radius*(cone_height-intersect_circle_z)/cone_height*sin(intersect_circle_theta);

figure
subplot(1,2,1)
hold on
s1 = surf(cone_X, cone_Y, cone_Z);
s1.FaceColor = [0,0,0.8];
s1.EdgeColor = 'none';
s1.FaceAlpha = 0.2;
s2 = surf(intersect_X, intersect_Y, intersect_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.2);
s2.FaceColor = [0.8,0,0];
plot3(circle_x, circle_y, zeros(size(circle_theta)), 'k-', 'linewidth', 2)
plot3(intersect_circle_x, intersect_circle_y, intersect_circle_z*ones(size(intersect_circle_theta)), 'r-', 'linewidth', 2)
plot3([0,0,-1,0], [0,0,0,0], [0,3,0,0], 'k--', 'linewidth', 2)
plot3([0,-cone_radius*(cone_height-intersect_circle_z)/cone_height], [0,0], [intersect_circle_z,intersect_circle_z], 'r--', 'linewidth', 2)
grid on;
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')
title('(a)', 'Units', 'normalized', 'Position', [0.5, -0.1, 0]); % Set Title with correct Position
set(gca, 'CameraPosition', [-1, -1, 3]);

[cylinder_X, cylinder_Y, cylinder_Z] = cylinder(cone_radius*(cone_height-intersect_circle_z)/cone_height, 100);
cylinder_Z = 0.95 + 0.1*cylinder_Z;
cylinder_top_Z = 1.05*ones(size(cone_X));
for iter_x = 1:size(cylinder_top_Z,2)
    for iter_y = 1:size(cylinder_top_Z,1)
        if cone_x(iter_x)^2 + cone_y(iter_y)^2 > 4/9
            cylinder_top_Z(iter_y, iter_x) = NaN;
        end
    end
end

subplot(1,2,2)
hold on
s1 = surf(cone_X, cone_Y, cone_Z, 'EdgeColor', 'none');
s1.FaceColor = [0,0,0.8];
s1.FaceAlpha = 0.2;
s2 = surf(intersect_X, intersect_Y, intersect_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.2);
s2.FaceColor = [0.8,0,0];
s3 = surf(cylinder_X, cylinder_Y, cylinder_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
s4 = surf(cone_X, cone_Y, cylinder_top_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
plot3(circle_x, circle_y, zeros(size(circle_theta)), 'k-', 'linewidth', 2)
plot3(intersect_circle_x, intersect_circle_y, intersect_circle_z*ones(size(intersect_circle_theta)), 'r-', 'linewidth', 2)
plot3([0,-cone_radius*(cone_height-intersect_circle_z)/cone_height], [0,0], [intersect_circle_z,intersect_circle_z], 'r--', 'linewidth', 2)
grid on;
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')
title('(b)', 'Units', 'normalized', 'Position', [0.5, -0.1, 0]); % Set Title with correct Position
set(gca, 'CameraPosition', [-1, -1, 3]);

%% plot cone v5
cone_height = 3;
cone_radius = 1;
cone_x = -cone_radius:0.005:cone_radius;
cone_y = -cone_radius:0.005:cone_radius;
[cone_X, cone_Y] = meshgrid(cone_x, cone_y);
cone_Z = cone_height*(1-sqrt(cone_X.^2 + cone_Y.^2)/cone_radius);
cone_Z(cone_Z<0) = NaN;

circle_theta = linspace(0,2*pi,100);
circle_x = cos(circle_theta);
circle_y = sin(circle_theta);

intersect_x = -cone_radius:0.005:cone_radius;
intersect_y = -cone_radius:0.005:cone_radius;
intersect_circle_z = 1.5;
[intersect_X, intersect_Y] = meshgrid(intersect_x, intersect_y);
intersect_Z = intersect_circle_z*ones(size(intersect_X));
intersect_circle_theta = linspace(0,2*pi,100);

intersect_circle_x = cone_radius*(cone_height-intersect_circle_z)/cone_height*cos(intersect_circle_theta);
intersect_circle_y = cone_radius*(cone_height-intersect_circle_z)/cone_height*sin(intersect_circle_theta);

[cylinder_X, cylinder_Y, cylinder_Z] = cylinder(cone_radius*(cone_height-intersect_circle_z)/cone_height, 100);
cylinder_Z = intersect_circle_z - 0.05 + 0.1*cylinder_Z;
cylinder_top_Z = (intersect_circle_z + 0.05)*ones(size(cone_X));
for iter_x = 1:size(cylinder_top_Z,2)
    for iter_y = 1:size(cylinder_top_Z,1)
        if cone_x(iter_x)^2 + cone_y(iter_y)^2 > (cone_radius*(cone_height-intersect_circle_z)/cone_height)^2
            cylinder_top_Z(iter_y, iter_x) = NaN;
        end
    end
end

figure
hold on
s1 = surf(cone_X, cone_Y, cone_Z, 'EdgeColor', 'none');
s1.FaceColor = [0,0,0.8];
s1.FaceAlpha = 0.2;
s2 = surf(intersect_X, intersect_Y, intersect_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.2);
s2.FaceColor = [0.8,0,0];
s3 = surf(cylinder_X, cylinder_Y, cylinder_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
s4 = surf(cone_X, cone_Y, cylinder_top_Z, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
plot3(circle_x, circle_y, zeros(size(circle_theta)), 'k-', 'linewidth', 2)
plot3(intersect_circle_x, intersect_circle_y, intersect_circle_z*ones(size(intersect_circle_theta)), 'r-', 'linewidth', 2)
plot3([0,0,-1,0], [0,0,0,0], [0,3,0,0], 'k--', 'linewidth', 2)
plot3([0,-cone_radius*(cone_height-intersect_circle_z)/cone_height], [0,0], [intersect_circle_z,intersect_circle_z], 'r--', 'linewidth', 2)
grid on;
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y$', 'interpreter', 'latex')
zlabel('$z$', 'interpreter', 'latex')

