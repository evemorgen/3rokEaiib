%% zadaniaA

%% 1. wczytujemy
load MR_data;

obraz = I_noisy1;
rozmiar = [15 15];

subplot(1,2,1);
imshow(obraz, []);
title('oryginał');

subplot(1,2,2);
imshow(convolution(obraz, rozmiar), []);
title('convolution');

