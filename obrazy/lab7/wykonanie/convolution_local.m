function data_filtered = convolution_local(data, local_window)
    [abba, Nx] = size(data);
    data_filtered = zeros(Nx, 1);
    h = fspecial('gaussian', local_window, 25);
    for i = 1:Nx
        patch = reshape(data(:,i), local_window);
        data_filtered(i) = sum(sum(patch .* h));
    end
end