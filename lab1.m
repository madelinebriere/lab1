%% Lab 1
% Problem 1
delta = [0 0 0 1 0 0 0];
len = length(delta);
corr1 = xcorr(delta);
xval = -len+1:len-1;
figure(1)
plot(xval,corr1,'ko')
axis ([-3, 3, -.2, 1.2])
title('Problem 1a')
ylabel('Autocorrelation')
xlabel('Delay (l)')
grid on

% Problem 2
n = -30:30;
vals = cos(2*pi*n/20);
len = length(vals);
corr2 = xcorr(vals);
xval = -len+1:len-1;
figure(2)
plot(xval,corr2,'ko')
title('Problem 1b')
ylabel('Autocorrelation')
xlabel('Delay (l)')
grid on
