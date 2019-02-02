function [to_ret] = ac_pitch_2(x, L, M, Fs, Fmin, Fmax)
% Note: Cut out last points (bad data)
k_max = ceil((length(x - 2*L))./M)-5;
n_0_func = @(k) M.*(k-1) + 1;
x_mod = [ zeros(1, length(x)), x, zeros(1, length(x))];
x_func = @(n) x_mod(n+length(x));
n = 1:length(x);

% F = Fs/N
% Nmin = Fs / Fmin

l_max = Fs/Fmin;
l_min = Fs/Fmax;

window = floor(2*l_max);
to_ret = zeros(2, k_max);

for k = 1:k_max
    n_0 = n_0_func(k);

    max_amp = -1;
    max_freq = -1;
    for l = ceil(l_min):ceil(l_max)
        A = x_func(ceil((0:window-1)+n_0))*conj(x_func(ceil((0:window-1)+n_0-l)))';
        if(A>max_amp)
            % Halving
            A_half = x_func(ceil((0:window-1)+n_0))*conj(x_func(ceil((0:window-1)+n_0-l/2)))';
            if(A_half>.8*A && ceil(l/2) > l_min)
                max_amp = A_half;
                max_freq = Fs/ceil(l/2);
            else
                max_amp = A;
                max_freq = Fs/l;
            end
        end
    end
    to_ret(1:2, k) = [n_0 max_freq];
end

