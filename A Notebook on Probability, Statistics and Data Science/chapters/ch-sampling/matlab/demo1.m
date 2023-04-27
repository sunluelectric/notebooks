% sampling with replacement VS without replacement
N = 10000;
M = 500;
p = normrnd(0, 1, [1, N]);
mean_p = mean(p);
var_p = var(p);
fprintf("Mean of population: %f.\n", mean_p);
fprintf("Variance of population: %f.\n", var_p);

% sampling with replacement
M1 = M;
r1 = randi(N, [1, M]);
p1 = p(r1);
mean1 = cummean(p1);
var1 = cumvar(p1);

% sampling withour replacement
M2 = min(N, M);
r2 = randperm(N, M2);
p2 = p(r2);
mean2 = cummean(p2);
var2 = cumvar(p2);

% plot
figure
hold on
plot(1:M1, mean_p*ones(1, M1), 'r--')
plot(1:M1, var_p*ones(1, M1), 'b--')
plot(1:M1, mean1, 'r-')
plot(1:M1, var1, 'b-')
grid on
axis([1, M1, -0.5, 3])
xlabel('Number of Samples', 'Interpreter','latex')
ylabel('Mean and Variance', 'Interpreter','latex')
l = legend('Mean of pupulation', 'Variance of population', 'Mean of samples', 'Variance of samples');
set(l, 'interpreter', 'latex')
hold off

figure
hold on
plot(1:M2, mean_p*ones(1, M2), 'r--')
plot(1:M2, var_p*ones(1, M2), 'b--')
if M1 > M2
    plot(1:M1, [mean2, mean2(M2)*ones(1, M1-M2)], 'r-')
    plot(1:M1, [var2, var2(M2)*ones(1, M1-M2)], 'b-')
else
    plot(1:M2, mean2, 'r-')
    plot(1:M2, var2, 'b-')
end
grid on
axis([1, M1, -0.5, 3])
xlabel('Number of Samples', 'Interpreter','latex')
ylabel('Mean and Variance', 'Interpreter','latex')
l = legend('Mean of pupulation', 'Variance of population', 'Mean of samples', 'Variance of samples');
set(l, 'interpreter', 'latex')
hold off

function y = cummean(X)
    n = length(X);
    y = zeros(1, n);
    for temp = 1:n
        y(temp) = mean(X(1:temp));
    end
end

function y = cumvar(X)
    n = length(X);
    y = zeros(1, n);
    for temp = 1:n
        y(temp) = var(X(1:temp));
    end
end