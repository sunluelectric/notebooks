% vibration_detection.m (part 2)
clear
close all
%%
vd_fis = mamfis( ...
    'NumInputs', 2, ...
    'NumInputMFs', [3, 2], ...
    'NumOutputs', 1, ...
    'NumOutputMFs', 4, ...
    'AddRule', 'none' ...
    );
% ios
vd_fis.Inputs(1).Name = 'torque_frequency';
vd_fis.Inputs(1).Range = [0, 0.5];
vd_fis.Inputs(1).MembershipFunctions(1).Name = 'low';
vd_fis.Inputs(1).MembershipFunctions(1).Type = 'trapmf';
vd_fis.Inputs(1).MembershipFunctions(1).Parameters = [-1, 0, 0.05, 0.15];
vd_fis.Inputs(1).MembershipFunctions(2).Name = 'fine';
vd_fis.Inputs(1).MembershipFunctions(2).Type = 'trapmf';
vd_fis.Inputs(1).MembershipFunctions(2).Parameters = [0.05, 0.15, 0.25, 0.35];
vd_fis.Inputs(1).MembershipFunctions(3).Name = 'high';
vd_fis.Inputs(1).MembershipFunctions(3).Type = 'trapmf';
vd_fis.Inputs(1).MembershipFunctions(3).Parameters = [0.25, 0.40, 0.5, 1];
vd_fis.Inputs(2).Name = 'torque_amplitude';
vd_fis.Inputs(2).Range = [0, 10];
vd_fis.Inputs(2).MembershipFunctions(1).Name = 'low';
vd_fis.Inputs(2).MembershipFunctions(1).Type = 'gbellmf';
vd_fis.Inputs(2).MembershipFunctions(1).Parameters = [4, 10, -2];
vd_fis.Inputs(2).MembershipFunctions(2).Name = 'fine';
vd_fis.Inputs(2).MembershipFunctions(2).Type = 'gbellmf';
vd_fis.Inputs(2).MembershipFunctions(2).Parameters = [5, 5, 8];
plotmf(vd_fis, 'input', 1, 1000)
vd_fis.Outputs(1).Name = 'vibration_likelihood';
vd_fis.Outputs(1).Range = [0, 1];
vd_fis.Outputs(1).MembershipFunctions(1).Name = 'very_unlikely';
vd_fis.Outputs(1).MembershipFunctions(1).Type = 'gbellmf';
vd_fis.Outputs(1).MembershipFunctions(1).Parameters = [0.2, 5, 0];
vd_fis.Outputs(1).MembershipFunctions(2).Name = 'unlikely';
vd_fis.Outputs(1).MembershipFunctions(2).Type = 'gbellmf';
vd_fis.Outputs(1).MembershipFunctions(2).Parameters = [0.15, 3, 0.3];
vd_fis.Outputs(1).MembershipFunctions(3).Name = 'likely';
vd_fis.Outputs(1).MembershipFunctions(3).Type = 'gbellmf';
vd_fis.Outputs(1).MembershipFunctions(3).Parameters = [0.15, 3, 0.6];
vd_fis.Outputs(1).MembershipFunctions(4).Name = 'very_likely';
vd_fis.Outputs(1).MembershipFunctions(4).Type = 'gbellmf';
vd_fis.Outputs(1).MembershipFunctions(4).Parameters = [0.3, 5, 1];
plotmf(vd_fis, 'output', 1, 1000)
% rules
rules = ["if torque_frequency is fine and torque_amplitude is fine then vibration_likelihood is very_likely"; ...
    "if torque_frequency is fine and torque_amplitude is low then vibration_likelihood is likely"; ...
    "if torque_frequency is high and torque_amplitude is fine then vibration_likelihood is likely"; ...
    "if torque_frequency is high and torque_amplitude is low then vibration_likelihood is unlikely"; ...
    "if torque_frequency is low and torque_amplitude is fine then vibration_likelihood is likely"; ...
    "if torque_frequency is low and torque_amplitude is low then vibration_likelihood is very_unlikely"; ...
    "if torque_amplitude is fine then vibration_likelihood is likely" ...
    ];
vd_fis = addRule(vd_fis, rules);
% display
gensurf(vd_fis)

%%
fs = 1;                                 % Sampling frequency                    
T = 1/fs;                               % Sampling period       
L = 600;                                % Number of samples
t = (0:L-1)*T;                          % Time vector
measured_torque = 5*sin(2*pi*0.35*t);
measured_torque = measured_torque + 3*sin(2*pi*0.02*t);
measured_torque = measured_torque + normrnd(0, 1, [1, length(measured_torque)]);

measured_torque_fft = fft(measured_torque);
P2 = abs(measured_torque_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
maj_f = f(P1 == max(P1));
maj_P1 = max(P1);
evalfis(vd_fis,[maj_f, maj_P1])





