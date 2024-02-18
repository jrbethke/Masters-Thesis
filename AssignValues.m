function x = AssignValues(participant)
X1 = 7276;
X2 = 7535;
x = ConditionClass;
yx = RidNan(participant.ModelFrames(:,1));
y = participant.DeviceFrames(:,1);
t1 = shortenDeviceTime(y);
t = convertFrames2Time(yx);

x.RKneeMom = shortenArry(participant.RKneeMom,t,X1,X2);
x.RHipMom = shortenArry(participant.RHipMom,t,X1,X2);
x.RAnkleMom = shortenArry(participant.RAnkleMom,t,X1,X2);
x.Emg = shortenEmgArryTime(participant.Emg,t1,X1,X2);
x.RKneeAngles = shortenArry(participant.RKneeAngles,t,X1,X2);
x.ModelFrames = t;