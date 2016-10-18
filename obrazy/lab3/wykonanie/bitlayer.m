function bitimage = bitlayer(obraz, layer_nr)

obraz = rgb2gray(obraz);
comparator = bitset(0, layer_nr);
[x,y] = size(obraz);

for i = 1:(x-1)
    for j = 1:(y-1)
        obraz(i, j) = bitand(obraz(i, j), comparator);
        obraz(i, j) = bitget(obraz(i, j), layer_nr);
    end
end

bitimage = boolean(obraz);
end