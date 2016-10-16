% zadanie 3

papuga = imread('parrot.bmp');
zegar = imread('clock.bmp');
szachownica = imread('chessboard.bmp');

papuga_x2_n = imresize(papuga, 2, 'nearest');
zegar_x2_n = imresize(zegar, 2, 'nearest');
szachownica_x2_n = imresize(szachownica, 2, 'nearest');

papuga_x2_b = imresize(papuga, 2, 'bilinear');
zegar_x2_b = imresize(zegar, 2, 'bilinear');
szachownica_x2_b = imresize(szachownica, 2, 'bilinear');

papuga_x2_bc = imresize(papuga, 2, 'bicubic');
zegar_x2_bc = imresize(zegar, 2, 'bicubic');
szachownica_x2_bc = imresize(szachownica, 2, 'bicubic');

papuga_x1_n = imresize(papuga, 1.3, 'nearest');
zegar_x1_n = imresize(zegar, 1.3, 'nearest');
szachownica_x1_n = imresize(szachownica, 1.3, 'nearest');

papuga_x1_b = imresize(papuga, 1.3, 'bilinear');
zegar_x1_b = imresize(zegar, 1.3, 'bilinear');
szachownica_x1_b = imresize(szachownica, 1.3, 'bilinear');

papuga_x1_bc = imresize(papuga, 1.3, 'bicubic');
zegar_x1_bc = imresize(zegar, 1.3, 'bicubic');
szachownica_x1_bc = imresize(szachownica, 1.3, 'bicubic');

figure;
subplot(3,3,1);
imshow(papuga_x2_n);
title('s?siad');
subplot(3,3,2);
imshow(papuga_x2_b);
title('dwuliniowa');
subplot(3,3,3);
imshow(papuga_x2_bc);
title('bicubic');

subplot(3,3,4);
imshow(zegar_x2_n);
title('s?siad');
subplot(3,3,5);
imshow(zegar_x2_b);
title('dwuliniowa');
subplot(3,3,6);
imshow(zegar_x2_bc);
title('bicubic');

subplot(3,3,7);
imshow(szachownica_x2_n);
title('s?siad');
subplot(3,3,8);
imshow(szachownica_x2_b);
title('dwuliniowa');
subplot(3,3,9);
imshow(szachownica_x2_bc);
title('bicubic');

figure;
subplot(3,3,1);
imshow(papuga_x1_n);
title('s?siad');
subplot(3,3,2);
imshow(papuga_x1_b);
title('dwuliniowa');
subplot(3,3,3);
imshow(papuga_x1_bc);
title('bicubic');

subplot(3,3,4);
imshow(zegar_x1_n);
title('s?siad');
subplot(3,3,5);
imshow(zegar_x1_b);
title('dwuliniowa');
subplot(3,3,6);
imshow(zegar_x1_bc);
title('bicubic');

subplot(3,3,7);
imshow(szachownica_x1_n);
title('s?siad');
subplot(3,3,8);
imshow(szachownica_x1_b);
title('dwuliniowa');
subplot(3,3,9);
imshow(szachownica_x1_bc);
title('bicubic');
