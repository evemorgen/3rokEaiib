function [amplituda, faza] = zadaniA(obraz)
    X = 2;
    Y = 3;
    fale = imread(obraz);
    ffale = fft2(fale);
    amplituda = abs(fftshift(ffale));
    amplituda = log10(amplituda+1);
    faza = angle(ffale.* (amplituda > 0.0001));
    F1 = fft(fale, [], 1);
    F2 = fft(F1, [], 2);
    
    figure('name', obraz);
    subplot(Y,X,1);
    imshow(fale);
    title('oryginał')
    subplot(Y,X,2);
    imshow(fftshift(ffale));
    title('fourier')
    subplot(Y,X,3);
    imshow(amplituda, []);
    title('amplituda')
    subplot(Y,X,4);
    imshow(faza, []);
    title('faza')
    
    subplot(Y,X,5);
    imshow(F1);
    title('pierwsza tf')
    subplot(Y,X,6);
    imshow(F2);
    title('druga tf')
    
    
end

