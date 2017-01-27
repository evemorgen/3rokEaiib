clearvars;
close all;
clc;

global threshold 
global limit 
global segRes 
global MRes 
global index

parasol = imread('umbrealla.png');

hsv = rgb2hsv(parasol);
H = double(hsv(:, :, 1));
[Y, X] = size(H);

segRes = zeros(Y, X);
MRes = zeros(Y, X);
threshold = 0.05;
limit = 8;
index = 1;
colThresh = 5/255;

split(H, 1, 1, X, Y);

mask = strel('square', 3);
i = 0;
while i <= index 
    IB = segRes == i;
    if ~any(IB(:))
        i = i + 1;
        continue;
    else
        [yF, xF] = find(IB, 1, 'first');
        IBdil = imdilate(IB, mask);
        IBdiff = imabsdiff(IB, IBdil);
        IBmult = IBdiff .* segRes;
        IBunq = unique(nonzeros(IBmult));
        
        flag = 0;
        for j = 1 : numel(IBunq)
            IBS = segRes == IBunq(j);
            [yFS, xFS] = find(IBS, 1, 'first');            
            colorDiff = abs(MRes(yF, xF) - MRes(yFS, xFS));
            if colorDiff < colThresh
                segRes(IBS) = i;
                flag = 1;
            end;
        end;
        if flag == 0
            i = i + 1;
            continue;
        end;
    end;
end;

minSize = 4;

U = unique(segRes);
for i = 1 : numel(U)
    C = segRes == U(i);
    if sum(C) < minSize
        segRes(C) = 0;
    end;
end;

U2 = unique(segRes);
for ii = 1 : numel(U2)
    C = segRes == U(ii);
    segRes(C) = ii;
end;

final = label2rgb(segRes);

figure(1);
subplot(1,2,1);
imshow(parasol,[]);
title('Orygina?');
subplot(1,2,2);
imshow(final);
title('Posegmentowany');