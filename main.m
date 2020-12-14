clear all
%% Run this section to set up the BPSK 
% Setting All Variables For Simulink
%
% Fc: Carrier frequency
% Tb: Bit period
% wperiod: integrating window period
% SampSin: Time Difference For Sampling Sine
% Tau: Component for LPF transfer function
% Loss: Frequency to handle loss
%

Fc = 2.4e9;
Tb = 1/(Fc);
wperiod = 50;
SampSin = Tb/wperiod;
tau = 1/(2*pi*(Fc+1e9));
loss = Fc*1000;

% Create Packet For Sending
random_additions = 'asdf';
bitlist = get_bits('Hello, world!');
encoded = hammingEncode(bitlist);
packet = createPacket(encoded, random_additions);

bits = createTimetable(Tb, packet)

disp('Set up complete!')

%% Decode Packet And Understand
load('packet_received.mat')
data = deconstructPacket(packet_received);
decoded = hammingDecode(data);
disp('Decoded message!')
textMessage = get_text(decoded)