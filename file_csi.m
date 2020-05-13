function samples_from_file = file_csi(file, packets_per_sample)
csi_trace = read_bf_file(file)
[total_packets,~] = size(csi_trace)
samples_per_file = floor(total_packets / packets_per_sample)
samples_from_file = zeros(samples_per_file,packets_per_sample,30)
for i=0:samples_per_file-1
    sample = zeros(packets_per_sample,30)
    for j=1:packets_per_sample
        csi_entry = csi_trace{i*packets_per_sample+j};
        csi = get_scaled_csi(csi_entry);
        csi_packet = db(abs(squeeze(csi).'));
        sample(j,:) = csi_packet(:,1);
        sample(~isfinite(sample)) = 0;
    end
    samples_from_file(i+1,:,:) = denoise(sample,5);
end
end