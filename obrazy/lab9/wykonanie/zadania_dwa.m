%% zadania 2.

%% 2. A

%% 1. czyścimy
close all;
clearvars;
clc;

%% 2. robimy obraz
obraz = zeros(11);

%% 3. jeden punkt na 1
obraz(5,5) = 1;
obraz(7,7) = 1;
obraz(9,9) = 1;
[H,theta,rho] = hough(obraz, 'RhoResolution',0.1,'ThetaResolution',0.5);

jajko = theta(90);
ro = rho(143);

x = 0:0.1:10;
y = ((ro - x*cosd(jajko))/sind(jajko));


%% 4. poka przestrzen hougha
figure('Name', 'przestrzen hough');

subplot(1,3,1);
imshow(H, []);
title('przestrzen hough');

subplot(1,3,2);
imshow(obraz, []);
title('zeros');

hold on;
%subplot(1,3,3);
plot(x+1,y+1);
%title('plot');