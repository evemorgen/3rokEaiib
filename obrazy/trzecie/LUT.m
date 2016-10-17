function LUT(obraz, przekodowanie)
%LUT super funkcja do przekształceń LUT
%   Jaki lut jest, każdy widzi, byle nie zimny..

obrazek = imread(obraz);
przekodowanyObrazek = intlut(obrazek, przekodowanie);

subplot(2,2,3:4);
xlim auto;
ylim auto;
daspect auto;
plot(przekodowanie);
title('funkcja')

subplot(2,2,1);
imshow(obrazek);
title('oryginał')

subplot(2,2,2);
imshow(przekodowanyObrazek);
title('przekodowany');

end

