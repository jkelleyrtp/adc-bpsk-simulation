function bitlist = get_bits(string)
%
% String: Input string for ASCII conversion
%
% Converts a string into a sequency of bits for the data portion the
% packet.
%

char_array = [];

for k = 1:length(string)
    char_array = [char_array, string(k)];
end

bitlist = [];
for i = 1:length(char_array)
    decimals = pad(dec2bin(char_array(i)), 8, 'left', '0');
    X = str2num(reshape(decimals.', [], 1));
    bitlist = vertcat(bitlist, X);
end