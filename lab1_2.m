%% Problem 2
n = 0:99;
x_a = @(n) cos(2.*pi.*.1.*n).*(n>=0).*(n<=99);
[ac1, lags1] = xcorr(x_a(n), 'coeff');

figure(1)
subplot(2,1,1)
stem(lags1, ac1)
title('Normalized Autocorrelation - Problem 2a')
ylabel('Normalized Autocorrelation')
xlabel('Delay (l)')

subplot(2,1,2)
stem(n, x_a(n))
title('Original Signal - Problem 2a')
ylabel('Original Signal')
xlabel('Sample (n)')
axis([-100 100 -.5 1])

%% 
x_b = @(n) cos(2.*pi.*(n.*n./1600)).*(n>=0).*(n<=99);
[ac2, lags2] = xcorr(x_b(n), 'coeff');

figure(2)
subplot(2,1,1)
stem(lags2, ac2)
title('Normalized Autocorrelation - Problem 2b')
ylabel('Normalized Autocorrelation')
xlabel('Delay (l)')

subplot(2,1,2)
stem(n, x_b(n))
title('Original Signal - Problem 2b')
ylabel('Original Signal')
xlabel('Sample (n)')
axis([-100 100 -.5 1])

%% Noisy
% noise
n_noise = 1:10000;

% Normalize for energy levels
count_a = 0;
for i = 1:100
    rand = randn(1,10000);
    x_norm = x_a(n_noise-2000)./sqrt(sum(x_a(n_noise).^2));
    rand_noise = rand(n_noise);
    % Scale noise down to .1
    y = 5.*x_norm+rand_noise;
    [ac3, lags3] = xcorr(y, x_a(n));
    [value_max, x_max] = max(ac3);
    % 2000 = compensate for delay
    % 10,000 = converting from lag back to n
    % Indexing fucking blows
    estimate = x_max - 10000 - 2000 + 1;
    if(estimate == 0)
       count_a = count_a + 1;
    end
end
count_a

% Normalize for energy levels
count_b = 0;
for i = 1:100
    rand = randn(1,10000);
    x_norm = x_b(n_noise-2000)./sqrt(sum(x_b(n_noise).^2));
    rand_noise = rand(n_noise);
    % Scale noise down to .1
    y = 5.*x_norm+rand_noise;
    [ac4, lags4] = xcorr(y, x_b(n));
    [value_max, x_max] = max(ac4);
    % 2000 = compensate for delay
    % 10,000 = converting from lag back to n
    % Indexing fucking blows
    estimate = x_max - 10000 - 2000 + 1;
    if(estimate == 0)
       count_b = count_b + 1;
    end
end
count_b

% 2e: Choose better
n = 0:99;
noise = load('ultra_test.txt')';
[ac5, lags5] = xcorr(noise, x_b(n));
[value_max, x_max] = max(ac5);
% Starts recording time 0
% End of signal is at -99
f = 100000;
s = 1000;
dist = .5.*s.*(x_max - length(noise))./f
