clear
clc
close all

[SENSOR,GT] = readLog();
%checkGroundTruthAngularVelocity(GT);
 complementaryFilterAHRS(SENSOR,GT)
kalmanFilterAHRS(SENSOR,GT);
temp = 1;