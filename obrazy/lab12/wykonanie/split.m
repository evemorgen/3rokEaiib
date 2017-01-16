ret = split(obraz, y1, y2, x1, x2)
    global prog1;
    global prog2;
    tmpObr = obraz(y1:y2, x1:x2);
    sr = mean(tmpObr);
    odch = std(tmpObr);
    
    if odch < 0.05 && abs(x1 - x2) < prog1 && abs(y1 - y2) < prog2
         
    end
end