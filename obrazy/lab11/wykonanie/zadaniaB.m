ccl = imread('ccl2.png');
imshow(ccl);

ccl4 = bwlabel(ccl,4);
ccl8 = bwlabel(ccl,8);

figure;
imshow(ccl4);
figure;
imshow(ccl8);
