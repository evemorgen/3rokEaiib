close all;
clearvars;
clc;

img = imread('ferrari.bmp');

erozja = imerode(img, strel('square',3));
dylatacja = imdilate(img, strel('square',3));
otwarcie = imopen(img, strel('square',3)); 
zamkniecie = imclose(img, strel('square',3));
top = imtophat(img, strel('square',3));
bot = imbothat(img, strel('square',3));

figure;
subplot(3,3,1);
imshow(img);
title('orig');
subplot(3,3,2);
imshow(erozja);
title('erozja');
subplot(3,3,3);
imshow(dylatacja);
title('dylatacja');
subplot(3,3,4);
imshow(imabsdiff(img, erozja));
title('orig erozja');
subplot(3,3,5);
imshow(imabsdiff(img, dylatacja));
title('orig dylatacja');
subplot(3,3,6);
imshow(otwarcie);
title('otwarcie');
subplot(3,3,7);
imshow(zamkniecie);
title('zamkniecie');
subplot(3,3,8);
imshow(top);
title('top');
subplot(3,3,9);
imshow(bot);
title('bot');



img = imread('rice.png');



erozja = imerode(img, strel('disk',10));
dylatacja = imdilate(img, strel('disk',10));
otwarcie = imopen(img, strel('disk',10)); 
zamkniecie = imclose(img, strel('disk',10));
top = imtophat(img, strel('disk',10));
bot = imbothat(img, strel('disk',10));

figure;
subplot(3,3,1);
imshow(img);
title('orig');
subplot(3,3,2);
imshow(erozja);
title('erozja');
subplot(3,3,3);
imshow(dylatacja);
title('dylatacja');
subplot(3,3,4);
imshow(imabsdiff(img, erozja));
title('orig erozja');
subplot(3,3,5);
imshow(imabsdiff(img, dylatacja));
title('orig dylatacja');
subplot(3,3,6);
imshow(otwarcie);
title('otwarcie');
subplot(3,3,7);
imshow(zamkniecie);
title('zamkniecie');
subplot(3,3,8);
imshow(top);
title('top');
subplot(3,3,9);
imshow(bot);
title('bot');