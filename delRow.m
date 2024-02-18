% deletes a row

function x = delRow(x,n)
% needs to either be a column vector or a row vector but will output a 
% column vector
% x is array and is returned
% n is row number to be deleted

[row, col] = size(x);
%fprintf('Row is size: %1.0f and column is size: %1.0f \n', row, col)
TempX = 0;
TempY = 0;

if (col > row && row == 1)
    x = x';
elseif (row > col && col ~= 1)
    disp('variable input is a matrix, not a vector')
    stop
end

for i = 1:n-1
    TempX(i,1) = x(i,1);
end
counter = 1; % if i is used at index will not start at one for vector
for i = n+1:row
    TempY(counter,1) = x(i,1);
    counter = counter + 1;
end

if (TempX == 0)
    x = TempY;
elseif (TempY == 0)
    x = TempX;
else
x = [TempX; TempY];
end
return;





