
% 1.A
%% 1. czyszczenie
close all;
clearvars;
clc;

X = 3;
Y = 1;

%% 2. wczytujemy
dom = imread('dom.png');

%% 3. detekcja krawedzi
autolog = edge(dom, 'log');
detekted = edge(dom,'log', [], 3);

%% 4. wyswietl
figure('Name','LoG');
subplot(Y,X,1);
imshow(dom);
title('oryginał');

subplot(Y,X,2);
imshow(autolog);
title('automagicznie');

subplot(Y,X,3);
imshow(detekted);
title('ręcznie');


% 1. B

%% canny
autocanny = edge(dom, 'canny');
canny = edge(dom, 'canny', 0.23, 1.5);


figure('Name', 'canny');
subplot(Y,X,1);
imshow(dom);
title('oryginał');

subplot(Y,X,2);
imshow(autocanny);
title('automagicznie');

subplot(Y,X,3);
imshow(canny);
title('ręcznie');

% 1. C
autosobel = edge(dom,'Sobel');
sobel = edge(dom, 'Sobel', 0.15);

figure('Name', 'sobel');
subplot(Y,X,1);
imshow(dom);
title('oryginał');

subplot(Y,X,2);
imshow(autosobel);
title('automagicznie');

subplot(Y,X,3);
imshow(sobel);
title('ręcznie');
