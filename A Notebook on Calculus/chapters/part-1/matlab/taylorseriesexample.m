x = -5:0.01:5;
x0 = 0;
kmax = 10;
y = zeros(kmax,length(x)); % y=2^x;

for i = 1:kmax
    if i==1
        y(1,:) = 2^x0 + log(2)*(2^x0)*(x-x0);
    else
        y(i,:) = y(i-1,:) + ((log(2)^i)*(2^x0)/factorial(i))*(x-x0).^i;
    end
end

figure
hold on
plot([-5, 5], [0, 0], 'k-', 'linewidth', 1)
plot([0, 0], [-5, 35], 'k-', 'linewidth', 1)
plot(x, 2.^x, 'r-', 'linewidth', 2)
plot(x, y(1,:), 'b-', 'linewidth', 2)
plot(x, y(5,:), 'b--', 'linewidth', 2)
plot(x, y(10,:), 'b:', 'linewidth', 2)
grid on
axis([-5, 5, -5, 35])
xlabel('$x$', 'interpreter', 'latex')
ylabel('$y=2^x$ and its approximations', 'interpreter', 'latex')