function zmod = union(p, q, tabl)
    zmod = tabl;
    if p > q
        r = q;
        q = p;
        p = r;
    end
    zmod(root(p)) = root(q);
end