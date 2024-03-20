x = -10:1:10;
xl = -10:0.01:10;
figure

y = 15*exp(-abs(0.5*x)).*sin(x);
yl = 15*exp(-abs(0.5*xl)).*sin(xl);
ax = subplot(3,1,1);
hold on
plot(ax,xl,yl,'b-')
plot(ax,x,y,'bo')
grid on
xlabel('$n$','interpreter','latex')
ylabel('$x(n)$, $E<\infty$, $P=0$', 'interpreter','latex')
axis([-10,10,-20,20])

y = 10*exp(-abs(0)).*sin(x);
yl = 10*exp(-abs(0)).*sin(xl);
ax = subplot(3,1,2);
hold on
plot(ax,xl,yl,'b-')
plot(ax,x,y,'bo')
grid on
xlabel('$n$','interpreter','latex')
ylabel('$x(n)$, $E\rightarrow\infty$, $P<\infty$', 'interpreter','latex')
axis([-10,10,-20,20])

y = abs(2*x).*sin(2*x);
yl = abs(2*xl).*sin(2*xl);
ax = subplot(3,1,3);
hold on
plot(ax,xl,yl,'b-')
plot(ax,x,y,'bo')
grid on
xlabel('$n$','interpreter','latex')
ylabel('$x(n)$, $E\rightarrow\infty$, $P\rightarrow\infty$', 'interpreter','latex')
axis([-10,10,-20,20])

%%
x = -2:0.1:2;
n = (1:length(x)) - find(x==0);
dx = -2:0.2:2;
dn = n(1):2:n(end);
yn = sin(x);
ydn = sin(dx);
figure
ax = subplot(2,1,1);
hold on
plot(ax, n, yn, 'rx')
plot(ax, dn, ydn, 'bo');
grid on
xlabel('$n$', 'interpreter','latex')
ylabel('$x(n)$', 'interpreter','latex')
ax = subplot(2,1,2);
hold on
plot(ax, (1:length(dx))-find(dx==0),ydn, 'bo')
grid on
axis([-20,20,-1,1])
xlabel('$n$', 'interpreter','latex')
ylabel('$x(\mu n)$', 'interpreter','latex')


