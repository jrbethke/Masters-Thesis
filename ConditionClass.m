% Subclass Brace
% Contains:
%   All values from participant class
%   BraceOrNB - value that determines the condition a subject completed.
%       If value is 0 = no brace, 1 = brace. Default is -1
%   CutPerf - value designating which cut was performed
%       1 = sidestep cut, 2 = crossover cut, 3 = run through default = 0
%   All properties have a default of zero. All variables are arrays except 
%   first two.
%   KneeMom - knee moment around the xyz axes
%   HipMom  - Hip moment around the xyz axes 
%   AnkleMom - Ankle moment around the xyz axes 
%   VertGroundReactForce - ground reaction force
%   vmoEmg - EMG activity of the vmo, vl, bf, semi
%   AntHip - marker location in three dimensional space of left/right ASIS
%   Each Property will have a function that can be called to change the 
%   value known as a set_____ with the desired number passed in

classdef ConditionClass < ParticipantClass
    properties
        DeviceFrames = 0;
        ModelFrames = 0;
        RKneeMom = 0;
        LKneeMom = 0;
        RKneeAngles = 0;
        LKneeAngles = 0;
        RHipMom = 0;
        LHipMom = 0;
        RAnkleMom = 0
        LAnkleMom = 0;
        GroundReactForce = 0;
        Emg = 0;
        RAntHip = 0;
        LAntHip = 0;
    end
    methods
    end
end
