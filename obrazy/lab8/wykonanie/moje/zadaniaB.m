%% zadania B

figure;
fingerprint = imread('fingerprint.bmp');
kosc = imread('kosc.bmp');
text = imread('text.bmp');

X = 2;
Y = 4;
subplot(Y,X, 1);
imshow(fingerprint);
title('orygina?');


morph = bwmorph(fingerprint, 'thin');
subplot(Y,X,2);
imshow(morph);
title('bwmorph');

subplot(Y,X,3);
imshow(kosc);
title('orygina?');

szkiel = bwmorph(kosc,'skel', Inf);
subplot(Y,X,4);
imshow(szkiel);
title('szkiel');


SE = ones(51, 1);
otwarty = imopen(text, SE);
reotwarty = imreconstruct(imerode(text, SE), text);

subplot(Y,X,5);
imshow(otwarty);
title('otwarty');

subplot(Y,X,6);
imshow(reotwarty);
title('rekonstruowany');

filowany = imfill(text, 'holes');
brzeg = imclearborder(text);

subplot(Y,X,7);
imshow(filowany);
title('imfill');

subplot(Y,X,8);
imshow(brzeg);
title('brzeg');

