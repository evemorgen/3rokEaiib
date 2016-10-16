lena = imread('lena.bmp');

lena_256 = imresize(lena, 0.5);
lena_128 = imresize(lena, 0.25);
lena_64 = imresize(lena, 0.125);

figure;
subplot(1,4,1);
imshow(lena, 'InitialMagnification', 100);
title('orgina?');
subplot(1,4,2);
imshow(lena_256, 'InitialMagnification', 200);
title('256');
subplot(1,4,3);
imshow(lena_128, 'InitialMagnification', 400);
title('128');
subplot(1,4,4);
imshow(lena_64, 'InitialMagnification', 800);
title('64');
