function encoded = hammingEncode(input_vector)
%
% input_vector: vector of integer bits
%
% Encodes bits with a Hamming(7,4) scheme.
%

encoded = [];
for i = 1:4:length(input_vector)
    encoding_portion = input_vector(i:i+3);
    encData = encode(encoding_portion,7,4,'hamming/binary');
    encoded = vertcat(encoded, encData);
end