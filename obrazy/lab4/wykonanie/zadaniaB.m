%%zadania B

%% 1. Clear stuff
clearvars;
clc;
close all;
x = 2;
y = 3;

%% 2. wczytaj phobos.bmp
moon = imread('phobos.bmp');
subplot(y,x,1);
imshow(moon);

%% 3. wyr?wnujemy histogram
wyrownany = histeq(moon);
subplot(y,x,2)
imshow(wyrownany);

%% 4. Wynik nie jest zadowalaj?cy. Wczytaj histogramZadany
load('histogramZadany');
subplot(y,x,3:4);
bar(histogramZadany);
lepiejWyrownany = histeq(moon, histogramZadany);

%% 5. Rysujemy
subplot(y,x,5);
imshow(lepiejWyrownany);
subplot(y,x,6);
imhist(lepiejWyrownany);