
obraz = 'kolo.bmp';
fale = imread(obraz);
ffale = fft2(fale);
fale2 = fftshift(ffale);
fale3 = ifftshift(fale2);
fale4 = ifft2(fale3);
diff = imabsdiff(double(fale), fale4);

figure('name', obraz);
subplot(1,3,1);
imshow(fale);
title('oryginał');
subplot(1,3,2);
imshow(fale3);
title('ifftshift');
subplot(1,3,3);
imshow(diff, []);
title('diff')


