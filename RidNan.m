% pass in variable to get rid of NaN/0
function y = RidNan(x)


[row, col] = size(x);
y = 0;
% if (col > row && row == 1)
%     x = x';
% elseif (row > col && col ~= 1)
%     disp('variable input is a matrix, not a vector')
%     stop
% end
[row, col] = size(x);
% y = x;
counter = 1;
for i = 1:row
    if ((x(i,1) ~= 0))
        y(counter, 1) = x(i,1);
        counter = counter + 1;
    end
end


% for i = 1:r
%     y = delRow(x,indexNaN(i,1));
%     indexNaN = indexNaN - 1;
% end
