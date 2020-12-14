function packet = createPacket(bitstring, random_additions)
%
% bits: list of bits for the data section of the packet
%
% Build a packet as shown in the paper.
%
preamble = [1, 0, 1, 0, 1, 0, 1, 0]';
frame_control = [1, 1, 0, 0, 1, 1, 0, 0]';

calculated_length = length(bitstring)
len = pad(dec2bin( calculated_length ), 8, 'left', '0')
duration = str2num(reshape(len.', [], 1));

body = bitstring;

ending_error = get_bits(random_additions);

packet = vertcat(preamble, frame_control, duration, body, ending_error);