function table = createTimetable(Tb, bits)
%
% Tb: Bit period
% Bits: Data for the signal in the timetable
%
% Generate a timetable given a bit period and a list of bits.
%

time_array = (0:(length(bits) - 1)) * Tb;
Time = seconds(time_array)';
table = array2timetable(bits,'RowTimes',Time);