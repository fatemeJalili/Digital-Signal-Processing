function [] = Q5func(fc, lenna)
figure
subplot(2,2,1)
imshow(lenna)
title('original gray image')

[x, y] = meshgrid(-256+1:256);

H = exp(-(log(sqrt(2))) * (x.^2 + y.^2)/(fc^2));

subplot(2,2,3)
imshow(H)
title(['2D Gaussian filter with cutoff frequency fc = ', num2str(fc)]);
xlabel('x');
ylabel('y');

subplot(2,2,4)
s = surf(x, y, H);
s.EdgeColor = 'none';

title(['3D Gaussian filter with cutoff frequency fc = ' , num2str(fc)]);
xlabel('x');
ylabel('y');
zlabel('H(x,y)');

fftLenna = fft2(lenna);
filteredLenna = ifft2(fftLenna .* fftshift(H));
subplot(2,2,2)
imshow(uint8(real(filteredLenna)));
title(['filtered image with cutoff frequency fc = ' , num2str(fc)])

end
