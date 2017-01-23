%% 1. czyścimy
close all;
clearvars;
clc;

%% 2. wczytujemy
obraz = 'lena.bmp'
lena = imread(obraz);
flena = fft2(lena);
shift = fftshift(flena);
zadaniA(obraz);

[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);

r = sqrt(f1.^2 + f2.^2);
Hd((r<0.1)) = 0;
figure;
colormap(jet(64));
mesh(f1,f2,Hd);

przefiltrowany = shift.*Hd;
bezshiftwa = ifftshift(przefiltrowany);
beztransformaty = ifft2(bezshiftwa);
figure;
imshow(beztransformaty, []);