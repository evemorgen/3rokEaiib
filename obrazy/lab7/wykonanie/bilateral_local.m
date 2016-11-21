function data_filtered = bilateral_local(data, local_window)
    [~, Nx] = size(data);
    sig = 20;
    Ncx = ceil(local_window(1)/2);
    Ncy = ceil(local_window(2)/2);
    data_filtered = zeros(Nx, 1);
    for i = 1:Nx
        patch = reshape(data(:,i), local_window);
        ffid = reshape(data(:,i) - data(((Ncy-1)*local_window(1))+Ncx,i), local_window);
        d = exp((-1)*(power(ffid,2))/(2*power(sig,2)));
        data_filtered(i) = sum(sum(patch .* d));
    end
end