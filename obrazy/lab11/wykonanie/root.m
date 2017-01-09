function indeks = root(ind, tabl)
    indeks = ind;
    while ind ~= tabl(ind)
        ind = tabl(ind);
    end
end