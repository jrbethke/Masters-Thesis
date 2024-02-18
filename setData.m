% setData
%
% sets an objects properties to values passed in that were collected in
% getData function
% Inputs:
% participant
% data - matrix containing xyz or multiple channels or two marker locations
% variable - measure that was used to appropriately set the right dependent
% variable
% variable - wanted measure that is being extracted. is the column header
% dataLengh- number of columns that was collected.

%% setting data is wrong. needs to be passed in straight to variable. no need for
% the function also configure a way to make an array for the TrialNUm to
% index array for data.

function participant = setData(participant,data,variable)
if (strcmp(variable,"Patient 12:LKneeMoment"))
    participant.LKneeMom = data;
end
if (strcmp(variable,"Patient 12:RKneeMoment"))
    participant.RKneeMom = data;
end
if (strcmp(variable,"Patient 12:LKneeAngles"))
    participant.LKneeAngles = data;
end
if (strcmp(variable,"Patient 12:RKneeAngles"))
    participant.RKneeAngles = data;
end
if (strcmp(variable,"Patient 12:RHipMoment"))
    participant.RHipMom = data;
end
if (strcmp(variable,"Patient 12:LHipMoment"))
    participant.LHipMom = (data);
end
if (strcmp(variable,"Patient 12:LAnkleMoment"))
    participant.LAnkleMom = (data);
end
if (strcmp(variable,"Patient 12:RAnkleMoment"))
    participant.RAnkleMom  =(data);
end
if (strcmp(variable,"FP 1 - Force"))
    participant.GroundReactForce = (data);
end
if (strcmp(variable,"Imported Analog EMG - Voltage"))
    participant.Emg = (data);
end
if (strcmp(variable,"Patient 12:LASI"))
    participant.LAntHip = (data);
end
if (strcmp(variable,"Patient 12:RASI"))
    participant.RAntHip = (data);
end
end