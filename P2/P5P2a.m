%Defining frequency
fs = 10;
x = (psi_w);
%PSD estimation from the second row of x (not time series) 
[pxx,f] = pwelch(x(2,:)*pi/180,4096,[],[],fs);

%Plotting with radians
pxx1 = pxx/(2*pi);
f1 = f * 2*pi;
plot(f1,pxx1);
axis([0 1.65 -0.00009 0.0010])
title('PSD estimation')
grid minor;
xlabel('Frequency [rad/s]');
ylabel('Power Spectral Density [power s/rad]')


%%Finding max value and corresponding frequency value%%
display(max(pxx1));
LineH = get(gca, 'children');
Value = get(LineH, 'YData');
Time = get(LineH, 'XData');
[maxValue, maxIndex] = max(Value);
maxTime = Time(maxIndex);
display(maxTime)



