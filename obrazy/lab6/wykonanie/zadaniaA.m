%% 1. Na podstawie histogramu

function zadaniaA(obrazek, prog)
    coin = imread(obrazek);
    binaryzacja1 = im2bw(coin, prog/255);

    X = 2;
    Y = 2;
    figure;
    subplot(Y,X, 1);
    imshow(coin);
    title('Oryginał');

    subplot(Y,X, 3:4);
    imhist(coin);
    title('Histogram');

    subplot(Y,X, 2);
    imshow(binaryzacja1, []);
    title(sprintf('binaryzacja %d/255', prog));
end