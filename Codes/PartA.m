clear; close all; clc;
%% DSP - Final Project %%%%%%%%%%%%%%%%%%%%%%

%% PART A
n = -200 : 1 : 200;
y = cos(0.02*pi*n + pi/4);
subplot(4,1,1)
stem(n,y)
title('1 - noiseless signal - period estimation using plot');

w = wgn(1, length(n), 1, 'linear');
z = y + 0.5 * w;
subplot(4,1,2)
stem(n,z);
title('2 - noisy signal - to compare with above signal (noiseless)');

subplot(4,1,3)
stem(n,z);
xlim([0 100]);
title('2 - noisy signal - 0 < n < 100');

m = n-20;
yshifted = cos(0.02*pi*m + pi/4);
r = yshifted + 0.5 * w;
subplot(4,1,4)
stem(n,r);
title('3 - shifted noisy signal');

[correlation, lag] = xcorr(r, y);
[~, idx] = max(correlation);
delay = lag(idx);

disp(['The estimated delay between r[n] and y[n] is ', num2str(delay), ' samples.']);





