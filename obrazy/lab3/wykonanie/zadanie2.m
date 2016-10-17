%% zadanie 2 - dodawanie + kombinacja liniowa


%% pkt 1.
clearvars;
close all;
clc;

lena = imread('lena.bmp');
jet = imread('jet.bmp');
dodany = imadd(lena, jet);
dodany_uint16 = imadd(lena, jet, 'uint16');

figure;
subplot(5,2,1);
imshow(dodany);
title('uint8');

subplot(5,2,2);
imshow(dodany_uint16, []);
title('uint16');


%% pkt 4.
kombinacja_lena = imlincomb(2, lena);
kombinacja_jet = imlincomb(1.3, jet);
subplot(5,2,3);
imshow(kombinacja_lena, []);
title('kombinacja lena');

subplot(5,2,4);
imshow(kombinacja_jet, []);
title('kombinacja jet');

%% pkt 5.
odejete_lena = imsubtract(lena, jet);
odejete_lena_16 = imsubtract(int16(lena), int16(jet));

subplot(5,2,5);
imshow(odejete_lena, []);
title('odjęta 10 lena');

subplot(5,2,6);
imshow(odejete_lena_16, []);
title('odjęty 10 lena uint16');

subplot(5,2,7);
diff = imabsdiff(lena, jet);
imshow(diff);
title('imabsdiff');

subplot(5,2,8);
maska = boolean(imread('kolo.bmp'));
mull = immultiply(lena, maska);
imshow(mull);
title('immulltiply');

subplot(5,2,9:10);
neg = imcomplement(lena);
imshow(neg);
title('negatyw');





