function [ertka, po_erozji, po_dylatacji, po_otwarciu, po_zamknieciu] = zadaniaA(obraz, N, wlasne)

    if nargin < 3
        wlasne = false;
    end
    SE = [
        1, 0, 0, 0, 0 ;
        0, 1, 0, 0, 0 ;
        0, 0, 1, 0, 0 ;
        0, 0, 0 ,1 ,0 ;
        0, 0, 0, 0, 1 ;
    ];
        
    ertka = obraz;
    po_erozji = ertka;
    po_dylatacji = ertka;
    po_otwarciu = ertka;
    po_zamknieciu = ertka;
    if wlasne == false
        for i = 1:N
            po_erozji = imerode(po_erozji, strel('square', 3));
            po_dylatacji = imdilate(po_dylatacji, strel('square', 3));
            po_otwarciu = imopen(po_otwarciu, strel('square', 3));
            po_zamknieciu = imclose(po_zamknieciu, strel('square', 3));
        end
    else
        for i = 1:N
            po_erozji = imerode(po_erozji, SE);
            po_dylatacji = imdilate(po_dylatacji, SE);
            po_otwarciu = imopen(po_otwarciu, SE);
            po_zamknieciu = imclose(po_zamknieciu, SE);
        end
    end

    X = 5;
    Y = 1;
    subplot(Y, X, 1);
    imshow(ertka);
    title('Orygina?');

    subplot(Y, X, 2);
    imshow(po_erozji);
    title('Po erozji');
    
    subplot(Y, X, 3);
    imshow(po_dylatacji);
    title('Po dylatacji');

    subplot(Y, X, 4);
    imshow(po_otwarciu);
    title('Po otwarciu');
    
    subplot(Y, X, 5);
    imshow(po_zamknieciu);
    title('Po zamkni?ciu');
end