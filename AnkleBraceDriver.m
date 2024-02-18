% AnkleBraceDriver file
%
% Main file that will call functions to initialize a data file. Grabs the
% file to be read from a txt file as well as read in what measure is to
% be read in (also from txt file) from the csv file. Following process is exporting data
% to a data matrix that is then used to set the dependent measures.

% Can only run one participant at a time. Update the ColumnHeaders.txt and
% the ParticipantDataFiles.txt for each participant so correct string
% arrays are used in function getColumnHeader


function Participant = AnkleBraceDriver
%part that stores each file name into an array
% fid = fopen('ParticipantDataFiles.txt');
list = textread('ParticipantDataFiles.txt', '%s');
CharList = string(list);
numFiles = size(list);
Device = 1; Model = 3; Trajectory = 5;
%part that reads one by one the data files

%part that stores each column header name similarly to above
Headers = textread('ColumnHeaders.txt','%q');
numVar = size(Headers);
Headers = string(Headers);
participant(numFiles,1) = ConditionClass;
% this needs a lot of work
for i = 1:numFiles
    tic
    chArry = char(CharList(i));
    % trial files are arranged 'AB(FI)(LI)0102.csv' so characters 5 and 6 are
    % subject number. characters 7 and 8 are trial number
%     ch1 = chArry(5); ch2 = chArry(6); 
    ch3 = chArry(7); ch4 = chArry(8);
    % concenate the characters so 0 and 1 becomes 01
    % opens the data file and reads it into a matrix. Index's each output's
    % cell and returns the data matrix and the output locations
    [data, outputArry] = DataInitialization(list(i));
    for j = 1:numVar
        if (strcmp(Headers(j),"Patient 12:LKneeMoment"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
            participant(i).ModelFrames = ModelFrames;
        elseif(strcmp(Headers(j),"Patient 12:RKneeMoment"))
           [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        end
        if (strcmp(Headers(j),"Patient 12:LKneeAngles"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
            participant(i).ModelFrames = ModelFrames;
        elseif(strcmp(Headers(j),"Patient 12:RKneeAngles"))
           [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        end
        if (strcmp(Headers(j),"Patient 12:LHipMoment"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        elseif(strcmp(Headers(j),"Patient 12:RHipMoment"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        end
        if (strcmp(Headers(j),"Patient 12:LAnkleMoment"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        elseif (strcmp(Headers(j),"Patient 12:RAnkleMoment"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(3),outputArry(4),Headers(j),Model,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));    
        end
        if (strcmp(Headers(j),"FP 1 - Force"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(1),outputArry(2),Headers(j),Device,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        end
        if (strcmp(Headers(j),"Imported Analog EMG - Voltage"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(1),outputArry(2),Headers(j),Device,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
            participant(i).DeviceFrames = DeviceFrames;
        end
        if (strcmp(Headers(j),"Patient 12:LASI"))
            [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(5),outputArry(4),Headers(j),Trajectory,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        elseif (strcmp(Headers(j),"Patient 12:RASI"))
           [dataArry, DeviceFrames, ModelFrames] = GetData(data,outputArry(5),outputArry(4),Headers(j),Trajectory,list(i));
            participant(i) = setData(participant(i),dataArry,Headers(j));
        end
    end
    stri = char(list(i));
    fprintf('Finshed file: %s \n',stri)
    toc
end
Participant = participant;
end

