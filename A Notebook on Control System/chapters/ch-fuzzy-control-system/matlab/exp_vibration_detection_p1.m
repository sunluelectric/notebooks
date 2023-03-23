% vibration_detection.m (part 1)
clear
close all
%%
x_freq = 0:0.01:0.5;
mf_x_freq = [];
mf_x_freq.low = trapmf(x_freq, [-1, 0, 0.05, 0.15]);
mf_x_freq.fine = trapmf(x_freq, [0.05, 0.15, 0.25, 0.35]);
mf_x_freq.high = trapmf(x_freq, [0.25, 0.40, 0.5, 1]);
figure;
hold on
p1 = plot(x_freq, mf_x_freq.low, 'b-', 'LineWidth', 2);
p2 = plot(x_freq, mf_x_freq.fine, 'r-', 'LineWidth', 2);
p3 = plot(x_freq, mf_x_freq.high, 'g-', 'LineWidth', 2);
grid on
lg = legend([p1, p2, p3], 'Low', 'Fine', 'High');
set(lg, 'Interpreter', 'latex');
xlabel('Oscillation Frequency ($Hz$)', 'Interpreter', 'latex');
ylabel('Membershif Function', 'Interpreter', 'latex');

x_amp = 0:0.01:10;
mf_x_amp = [];
mf_x_amp.low = gbellmf(x_amp, [4, 10, -2]);
mf_x_amp.fine = gbellmf(x_amp, [5, 5, 8]);
figure;
hold on
p1 = plot(x_amp, mf_x_amp.low, 'b-', 'LineWidth', 2);
p2 = plot(x_amp, mf_x_amp.fine, 'r-', 'LineWidth', 2);
grid on
lg = legend([p1, p2], 'Low', 'Fine');
set(lg, 'Interpreter', 'latex');
xlabel('Oscillation Amplitude', 'Interpreter', 'latex');
ylabel('Membershif Function', 'Interpreter', 'latex');


%%
x_likelihood = 0:0.01:1;
mf_x_likelihood = [];
mf_x_likelihood.verynotlikely = gbellmf(x_likelihood, [0.2, 5, 0]);
mf_x_likelihood.notlikely = gbellmf(x_likelihood, [0.15, 3, 0.3]);
mf_x_likelihood.likely = gbellmf(x_likelihood, [0.15, 3, 0.6]);
mf_x_likelihood.verylikely = gbellmf(x_likelihood, [0.3, 5, 1]);
figure;
hold on
p1 = plot(x_likelihood, mf_x_likelihood.verynotlikely, 'b-', 'LineWidth', 2);
p2 = plot(x_likelihood, mf_x_likelihood.notlikely, 'c-', 'LineWidth', 2);
p3 = plot(x_likelihood, mf_x_likelihood.likely, 'm-', 'LineWidth', 2);
p4 = plot(x_likelihood, mf_x_likelihood.verylikely, 'r-', 'LineWidth', 2);
grid on
lg = legend([p1, p2, p3, p4], 'Very not likely', 'Not likely', 'Likely', 'Very likely');
set(lg, 'Interpreter', 'latex');
xlabel('Likelyhood of Vibration', 'Interpreter', 'latex');
ylabel('Membershif Function', 'Interpreter', 'latex');

mf = max(min(0, mf_x_likelihood.verynotlikely), max(min(0.1, mf_x_likelihood.notlikely), max(min(0.3, mf_x_likelihood.likely), min(0.9, mf_x_likelihood.verylikely))));
xCentroid = defuzz(x_likelihood , mf, 'bisector');
display(xCentroid)

%%
fs = 1;                                 % Sampling frequency                    
T = 1/fs;                               % Sampling period       
L = 256;                                % Number of samples
t = (0:L-1)*T;                          % Time vector
measured_torque = 5*sin(2*pi*0.3*t);
measured_torque = measured_torque + 3*sin(2*pi*0.02*t);
measured_torque = measured_torque + normrnd(0, 1, [1, length(measured_torque)]);

detect_vibration(fs, measured_torque, true);

%%

freq_vec = 0.05:0.05:0.5;
amp_vec = 0.5:0.5:10;
[X, Y] = meshgrid(freq_vec, amp_vec);
Z = zeros(size(X));
for freq_ind = 1:length(freq_vec)
    for amp_ind = 1:length(amp_vec)
        measured_torque = amp_vec(amp_ind)*sin(2*pi*freq_vec(freq_ind)*t);
        Z(amp_ind, freq_ind) = detect_vibration(fs, measured_torque, false);
    end
