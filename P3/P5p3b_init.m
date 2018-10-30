%%Use the correct values for K.
K = 0.16;
T = 70.55;

%%Drawing bode plot.
%%given
w_c = 0.1;
%%0.1 is alpha, defined to lift the phase.
T_f = 0.119*T; 
%%Psi_ref
psi_ref = 30;

K_pd_desibel = -log10(K) + log10(w_c) + log10(abs(complex(1, w_c*T_f)));
K_pd = 10^((K_pd_desibel));
s = tf('s');
H_0 = K * K_pd/(s*(1+T_f*s));
sys = tf(H_0);
bode(H_0);
margin(H_0);

%%Plotting the model
figure;
plot(compass.time, compass.signals.values, 'b');
hold on;
plot(rudder.time, rudder.signals.values, '--k');
legend('Model', 'Ship Compass', 'Rudder input');
xlabel('Time[s]');
ylabel('Degrees[deg]');
xlim([0 300]);
ylim auto;
