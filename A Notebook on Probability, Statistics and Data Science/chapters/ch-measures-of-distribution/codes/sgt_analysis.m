% sgt_analysis.m
% pdf maps to https://en.wikipedia.org/wiki/Skewed_generalized_t_distribution
%% input
input_p = [3,2,2];
input_q = [1e6, 1e6, 2.5];
input_sigma = [sqrt(2), sqrt(2), sqrt(2)];
input_mu = [0, 0, 0];
input_lambda = [0, 0, 0];
%% analysis
num_of_sgt = length(input_p);
output_moment_1 = zeros(num_of_sgt,1);
output_moment_2 = zeros(num_of_sgt,1);

for temp = 1:num_of_sgt
    p = input_p(temp);
    q = input_q(temp);
    mu = input_mu(temp);
    lambda = input_lambda(temp);
    sigma = input_sigma(temp);
    if p*q>2
        nu = q^(-1/p)/sqrt((3*lambda^2+1)*beta(3/p,q-2/p)/beta(1/p,q)-4*lambda^2*beta(2/p,q-1/p)^2/beta(1/p,q)^2);
        s = sigma/nu;
        m = 2*nu*s*lambda*q^(1/p)*beta(2/p,q-1/p)/beta(1/p,q);
        output_moment_1(temp) = mu;
        output_moment_2(temp) = s^2;
    elseif p*q>1
        output_moment_1(temp) = mu;
        output_moment_2(temp) = NaN;
    else
        output_moment_1(temp) = NaN;
        output_moment_2(temp) = NaN;
    end
end
%% visualization
deltax = 0.01;
x = -5:deltax:5;
y = zeros(num_of_sgt,length(x));
for temp = 1:num_of_sgt
    y(temp,:) = sgt_pdf(x, input_p(temp), input_q(temp), input_mu(temp), input_lambda(temp), input_sigma(temp));
end

figure
hold on
plot(x,y(1,:),'b-')
plot(x,y(2,:),'k-')

plot(x,y(3,:),'r-')

% title('Geteralized $t$-distribution PDF with different choice of $p$, $q$.', 'interpreter', 'latex')
grid on
% axis([-10,10,0,0.45])
xlabel('$x$', 'interpreter', 'latex')
ylabel('$f(x)$', 'interpreter', 'latex')
leg = legend('$\textup{Ex. Kurtosis} < 0$', ...
    '$\textup{Ex. Kurtosis} = 0$', ...
    '$\textup{Ex. Kurtosis} > 0$');
set(leg, 'interpreter', 'latex')

