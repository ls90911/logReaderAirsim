clear
clc
close all

[SENSOR,GT] = readLog();
figure
plot(SENSOR.AX,'*');
%checkGroundTruthAngularVelocity(GT);
% complementaryFilterAHRS(SENSOR,GT)
kalmanFilterAHRS(SENSOR,GT);
temp = 1;