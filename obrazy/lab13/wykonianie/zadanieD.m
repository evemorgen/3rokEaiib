%% 1. czy??cimy
close all;
clearvars;
clc;

%% 2. wczytujemy
obraz = 'lena.bmp'
lena = imread(obraz);
flena = fft2(lena);
shift = fftshift(flena);
zadaniA(obraz);

%%
[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);

r = sqrt(f1.^2 + f2.^2);
Hd((r>0.1)) = 0;

figure;
colormap(jet(64));
mesh(f1,f2,Hd);

przefiltrowany = shift.*Hd;
bezshiftwa = ifftshift(przefiltrowany);
beztransformaty = ifft2(bezshiftwa);
figure('name', 'dolno');
imshow(beztransformaty, []);

%%
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
figure('name', 'g?rno');
imshow(beztransformaty, []);


%%
[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);

r = sqrt(f1.^2 + f2.^2);
Hd((r<0.1 | r>0.9)) = 0;

figure;
colormap(jet(64));
mesh(f1,f2,Hd);

przefiltrowany = shift.*Hd;
bezshiftwa = ifftshift(przefiltrowany);
beztransformaty = ifft2(bezshiftwa);
figure('name', 'pasmowo');
imshow(beztransformaty, []);

%%
h = fwind1(Hd,hanning(21));
[H f1 f2] = freqz2(h,512,512);

r = sqrt(f1.^2 + f2.^2);
H((r<0.1)) = 0;

figure;
colormap(jet(64));
mesh(f1,f2,H);

przefiltrowany = shift.*H;
bezshiftwa = ifftshift(przefiltrowany);
beztransformaty = ifft2(bezshiftwa);
figure('name', 'hanning');
imshow(beztransformaty, []);

%%
h = fwind1(Hd,chebwin(21));
[H f1 f2] = freqz2(h,512,512);

r = sqrt(f1.^2 + f2.^2);
H((r<0.1)) = 0;

figure;
colormap(jet(64));
mesh(f1,f2,H);

przefiltrowany = shift.*H;
bezshiftwa = ifftshift(przefiltrowany);
beztransformaty = ifft2(bezshiftwa);
figure('name', 'chebwin');
imshow(beztransformaty, []);
