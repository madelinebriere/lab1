Fs = 22050;
Fmin = 100;
Fmax = 200;
L = 2.*Fs/Fmin;
M = L./2;
Q = (Fmax - Fmin).*L;
n = 1:Q;
 
x1 = @(n) cos(2.*pi.*n.*(Fmin + Fmax)/(2.*Fs)).^3; 
val =  Fs* (2.*pi.*(Fmin + Fmax)/(2.*Fs))/(2*pi);
x1_diff = ones(1,Q).*val;
figure(1)

subplot(2,1,1)
to_ret1 = ac_pitch_2(x1 (n), L, M, Fs, Fmin, Fmax);
plot(to_ret1(1,:), to_ret1(2, :))
title('Problem 4b (Actual; Method 2; Constant Frequency)')
xlabel('Sample (n)')
ylabel('Frequency (Hz)')
axis ([0 40000 149 151])

subplot(2,1,2)
plot(x1_diff)
title('Problem 4b (Expected; Method 2; Constant Frequency)')
xlabel('Sample (n)')
ylabel('Frequency (Hz)')
% TODO: Plot frequency

x2 = @(n) cos((2.*pi.*Fmin./Fs).*n + (2.*pi.*(Fmax-Fmin)/(Q.*Fs)).*n.^2/2).^3.*(n>=1).*(n<=Q);
x2_diff = @(n) Fs*((2.*pi.*Fmin./Fs) + (2.*pi.*(Fmax-Fmin)/(Q.*Fs)).*n)/(2*pi);
figure(2)

subplot(2,1,1)
to_ret2 = ac_pitch_2(x2 (n), L, M, Fs, Fmin, Fmax);
plot(to_ret2(1,:), to_ret2(2, :))
title('Problem 4b (Actual; Method 2; Linear Frequency)')
xlabel('Sample (n)')
ylabel('Frequency (Hz)')
axis ([0 40000 10 200])

subplot(2,1,2)
plot(n, x2_diff(n))
title('Problem 4b (Expected; Method 2; Linear Frequency)')
xlabel('Sample (n)')
ylabel('Frequency (Hz)')
% TODO: Plot frequency

[x, Fs] = audioread('chromatic-scale.mp3');
% C C# D D# E F F# G G# A A# B
% 261 277 293
% 311 329 349
% 369 391 415
% 440 466 493 523

Fmin = 200;
Fmax = 600;
L = 2.*Fs/Fmin;
M = L./2;
Q = length(x);

figure(3)
subplot(2,1,1)
to_ret3 = ac_pitch_2(x(:,1)', L, M, Fs, Fmin, Fmax);
plot(to_ret3(1,:), to_ret3(2, :))
title('Problem 4c (Actual; Method 2)')
xlabel('Sample (n)')
ylabel('Frequency (Hz)')
subplot(2,1,2)
note_length = 11100;
x_exp = [ ones(1,note_length)*261 ...
          ones(1,note_length)*277 ...
          ones(1,note_length)*293 ...
          ones(1,note_length)*311 ...
          ones(1,note_length)*329 ...
          ones(1,note_length)*349 ...
          ones(1,note_length)*369 ...
          ones(1,note_length)*391 ...
          ones(1,note_length)*415 ...
          ones(1,note_length)*440 ...
          ones(1,note_length)*466 ...
          ones(1,note_length)*493 ...
          ones(1,note_length)*523 ...
          ones(1,note_length)*493 ...
          ones(1,note_length)*466 ...
          ones(1,note_length)*440 ...
          ones(1,note_length)*415 ...
          ones(1,note_length)*391 ...
          ones(1,note_length)*369 ...
          ones(1,note_length)*349 ...
          ones(1,note_length)*329 ...
          ones(1,note_length)*311 ...
          ones(1,note_length)*293 ...
          ones(1,note_length)*277 ...
          ones(1,note_length)*261];
plot(x_exp)
title('Problem 4c (Expected; Method 2)')
xlabel('Sample (n)')
ylabel('Frequency (Hz)')
% TODO: Plot frequency

