% Super class Participant
% Contains:
%   TrialNumber - default is zero
%   Age - default is zero
%   Height - default is zero
%   Weight - default is zero
%   Each Property will have a function that can be called to change the 
%   value known as a set_____ with the desired number passed in

classdef ParticipantClass
    properties
        TrialNumber = 0;
        Age = 0;
        Height = 0;
        Weight = 0;
    end
    methods
        function TrialNumber  = setTrialNumber(trial)
            TrialNumber = trial;
        end
        function Age  = setAge (years)
            Age = years;
        end
        function Height = setHeight (cm)
            Height = cm;
        end
        function Weight = setWeight (kg)
            Weight = kg;
        end
    end
end
    
        
        
        