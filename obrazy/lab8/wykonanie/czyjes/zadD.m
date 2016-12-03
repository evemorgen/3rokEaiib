close all;
clearvars;
clc;

img = imread('calculator.bmp');

erozja = imerode(img, ones(1,71));
rekonstrukcja = imreconstruct(erozja, img);
otwarcie = imopen(img, ones(1,71));

figure;
subplot(2,2,1);
imshow(img);
title('orig');
subplot(2,2,2);
imshow(erozja);
title('erozja');
subplot(2,2,3);
imshow(rekonstrukcja);
title('rekonstrukcja');
subplot(2,2,4);
imshow(otwarcie);
title('otwarcie');

tophatr = imabsdiff(img, rekonstrukcja);
tophat = imtophat(img, ones(1,71));

figure;
subplot(1,2,1);
imshow(tophatr);
title('top hat rekonstrukcja');
subplot(1,2,2);
imshow(tophat);
title('top hat');

erozja1 = imerode(tophatr, ones(1,11));
to = imreconstruct(erozja1, tophatr);

figure;
subplot(1,2,1);
imshow(erozja1);
title('erozja na top hat rekonstrukcja');
subplot(1,2,2);
imshow(to);
title('rekonstrukcja lewego obrazu');

dylatacja = imdilate(to, ones(1,21));
rekonstrukcja2 = imreconstruct(min(tophatr,dylatacja),tophatr);

figure;
subplot(1,2,1);
imshow(dylatacja);
title('dylatacja');
subplot(1,2,2);
imshow(rekonstrukcja2);
title('final');