clear
clc
close all

[SENSOR,GT] = readLog();
% figure()
% hold on
% for i = 1:length(SENSOR.TIME)
%    plot(GT.TIME(i),norm([GT.AX(i) GT.AY(i) GT.AZ(i)]),'*'); 
% end

%checkGroundTruthAngularVelocity(GT);
%complementaryFilterAHRS(SENSOR,GT)
kalmanFilterAHRS(SENSOR,GT);
temp = 1;