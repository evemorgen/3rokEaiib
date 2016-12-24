%% zadanie 2.B

close all;
clearvars;
clc;

X = 3;
Y = 1;

kwadraty = imread('kwadraty.png');
autocanny = edge(kwadraty, 'canny');
[H,theta,rho] = hough(autocanny);
piki = houghpeaks(H,9);
lines = houghlines(autocanny,theta,rho,piki);


figure;
imshow(autocanny)
hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end


figure;
subplot(Y,X,1);
imshow(kwadraty);
title('orygina??');

subplot(Y,X,2);
imshow(autocanny);
title('canny');

subplot(Y,X,3);
imshow(H, []);
title('hough');

hold on;
plot(piki(:,2), piki(:,1), 'o');