% Get columnHeader
%
% Uses a passed in string to compare cell value for wanted variable 
% opens data file using csvimport and iterates check until variable is found
% or number of columns is reached to return the index of where the output
% starts
%
%Inputs:
% output - is used to go to the correct output cell i.e. device, joint, model...
% colHeader - string with wanted columnHeader
% numColumns - number of columns in the data matrix
% dataArry - array of all text and numeric data in csv file
%Outputs:
% variable - the wanted column header

function [variable] = getColumnHeader (output,colHeader,numColumns,dataArry)
output = output+2; % column headers are two rows below the output string
done = 1;
variable = 0;
for i  = output:output % only one iteration
    for j = 1:numColumns
        if (strcmp(char(dataArry(i,j)),colHeader) && done)
            variable = j;
            done = 0;     
        end
    end
end
% if(strcmp('NaN',variable))
%     fprintf('No variable name exists')
% end

end