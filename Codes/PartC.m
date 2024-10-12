clear; close all; clc;
%% DSP - Final Project %%%%%%%%%%%%%%%%%%%%%%

%% PART C
cat = imread('cat.jpg');
horse = imread('horse.jpg');

[horseHeight, horseWidth, ~] = size(horse);
catResized = imresize(cat, [horseHeight, horseWidth]);

[catHeight, catWidth, ~] = size(cat);
horseResized = imresize(horse, [catHeight, catWidth]);

fftCatResized = fft2(catResized);
magCatResized = abs(fftCatResized);

fftHorseResized = fft2(horseResized);
magHorseResized = abs(fftHorseResized);

fftHorse = fft2(horse);
phHorse = angle(fftHorse);

fftCat = fft2(cat);
phCat = angle(fftCat);

combinedFFT1 = magCatResized .* exp(1j * phHorse);
combImage1 = ifft2(combinedFFT1);

combinedFFT2 = magHorseResized .* exp(1j * phCat);
combImage2 = ifft2(combinedFFT2);

figure
subplot(1,2,1)
imshow(horse);
title('original horse image');
subplot(1,2,2)
imshow(uint8(real(combImage1)));
title('horse image(phase) with magnitude of cat image');

figure
subplot(1,2,1)
imshow(cat);
title('original cat image');
subplot(1,2,2)
imshow(uint8(real(combImage2)));
title('cat image(phase) with magnitude of horse image');

