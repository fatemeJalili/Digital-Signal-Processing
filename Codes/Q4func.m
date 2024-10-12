function [] = Q4func(omg)
ommega0 = 2*pi*omg;
t= linspace(0,1-1/8000 , 8000);
x = sin(ommega0*t);

figure
subplot(4,1,1)
stem(x)
xlim([0 50]);
title(['x[n] for 50 samples - ommega0 = 2pi * ',num2str(omg)])

subplot(4,1,2)
plot(x)
xlim([0 50]);
title(['x(t) for 50 samples  - ommega0 = 2pi * ',num2str(omg)])

xx =  linspace(0, 1, 20000);
xrecov = spline(t, x, xx);

subplot(4,1,3)
plot(xrecov)
xlim([0 125]);
title(['recovered x(t) from x[n] using spline  - ommega0 = 2pi * ',num2str(omg)])

FFT = fftshift(fft(xrecov));
f = -10000 : 10000-1;
subplot(4,1,4)
plot(f, abs(FFT))
title(['fourier transform of recovered signal  - ommega0 = 2pi * ',num2str(omg)])
sound(xrecov);