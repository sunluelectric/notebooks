%%
clear
x = 0:20;
y1 = poisspdf(x, 1);
y2 = poisspdf(x, 2);
y3 = poisspdf(x, 5);
y4 = poisspdf(x, 10);
figure
axis
hold on
plot(x, y1, 'r-o')
plot(x, y2, 'g-x')
plot(x, y3, 'b-*')
plot(x, y4, 'c-+')
hold off
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('Poisson Distribution', 'interpreter', 'latex')
legend({'$\lambda=1$', '$\lambda=2$', '$\lambda=5$', '$\lambda=10$'}, 'interpreter', 'latex')
%%
clear
n = [10, 50, 500];
p = 5./n;
x = 0:20;
figure
hold on
for temp = 1:3
    plot(x, binopdf(x,n(temp),p(temp)), '-x')
end
plot(x, poisspdf(x, 5), 'k-+')
hold off
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('Poisson Versus Binomial', 'interpreter', 'latex')
legend({'Binomial $n=10$, $p=0.5$', 'Binomial $n=50$, $p=0.1$', 'Binomial $n=500$, $p=0.01$', 'Poisson $\lambda = 5$'}, 'interpreter', 'latex')
%%
clear
gamma = [0.5, 1, 2];
x = -6:0.01:6;
figure
hold on
for temp = 1:3
    y = 1/pi*(gamma(temp)./(x.^2 + gamma(temp)^2));
    plot(x, y)
end
y = 1/pi*(0.5./((x-2).^2 + 0.5^2));
plot(x, y)
hold off
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('Cauchy Distribution', 'interpreter', 'latex')
legend({'$\gamma=0.5$, $x_0=0$', '$\gamma=1$, $x_0=0$', '$\gamma=2$, $x_0=0$', '$\gamma=0.5$, $x_0=2$'}, 'interpreter', 'latex')
%%
clear
co = colororder;

alpha = [1, 2, 3];
beta = 1;
x = 0:0.01:10;
figure
subplot(1,2,1)
hold on
for temp = 1:3
    y = gampdf(x, alpha(temp), 1/beta);
    plot(x, y, 'Color', co(temp,:))
end
hold off
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('Gamma Distribution', 'interpreter', 'latex')
legend({'$\alpha = 1$, $\beta = 1$', '$\alpha = 2$, $\beta = 1$', '$\alpha = 3$, $\beta = 1$'}, 'interpreter', 'latex')

lo = ["-", "--", ":"];
alpha = 2;
beta = [1, 0.5, 2];
x = 0:0.01:10;
subplot(1,2,2)
hold on
for temp = 1:3
    y = gampdf(x, alpha, 1/beta(temp));
    plot(x, y, 'Color', co(2,:), "LineStyle", lo(temp))
end
hold off
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('Gamma Distribution', 'interpreter', 'latex')
legend({'$\alpha = 2$, $\beta = 1$ ($\theta=1$)', '$\alpha = 2$, $\beta = 0.5$ ($\theta=2$)', '$\alpha = 2$, $\beta = 2$ ($\theta=0.5$)'}, 'interpreter', 'latex')
axis([0,10,0,1])
%%
clear
co = colororder;
r = [1,2,3,5,8];
x = 0:0.01:10;
figure
hold on
for temp = 1:5
    y = chi2pdf(x, r(temp));
    plot(x, y, 'Color', co(temp,:))
end
hold off
grid on
xlabel('$x$', 'interpreter', 'latex')
ylabel('$\chi^2$ Distribution', 'interpreter', 'latex')
legend({'$r = 1$', '$r = 2$', '$r = 3$', '$r = 5$', '$r = 8$'}, 'interpreter', 'latex')
axis([0,10,0,0.6])


%%
% exponential distribution pdf
x = 0:0.01:3;
lambda = [3,2,1,0.5];
mu = 1./lambda;
y = zeros(length(lambda),length(x));
for ind = 1:length(lambda)
    y(ind,:) = exppdf(x,mu(ind));
end

figure
ax = subplot(1,1,1);
plot(ax,x,y)
xlabel('$x$', 'interpreter', 'latex')
ylabel('Exponential Distribution', 'interpreter', 'latex')
legend(ax, {'$\lambda=3$', '$\lambda=2$', '$\lambda=1$', '$\lambda=0.5$'}, 'interpreter', 'latex')
grid on

