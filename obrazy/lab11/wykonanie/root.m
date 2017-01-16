function indeks = root(tabl, ind)
    indeks = ind;
    while indeks ~= tabl(indeks)
        indeks = tabl(indeks);
    end
end