function data_filtered = convolution(data, local_window)
    FOO = @(data_, local_window_)convolution_local(data_, local_window_);
    data_filtered = colfilt(data, local_window, 'sliding', FOO, local_window);
end