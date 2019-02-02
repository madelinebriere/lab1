%% Lab 1
% Problem 1a
delta = [0 0 0 1 0 0 0];
[xc1, lags1] = xcorr(delta, 'coeff');
figure(1)
stem(lags1, xc1)
axis ([-3, 3, -.2, 1.2])
title('Problem 1a')
ylabel('Normalized Autocorrelation')
xlabel('Delay (l)')
grid on


% Problem 1b
n = -30:30;
vals = cos(2*pi*n/20);
[xc2, lags2] = xcorr(vals, 'coeff');
figure(2)
stem(lags2, xc2)
title('Problem 1b')
ylabel('Normalized Autocorrelation')
xlabel('Delay (l)')
grid on


% Problem 1c
% N = 50
N = 50;
n = -N:N;
for i=1:length(n)
    if (n(i)==0)
        n(i)=eps;
    end
end
vals = 2./(n.*pi).*sin(pi.*n/2);
[xc3,lags3] = xcorr(vals, 'coeff');
figure(3)
subplot(2,1,1)
stem(lags3,xc3)
title('Normalized Autocorrelation - Problem 1c (N=50)')
ylabel('Normalized Autocorrelation')
xlabel('Delay (l)')
axis([-length(lags3)/2 length(lags3)/2 -.5, 1])

subplot(2,1,2)
stem(n, vals)
title('Original Signal - Problem 1c (N=50)')
ylabel('Signal Value')
xlabel('Sample(n)')
axis([-length(lags3)/2 length(lags3)/2 -.5, 1])


% Problem 1c
% N = 250
N = 250;
n = -N:N;
for i=1:length(n)
    if (n(i)==0)
        n(i)=eps;
    end
end
vals = 2./(n.*pi).*sin(pi.*n/2);
[xc4,lags4] = xcorr(vals, 'coeff');
figure(4)
subplot(2,1,1)
stem(lags4,xc4)
title('Normalized Autocorrelation - Problem 1c (N=250)')
ylabel('Normalized Autocorrelation')
xlabel('Delay (l)')
axis([-length(lags4)/2 length(lags4)/2 -.5, 1])

subplot(2,1,2)
stem(n, vals)
title('Original Signal - Problem 1c (N=250)')
ylabel('Signal Value')
xlabel('Sample(n)')
axis([-length(lags4)/2 length(lags4)/2 -.5, 1])
