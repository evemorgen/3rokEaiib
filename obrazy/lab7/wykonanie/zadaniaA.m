%% zadaniaA

%% 1. wczytujemy
load MR_data;

obraz = I_noisy1;
rozmiar = [15 15];

subplot(1,3,1);
imshow(obraz, []);
title('orygina??');

subplot(1,3,2);
imshow(convolution(obraz, rozmiar), []);
title('convolution');

subplot(1,3,3);
imshow(bilateral(obraz, rozmiar), []);
title('bilateral');


