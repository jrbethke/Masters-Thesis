function [shortend] = shortenEmgArryTime(Data,time,X1,X2)

% plots the data to check for irregularity
[m,n] = size(Data);
counter = 1;
IC = 0; PO = 0; temp1 = 0; temp2 = 0; temp3 = 0; temp4 = 0;
for i = 1:m-1
     temp1 = abs(time(i,1) - X1);
     temp2 = abs(time(i,1) - X2);
     if (i < m-1)
        temp3 = abs(time(i+1,1) - X1);
        temp4 = abs(time(i+1,1) - X2);
     end
     if (i ~= 0 && temp1 > temp3)
         IC = i;
     end
     if (i ~= 0 && temp2 > temp4)
         PO = i;
     end
end
if (IC == 0)
    IC = IC + 1;
end
x = IC - PO;
shortend(x,n) = 0;         
for j = X1:X2
    for i = 1:n
        shortend(counter,i) = Data(j,i);
    end
    counter = counter + 1;
end
end
       