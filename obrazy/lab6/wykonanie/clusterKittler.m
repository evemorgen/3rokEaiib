%% Wyznaczenie progu binaryzacji metoda CLUSTER KITTLER

% Autor: Tomasz Kryjak
% Laboratorium Biocybernetyki AGH
% Utworzono            : 08.09.2009
% Ostatnia modyfikajca : 08.09.2009


function Topt = clusterKittler(obraz)

    [H x] = imhist(obraz);

    p = H / sum(H);

    w_k = cumsum(p);
    mi_k = cumsum(p .* (1:256)');


    w_0 = w_k;
    w_1 = 1 -w_k;

    mi_0 = mi_k ./ w_k;
    mi_T = mi_k(end);
    mi_1 = (mi_T-mi_k)./(1-w_k);

    for T= 1:1:256
        o_0(T) = sum( (((1:T)' -mi_0(T)).^2) .*p(1:T))./w_0(T); 
        o_1(T) = sum( (((T+1:256)' -mi_1(T)).^2) .*p(T+1:256))./w_1(T);
    end

    o_0 = sqrt(o_0);
    o_1 = sqrt(o_1);


    J = 1 + 2*( w_0.*log10(o_0)' + w_1.*log10(o_1)') - 2*(w_0.*log10(w_0)+w_1.*log10(w_1));

    for i = 1:1:256
        if ( J(i) == -Inf)
            J(i) = NaN;
        end
    end

    [value Topt] = min(J);

end