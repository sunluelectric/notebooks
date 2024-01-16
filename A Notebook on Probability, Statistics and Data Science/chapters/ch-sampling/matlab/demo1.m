% sampling with replacement VS without replacement
numMonteCarlo = 1000;
numPopulation = 1000;
numSample = 100;

meanPopulation = zeros(1,numMonteCarlo);
meanWithReplacement = zeros(numSample,numMonteCarlo);
meanWithoutReplacment = zeros(numSample,numMonteCarlo);

effectiveSampleWithReplacement = numSample;
effectiveSampleWithoutReplacement = min(numPopulation, numSample);
for ind = 1:numMonteCarlo
    population = normrnd(0, 1, [1, numPopulation]);
    meanPopulation(ind) = mean(population);
    
    % sampling with replacement

    r1 = randi(numPopulation, [1, numSample]);
    p1 = population(r1);
    meanWithReplacement(:,ind) = cummean(p1);
    
    % sampling withour replacement
    r2 = randperm(numPopulation, effectiveSampleWithoutReplacement);
    p2 = population(r2);
    meanWithoutReplacment(:,ind) = cummean(p2);
end

% plot
figure
subplot(1,2,1)
hold on
for ind = 1:numMonteCarlo
    plot(1:effectiveSampleWithReplacement, meanWithReplacement(:,ind), 'r-')
    plot(1:effectiveSampleWithReplacement, meanPopulation(ind)*ones(1, effectiveSampleWithReplacement), 'r--')
end
plot(1:effectiveSampleWithReplacement, meanPopulation*ones(1, effectiveSampleWithReplacement), 'r--')
plot(1:effectiveSampleWithReplacement, meanWithReplacement, 'r-')
grid on
axis([1, effectiveSampleWithReplacement, -0.5, 3])
xlabel('Number of Samples', 'Interpreter','latex')
ylabel('Mean', 'Interpreter','latex')
l = legend('Mean of pupulation', 'Mean of samples');
set(l, 'interpreter', 'latex')
hold off

subplot(1,2,2)
hold on
plot(1:effectiveSampleWithoutReplacement, meanPopulation*ones(1, effectiveSampleWithoutReplacement), 'r--')
plot(1:effectiveSampleWithoutReplacement, var_p*ones(1, effectiveSampleWithoutReplacement), 'b--')
if effectiveSampleWithReplacement > effectiveSampleWithoutReplacement
    plot(1:effectiveSampleWithReplacement, [meanWithoutReplacment, meanWithoutReplacment(effectiveSampleWithoutReplacement)*ones(1, effectiveSampleWithReplacement-effectiveSampleWithoutReplacement)], 'r-')
else
    plot(1:effectiveSampleWithoutReplacement, meanWithoutReplacment, 'r-')
end
grid on
axis([1, effectiveSampleWithReplacement, -0.5, 3])
xlabel('Number of Samples', 'Interpreter','latex')
ylabel('Mean and Variance', 'Interpreter','latex')
l = legend('Mean of pupulation', 'Mean of samples');
set(l, 'interpreter', 'latex')
hold off

function y = cummean(X)
    n = length(X);
    y = zeros(1, n);
    for temp = 1:n
        y(temp) = mean(X(1:temp));
    end
end