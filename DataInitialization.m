% InitializeData
%
% Reads in csv file into matrix. Checks for the number of outputs in the
% file and indexes each output.
%
% Inputs:
% file - csv file containing data
% output - is used to go to the correct output i.e. device, joint, model,
% segment, trajectory. 1 for device, 2 for joint, 3 for model, 4 for
% segment, 5 for trajectory.
% variable - wanted measure that is being extracted. is the column header
% dataLengh- number of columns that was collected. 
% Outputs:
% data - data matrix of the csv file containing text and numbers
% outputArry - array of output indices 
function [data, outputArry] = DataInitialization (file)
% initializes data matrix, and output indicies
% initializes device, joint, model, segment, trajectory. Used to index row
device = 0; joint = 0; model = 0; segment = 0; trajectory = 0;
count = 0; % used to go through outputs
% Length of the outputs
% lengthDevice = 0; lengthJoint = 0; lengthModel = 0; lengthSegment = 0;
% lengthTrajectory = 0;

% inputs data from file into variable data. only numbers are in variable 
% matrix
file = char(file);
data = csvimport(file);

% gets length of file to set limit for the for loop
[dataRows, dataColumns] = size(data);
% gets the row each output starts at an stores it 
for i = 1:dataRows
    if(str2double(data{i,1}) == 1200 && strcmp(char(data{i-1,1}),'Devices'))
        device = i-1; % should always be one depending on output
        count = count + 1;
    end
    if(str2double(data{i,1}) == 120)
        if(count == 1 && strcmp(char(data{i-1,1}),'Joints'))
            joint = i-1;
            count = count+1;
        end
        if(count == 2 && strcmp(char(data{i-1,1}),'Model Outputs'))
            model = i-1;
            count = count+1;
        end
        if(count == 3 && strcmp(char(data{i-1,1}),'Segments'))
            segment = i-1;
            count = count+1;
        end
        if(count == 4 && strcmp(char(data{i-1,1}),'Trajectories'))
            trajectory = i-1;
        end
    end
end
% add somethings that displays how many outputs there are in csv file
% and which ones
outputArry = [device;joint;model;segment;trajectory];