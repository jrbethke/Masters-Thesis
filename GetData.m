% GetData
%
% Will grab data from a csv file for the passed in variable
% initially gets the length between outputs in a for loop 
% uses length in a for loop to grab data and store into an array
% Will convert NAN into 0 when grabbing data
%
% Inputs:
% participant - condition class
% data - array of all text and numeric data in csv file
% outputIndex - index of wanted output
% outputIndex1 - index of subsequent output
% variable - wanted measure that is being extracted. is the column header
% output - numbered for which output is wanted. 1,2,3... device, joint, model...  
% Outputs:
% dataArry - array/matrix of data taken from the file. double format

function [dataArry, DeviceFrames, ModelFrames] = GetData (data, outputIndex, outputIndex1, variable,output,file)
% Goes to column wanted data is in and stores it into the object
% data starts 5 rows below output index
[dataRows, dataColumns] = size(data);
% need to get data length 
index = getColumnHeader (outputIndex,variable,dataColumns,data);
if (index == 0)
    fprintf('Error in File: %s variable: %s \n',char(file),variable)
    Break
end

% needs work to make sure getting correct length of data
n = outputIndex + 5; % output is 5 rows above the start of data rows
if (~strcmp(variable,"Patient 12:RASI") && ~(strcmp(variable,"Patient 12:LASI")))
    dataLength = ((outputIndex1 - 1) - outputIndex) - 5; % 5 is for the difference between text and start of data 
else
    dataLength = dataRows - outputIndex - 5;
end

m = n+dataLength; % sets number of data rows
if (dataLength < 0)
    fprintf('Error in File: %s variable: %s \n',char(file),variable)
    BREAK
end
dataArry(dataLength,4) = 0; % 4 is the most data columns grabbed at one time
if (output == 3 && strcmp(variable,"Patient 12:LKneeMoment"))
    ModelFrames(dataLength,1) = 0;
else
    ModelFrames = 0;
end
if(output == 1 && strcmp(variable,"Imported Analog EMG - Voltage"))
    DeviceFrames(dataLength,1) = 0;
else
    DeviceFrames = 0;
end    
counter = 1;
for i = n:m % start at different points, needs to be changed
    %start of first data columns is below column header. more data is
    %grabbed pending device and variable
    if (isempty(data{i,index}))     
    else
        dataArry(counter,1) = str2double(data{i,index}); %row will change but column stays the same\
    end
    % if output is Device and wanted variable is EMG then all 4 channels
    % are extracted
    if (output == 1 && strcmp(variable,"Imported Analog EMG - Voltage"))
        DeviceFrames(i,1) = str2double(data{i,1});
        if (isempty(data{i,index+1}))    
        else
            dataArry(counter,2) = str2double(data{i,index+1});
        end
        if (isempty(data{i,index+2}))     
        else
            dataArry(counter,3) = str2double(data{i,index+2});
        end
        if (isempty(data{i,index+3}))    
        else
            dataArry(counter,4) = str2double(data{i,index+3});
        end
    end
    % if output is Device and wanted variable is GRF's then all 3
    % directions are extracted
    if(output == 1 && strcmp(variable,"FP 1 - Force"))
        if (isempty(data{i,index+1}))   
        else
            dataArry(counter,2) = str2double(data{i,index+1});
        end
        if (isempty(data{i,index+2}))    
        else
            dataArry(counter,3) = str2double(data{i,index+2});
        end
    end
    if(output == 3)
        ModelFrames(i,1) = str2double(data{i,1});
        if (isempty(data{i,index+1}))     
        else
            dataArry(counter,2) = str2double(data{i,index+1});
        end
        if (isempty(data{i,index+2}))    
        else
            dataArry(counter,3) = str2double(data{i,index+2});
        end
    end
    % work on this piece.
    if(output == 5 && strcmp('Patient 12:RASI', variable) || strcmp("Patient 12:LASI", variable))
        if (isempty(data{i,index+1}))    
        else
            dataArry(counter,2) = str2double(data{i,index+1});
        end
        if (isempty(data{i,index+2}))     
        else
            dataArry(counter,3) = str2double(data(i,index+2));
        end
    end
    counter = counter + 1;
end
end
