lena = imread('lena.bmp');
lena = imresize(lena, 0.25);

lena_31 = imadjust(lena, [0; 1], [0, 31/256]);
lena_15 = imadjust(lena, [0; 1], [0, 15/256]);
lena_7 = imadjust(lena, [0; 1], [0, 7/256]);
lena_3 = imadjust(lena, [0; 1], [0, 3/256]);
lena_1 = imadjust(lena, [0; 1], [0, 1/256]);

figure;
subplot(2,3,1);
imshow(lena, []);
title('orygina?');
subplot(2,3,2);
imshow(lena_31, []);
title('0 - 31');
subplot(2,3,3);
imshow(lena_15, []);
title('0 - 15');
subplot(2,3,4);
imshow(lena_7, []);
title('0 - 7');
subplot(2,3,5);
imshow(lena_3, []);
title('0 - 3');
subplot(2,3,6);
imshow(lena_1, []);
title('0 - 1');