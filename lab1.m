%% Lab 1
% Problem 1
delta = [1 0 0];
len = length(delta);
corr1 = xcorr(delta);
xval = -len+1:len-1;
figure(1)
plot(xval,corr1,'ko')

% Problem 2
n = -30:30;
vals = cos(2*pi*n/20);
len = length(vals);
corr2 = xcorr(vals);
xval = -len+1:len-1;
figure(1)
plot(xval,corr2,'ko')
%ylim([-0.05 1.1])