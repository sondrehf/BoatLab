%% Define needed constants and initial values for kalman filter and simulation. Load didn't work
%Constants
K_pd = 0.816058507166699;
K = 0.160000000000000;
psi_ref = 30;
T = 70.55;
T_f = 8.395449999999999;
Cd = [0 1 1 0 0];
ad = [0.996954313155578 0.0992754311108234 0 0 0;-0.0607558977016812 0.984528205994299 0 0 0;0 0 1 0.0999291617512947 -1.13341197928432e-05;0 0 0 0.998583569642080 -0.000226628857267288;0 0 0 0 1];
bd = [0;0;1.133411979284324e-05;2.266288572672879e-04;0];
Q_k = [30 0; 0 10^(-6)];
I = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1];
R = 0.0020*pi^2/180^2;
ed = [1.752951148958393e-05 0;3.496817831985058e-04 0;0 -3.778486149100418e-07;0 -1.133411979284323e-05;0 0.100000000000000];
%Initial values
prior_x_est = [0; 0; 0; 0; 0]; 
prior_P_covar = [1 0 0 0 0; 0 0.013 0 0 0; 0 0 pi^2 0 0; 0 0 0 1 0; 0 0 0 0 2.5*10^(-3)];
%Struct for feeding into function
data = struct('ad', ad, 'bd', bd, 'Cd', Cd, 'ed', ed, 'Q_k', Q_k, 'I', I, 'R',R, 'prior_P_covar',prior_P_covar, 'prior_x_est', prior_x_est);
%% PLOTTING PROBLEM 5d
figure;
hold on;
plot(compass_ref.time, compass_ref.signals.values, '--');
plot(compass.time, compass.signals.values, 'r');
%plot(compass_est.time, compass_est.signals.values, 'r');
plot(rudder.time, rudder.signals.values, 'k');
plot(bias_est.time, bias_est.signals.values, 'g');
%plot(rudder_comp.time, rudder_comp.signals.values,'-.c');
legend('Reference for compass angle', 'Measured compass angle', 'Rudder input', 'Estimated bias', 'Rudder input from P5p3c');
title('Kalman feed forward')
xlabel('Time[s]');
ylabel('Degrees[deg]');
xlim([0 500]);
ylim auto;
hold off;
