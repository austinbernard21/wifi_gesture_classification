function ret = numpysave(input_file,output_file)
%   output file should be in form of 'filename.pkl'
samples_from_file = file_csi(input_file, 1000)
[m, t, x] = size(samples_from_file)
samples_flatten = reshape(samples_from_file,[m,t*x])
mat2np(samples_flatten, output_file, 'float64')
return
end

