function text = get_text(bits)
%
% bits: Integer array of bits
%
% Convert integer bit array to ASCII text.
%
to_string = num2str(bits);
text = "";
for i = 1:8:length(to_string)
    letter = to_string(i:i+7)';
    bits = append(letter);
    text = append(text, char(bin2dec(bits)));
end
