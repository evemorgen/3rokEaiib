function zad2(nazwa)
    %% 4.1 wczytanie hist1
    plot_x = 4;
    plot_y = 2;
    hist1 = imread(nazwa);


    %% 4.2 wyświetlenie hist1 oraz histogramu hist1
    subplot(plot_x,plot_y,1);
    imshow(hist1);
    title('hist1.bmp');

    subplot(plot_x,plot_y,2);
    imhist(hist1, 256);
    title('hist1 hist');

    %% 4.3 adjust skali kolorów
    hist1_adj = imadjust(hist1, [0.3, 0.55], [0, 1]);


    %% 4.4 wyświetlenie adjustowanego i jego histogramu
    subplot(plot_x,plot_y,3);
    imshow(hist1_adj);
    title('hist1_adj');

    subplot(plot_x,plot_y,4);
    imhist(hist1_adj, 256);
    title('hist1_adj hist');

    %% 8.1 Wyliczenie skumulowanego dla normalnego obrazu
    [H, x] = imhist(hist1);
    c_H = cumsum(H, 1);
    max_H = max(H);
    max_C = max(c_H);
    k = max_C/max_H;
    c_H2 = c_H / k;
    LUT = c_H/(max_C)*255;

    %% 8.2 Wyświetlenie skumulowanego
    subplot(plot_x,plot_y,5:6);
    plot(x,H);
    hold on;
    plot(x, c_H2);
    title('kumulowany normalny');

    %% 9.1 Wyliczenie skumulowanego dla adjusted
    [H, x] = imhist(hist1_adj);
    c_H = cumsum(H, 1);
    max_H = max(H);
    max_C = max(c_H);
    k = max_C/max_H;
    c_H2 = c_H / k;

    %% 9.2 Wyświetlenie histów dla adjusted
    subplot(plot_x,plot_y,7:8);
    plot(x,H);
    hold on;
    plot(x, c_H2);
    title('kumulowany adjusted');

    %% 10. i 11. Wyrównywanie histogramu HE
    figure;
    subplot(2,3,1);
    zlutowany = intlut(hist1, uint8(LUT));
    imshow(zlutowany);
    subplot(2,3,2);
    imhist(zlutowany, 256);

    [H, x] = imhist(zlutowany, 256);
    c_H = cumsum(H, 1);
    max_H = max(H);
    max_C = max(c_H);
    k = max_C/max_H;
    c_H2 = c_H / k;

    subplot(2,3,3);
    plot(x,c_H2);

    %% 13. Obczajenie histeq
    subplot(2,3,4);
    histeq(zlutowany, 256);

    subplot(2,3,5:6);
    imshow(adapthisteq(zlutowany));
end
