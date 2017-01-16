function zmod = union(tabl, p, q)
    zmod = tabl;
    if p > q
        r = q;
        q = p;
        p = r;
    end
    zmod(root(tabl,p)) = root(tabl,q);
end