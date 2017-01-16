%% zadania 10.2
%% 1. Czy??cimy, wczytujemy
close all;
clearvars;
clc;

ccl = imread('ccl1.png');
imshow(ccl);

%% 2. Jedziemy po ca??ym obrazku

[YY, XX] = size(ccl);
L = 1;
id = 1:100;
lut = zeros(100);

%for y = 2:(XX-1)
%    for x = 2:(YY-1)
for y = 2:YY
   for x = 2:(XX-1)
        if ccl(y,x) ~= 0
            sasiedzi = [ccl(y-1, x-1), ccl(y-1, x), ccl(y-1, x+1), ccl(y, x-1)];
            if sum(sasiedzi) == 0
                ccl(y,x) = L;
                L = L + 1;
            else
                nie_zerowi_sasiedzi = nonzeros(sasiedzi);
                min_sasiad = min(nie_zerowi_sasiedzi);
                max_sasiad = max(nie_zerowi_sasiedzi);
                if min_sasiad == max_sasiad
                    ccl(y,x) = min_sasiad;
                else
                    ccl(y,x) = min_sasiad;
                    id = union(id,min_sasiad, max_sasiad);   
                end
            end
            
        end
    end
end

figure;
subplot(2,1,1);
imshow(label2rgb(ccl));
subplot(2,1,2);
imshow(imread('ccl1Result.png'));

for i = 1:100
    lut(i) = root(id,i);
end

for y = 2:YY
   for x = 2:(XX-1)
      if (ccl(y,x) > 0)
        ccl(y,x) = lut(ccl(y,x));
      end
   end
end

figure;
imshow(label2rgb(ccl));