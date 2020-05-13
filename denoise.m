function data_denoise = denoise(raw_data, denoise_level)
[m,n] = size(raw_data)
data_denoise = zeros(m,n)
for i=1:m
    [C,L] = wavedec(abs(raw_data(i,:)), denoise_level, 'db1');
    data_denoise(i,:) = wrcoef('a', C, L, 'db1', denoise_level);
end
end