function [Time] = convertFrames2Time(Frames)

%Converts frames to time and shortens the data array based on user based values
% only meant to work on Device unless switched
[m1,n1] = size(Frames);
stop = max(Frames);
Time(m1,n1) = 0;
counter = 1;

%Converts Frames to time;
for i = 1:m1
        Time(counter,1) = Frames(i,1)/120;
        counter = counter+1;
end