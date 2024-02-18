function [time] = shortenDeviceTime(Frames)
[m,n] = size(Frames);
counter = 1;
time(m,n) = 0;
for i = 1:m
    for j = 0:9
        time(counter,1) = (i+j/10)/1200;
        counter = counter + 1;
    end
end
end