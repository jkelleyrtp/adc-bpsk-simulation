function data = deconstructPacket(packet)
%
% packet: Packet that has been assembled in the way described in the
% associated paper 
%
% Get the data portion of the packet out and return it.
%
index = find(packet(2,:) ~= 0, 1, 'first')
unpadpacket = packet(2, index : end);

duration = int32(unpadpacket(17:24))
duration = bin2dec(num2str(duration))
data = unpadpacket(25:(25+(duration - 1)));



