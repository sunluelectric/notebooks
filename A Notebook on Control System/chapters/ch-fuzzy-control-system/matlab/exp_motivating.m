% motivatingexp.m
x1 = 0:0.1:1;
x2 = 0:0.1:1;
[X1, X2] = meshgrid(x1, x2);
u1 = (exp(X1)-1)/(exp(1)-1);
u2 = X2;
u = 0.8*u1 + 0.2*u2;
tips = (0.25-0.05)*u + 0.05;
figure
surf(X1, X2, tips, 'edgecolor','black', 'facealpha', 1)
xlabel('Service Quality')
ylabel('Food Quality')
zlabel('Tips')
figure
gensurf(readfis('tipper'))
xlabel('Service Quality')
ylabel('Food Quality')
zlabel('Tips')