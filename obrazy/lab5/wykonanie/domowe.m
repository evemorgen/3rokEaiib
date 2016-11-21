%% domowe

%% 1.
obraz = imread('plytkaSzumImp.bmp');
subplot(1,3,1);
imshow(obraz);
title('orygina?');

%% 2.
konwolucjonowany = uint8(medfilt2(obraz, [7 7]));
subplot(1,3,2);
imshow(konwolucjonowany);
title('konwolucjonowany');