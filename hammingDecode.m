function decoded = hammingDecode(input_vector)
%
% input_vector: Array of integer bits
%
% Decode message in the Hamming(7,4) protocol.
%
decoded = [];
for i = 1:7:length(input_vector)
    decoding_portion = input_vector(i:i+6);
    decData = decode(decoding_portion,7,4,'hamming/binary');
    decoded = vertcat(decoded, decData');
end