end
figure
hold on
surf(X, Y, Z)
xlabel("Frequency")
ylabel("Amplitude")
zlabel("Likelihood")
grid on
%%
function vibration_likelihood = detect_vibration(fs, measured_torque, is_plot)
    % fft analysis to get the oscillation frequency and amplitude
    T = 1/fs;
    L = length(measured_torque);
    t = (0:L-1)*T;
    if is_plot
        figure
        plot(t, measured_torque, 'b-')
        grid on
        xlabel("Time", "Interpreter", "latex")
        ylabel("Torque", "Interpreter", "latex")
    end
    measured_torque_fft = fft(measured_torque);
    P2 = abs(measured_torque_fft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(L/2))/L;
    if is_plot
        figure
        plot(f, P1)
        grid on
        title("Single-Sided Amplitude Spectrum of Measured Torque")
        xlabel("$f$ ($Hz$)", "Interpreter", "latex")
        ylabel("$|P_1(f)|$", "Interpreter", "latex")
    end
    maj_f = f(P1 == max(P1));
    maj_P1 = max(P1);
    % fuzzification
    x_freq = 0:0.01:0.5;
    mf_x_freq = [];
    mf_x_freq.low = trapmf(x_freq, [-1, 0, 0.05, 0.15]);
    mf_x_freq.fine = trapmf(x_freq, [0.05, 0.15, 0.25, 0.35]);
    mf_x_freq.high = trapmf(x_freq, [0.25, 0.40, 0.5, 1]);
    [~, x_freq_ind] = min(abs(maj_f-x_freq));
    x_freq_fuzzy = [mf_x_freq.low(x_freq_ind), mf_x_freq.fine(x_freq_ind), mf_x_freq.high(x_freq_ind)];
    display(x_freq_fuzzy)
    x_amp = 0:0.01:10;
    mf_x_amp = [];
    mf_x_amp.low = gbellmf(x_amp, [4, 10, -2]);
    mf_x_amp.fine = gbellmf(x_amp, [5, 5, 8]);
    [~, x_amp_ind] = min(abs(maj_P1-x_amp));
    x_amp_fuzzy = [mf_x_amp.low(x_amp_ind), mf_x_amp.fine(x_amp_ind)];
    display(x_amp_fuzzy)
    % inference
    y_likelihood_fuzzy = [0,0,0,0]; % very unlikely, unlikely, likely, very likely
    y_likelihood_fuzzy(4) = max(y_likelihood_fuzzy(4), min(x_freq_fuzzy(2), x_amp_fuzzy(2)));
    y_likelihood_fuzzy(3) = max(y_likelihood_fuzzy(3), min(x_freq_fuzzy(2), x_amp_fuzzy(1)));
    y_likelihood_fuzzy(3) = max(y_likelihood_fuzzy(3), min(x_freq_fuzzy(3), x_amp_fuzzy(2)));
    y_likelihood_fuzzy(3) = max(y_likelihood_fuzzy(3), min(x_freq_fuzzy(1), x_amp_fuzzy(2)));
    y_likelihood_fuzzy(2) = max(y_likelihood_fuzzy(2), min(x_freq_fuzzy(3), x_amp_fuzzy(1)));
    y_likelihood_fuzzy(1) = max(y_likelihood_fuzzy(2), min(x_freq_fuzzy(1), x_amp_fuzzy(1)));
    display(y_likelihood_fuzzy)
    % defizzification
    x_likelihood = 0:0.01:1;
    mf_x_likelihood = [];
    mf_x_likelihood.verynotlikely = gbellmf(x_likelihood, [0.2, 5, 0]);
    mf_x_likelihood.notlikely = gbellmf(x_likelihood, [0.15, 3, 0.3]);
    mf_x_likelihood.likely = gbellmf(x_likelihood, [0.15, 3, 0.6]);
    mf_x_likelihood.verylikely = gbellmf(x_likelihood, [0.3, 5, 1]);
    mf = max(min(y_likelihood_fuzzy(1), mf_x_likelihood.verynotlikely), ...
        max(min(y_likelihood_fuzzy(2), mf_x_likelihood.notlikely), ...
        max(min(y_likelihood_fuzzy(3), mf_x_likelihood.likely), ...
        min(y_likelihood_fuzzy(4), mf_x_likelihood.verylikely))));
    vibration_likelihood = defuzz(x_likelihood , mf, 'centroid');
    display(vibration_likelihood)
end
