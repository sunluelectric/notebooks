x = 0:0.01:10;

trimf_a = @(x) 0.9*trimf(x, [1, 2, 3]);
trimf_b = @(x) trimf(x, [2, 5, 6]);

a = trimf_a(x);
b = trimf_b(x);

c = conv(a, b, 'full');
c = c(1:length(x));
c = c/max(c);

figure
hold on
plot(x, a, 'r-', 'linewidth', 2)
plot(x, b, 'b-', 'linewidth', 2)
plot(x, c, 'm-', 'linewidth', 2)
grid on
xlabel('$x$', 'Interpreter', 'latex')
ylabel('Membership Function', 'Interpreter', 'latex')
leg1 = legend('$\mu_{A}$', '$\mu_{B}$', '$\mu_{C}$');
set(leg1, 'interpreter', 'latex')