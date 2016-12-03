%% zadanie C

%% 1. czy?cimy
close all;
clearvars;
clc;

%% 2. wczytujemy ferarri, robimy erozj?, dylatacj? oraz dylatacj? - erozj?

%ferr = imread('ferrari.bmp');
%ferr = imread('rice.png');
po_erozji = imerode(ferr, strel('square', 3));
po_dylatacji = imdilate(ferr, strel('square', 3));
diff = imsubtract(po_dylatacji, po_erozji);

%% 3. otwarcie i zamkni?cie
po_otwarciu = imopen(ferr, strel('square', 3));
po_zamknieciu = imclose(ferr, strel('square', 3));

%% 4. top-hat, bottom-hat
po_top_hacie = imtophat(ferr, strel('square', 3));
po_bottom_hacie = imbothat(ferr, strel('square', 3));

%% 5. top-hat z dyskiem
po_top_hacie_z_dyskiem = imtophat(ferr, strel('disk', 10));

X = 3;
Y = 3;

subplot(Y,X,1);
imshow(ferr);
title('orygina?');

subplot(Y,X,2);
imshow(diff);
title('dylatacja - erozja');

subplot(Y,X,3);
imshow(po_erozji);
title('erozja');

subplot(Y,X,4);
imshow(po_dylatacji);
title('dylatacja');

subplot(Y,X,5);
imshow(po_otwarciu);
title('otwarcie');

subplot(Y,X,6);
imshow(po_zamknieciu);
title('zamkni?cie');

subplot(Y,X,7);
imshow(po_top_hacie);
title('tophat');

subplot(Y,X,8);
imshow(po_bottom_hacie);
title('bottomhat');

subplot(Y,X,9);
imshow(po_top_hacie_z_dyskiem);
title('tophat z dyskiem 10');