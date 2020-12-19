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

%% Plots!
%%plot1
load('binary.mat')
figure
plot1 = plot(binary(1,:), binary(2,:))
xlim([0 4.75e-09])
ylim([-0.1 1.1])
title('Packet Bits')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Bits', 'Location', 'best')
saveas(plot1,'Images/Binary.png')

%% plot2
load('held_signal.mat')
figure
plot2 = plot(held_signal(1,:), held_signal(2,:))
xlim([0 4.75e-09])
ylim([-0.1 1.1])
title('Signal After Sample and Hold')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Sample and Hold Bits', 'Location', 'southeast')
saveas(plot2,'Images/held_signal.png')

%% plot3
load('modulated.mat')
figure
plot3 = plot(modulated(1,:), modulated(2,:))
hold on
plot3 = plot(held_signal(1,:), held_signal(2,:))
xlim([0 4.75e-09])
ylim([-1.1 1.1])
title('Signal Modulated Through BPSK')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Modulated Signal', 'Sample and Hold Bits','Location', 'southeast')
saveas(plot3,'Images/modulated.png')


%% plot4
load('transmitted.mat')
figure
plot4 = plot(transmitted(1,:), transmitted(2,:))
hold on
plot4 = plot(modulated(1,:), modulated(2,:))
xlim([0 4.75e-09])
% ylim([-1.1 1.1])
title('Signal After Transmission')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Transmitted Signal', 'Modulated Signal','Location', 'southeast')
saveas(plot4,'Images/transmitted.png')

%% plot5
load('throughspace.mat')
figure
plot5 = plot(throughspace(1,:), throughspace(2,:))
hold on
plot5 = plot(transmitted(1,:), transmitted(2,:))
hold off
xlim([0 4.75e-09])
% ylim([-1.1 1.1])
title('Effect of Space on The Signal Compared With Transmitted Signal')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Through Space', 'Transmitted Signal','Location', 'southeast')
saveas(plot5,'Images/throughspacecomparison.png')

%% plot6
figure
plot6 = plot(throughspace(1,:), throughspace(2,:))
xlim([0 4.75e-09])
% ylim([-1.1 1.1])
title('Effect of Space on The Signal')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Through Space', 'Location', 'southeast')
saveas(plot6,'Images/throughspace.png')
%% plot7
load('received.mat')
figure
plot7 = plot(received(1,:), received(2,:))
hold on
plot7 = plot(throughspace(1,:), throughspace(2,:))
hold off
xlim([0 4.75e-09])
title('Signal After Receiver')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Received Signal', 'Through Space','Location', 'southeast')
saveas(plot7,'Images/received.png')
%% plot8
load('demodulated.mat')
figure
plot8 = plot(demodulated(1,:), demodulated(2,:))
hold on
plot8 = plot(modulated(1,:), modulated(2,:))
hold off
xlim([0 4.75e-09])
title('Demodulated Signal')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Demodulated Signal', 'Original Modulated Signal','Location', 'southeast')
saveas(plot8,'Images/demodulated.png')
%% plot9
load('received_held.mat')
figure
plot9 = plot(received_held(1,:), received_held(2,:))
hold on
plot9 = plot(demodulated(1,:), demodulated(2,:))
hold off
xlim([0 4.75e-09])
title('Received Bits')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Received Bits', 'Demodulated Signal','Location', 'southeast')
saveas(plot9,'Images/received_held.png')
%% plot10
figure
plot10 = plot(received_held(1,:), received_held(2,:))
hold on
plot10 = plot(held_signal(1,:), held_signal(2,:))
hold off
xlim([0 4.75e-09])
ylim([-0.1 1.1])
title('Sent and Received Signal')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Received Bits', 'Sent Bits','Location', 'southeast')
saveas(plot10,'Images/sent_received.png')
%% plot11
figure
plot10 = plot(received_held(1,:), round(received_held(2,:)))
hold on
plot10 = plot(held_signal(1,:), held_signal(2,:))
hold off
xlim([0 4.75e-09])
ylim([-0.1 1.1])
title('Sent and Rounded Received Signal')
xlabel('Time (seconds)')
ylabel('Signal')
legend('Rounded Received Bits', 'Sent Bits','Location', 'southeast')
saveas(plot10,'Images/sent_received_rounded.png')