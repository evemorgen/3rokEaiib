obr = imread('100zloty.jpg');
war = arrayfun(@(num) bitlayer(obr, num), 1:8, 'UniformOutput',0);

figure;
subplot(3,3,1);
imshow(obr);
title('orygina?');
for i = 1:8
    subplot(3,3,i+1);
    imshow(war{i});
    title(strcat('warstwa ',int2str(i)));
end

figure;
subplot(2,2,1);
imshow(obr);
title('orygina?');
for i = 1:3
    subplot(2,2,i+1);
    zloz_losowe(war);
end
