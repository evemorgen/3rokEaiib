close all;
clearvars;
clc;

shapes = imread('shapes.png');

imshow(shapes,[]);

shapes4 = bwlabel(shapes, 4);

figure;
imshow(label2rgb(shapes4));

wspolczynniki = obliczWspolczynniki(shapes4);

[YY, XX] = size(shapes4);

for y = 1:YY
   for x = 1:XX
       piksel = shapes4(y,x);
       if (piksel ~= 0 && ~(wspolczynniki(piksel,2) > 0.8 && wspolczynniki(piksel,2) < 0.85))
             shapes4(y,x) = 0;
        end
   end
end

figure;
imshow(shapes4);

