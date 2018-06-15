function [SENSOR,GT] = readLog()

FIGURE = 1;

sensor = csvread("log_drone.csv",2,0);

firstGateDistance = 14.5;

timeStamp = sensor(1,1);
for i = 1:size(sensor,1)
   sensor(i,1) = (sensor(i,1)-timeStamp)/1000; 
end

SENSOR.TIME = sensor(:,1);
SENSOR.AX = sensor(:,2);
SENSOR.AY = sensor(:,3);
SENSOR.AZ = sensor(:,4);
SENSOR.P = sensor(:,5);
SENSOR.Q = sensor(:,6);
SENSOR.R = sensor(:,7);
SENSOR.PHI = sensor(:,8);
SENSOR.THETA = sensor(:,9);
SENSOR.PSI = sensor(:,10);
SENSOR.X = sensor(:,11)+firstGateDistance;
SENSOR.Y = sensor(:,12);
SENSOR.Z = sensor(:,13);

gt = csvread("log_model.csv",1,0);
timeStamp = gt(1,1);

for i = 1:size(gt,1)
   gt(i,1) = (gt(i,1)-timeStamp)/1000; 
end

GT.TIME = gt(:,1);
GT.X = gt(:,2);
GT.Y = gt(:,3);
GT.Z = gt(:,4);
GT.VX = gt(:,5);
GT.VY = gt(:,6);
GT.VZ = gt(:,7);
GT.PHI = gt(:,8);
GT.THETA = gt(:,9);
GT.PSI = gt(:,10);
GT.P = gt(:,11);
GT.Q = gt(:,12);
GT.R = gt(:,13);

if FIGURE == 1
figure(1)
subplot(3,1,1)
plot(SENSOR.TIME,SENSOR.X,'*');
hold on
grid on
plot(GT.TIME,GT.X);
ylabel('x [m]');
subplot(3,1,2)
plot(SENSOR.TIME,SENSOR.Y,'*');
hold on
grid on
plot(GT.TIME,GT.Y);
ylabel('y [m]');
subplot(3,1,3)
plot(SENSOR.TIME,SENSOR.Z,'*');
hold on
grid on
plot(GT.TIME,GT.Z);
ylabel('z [m]');

figure(2)
subplot(3,1,1)
plot(SENSOR.TIME,SENSOR.P/pi*180,'*');
hold on
grid on
plot(GT.TIME,GT.P/pi*180);
ylabel('p [deg/s]');
subplot(3,1,2)
plot(SENSOR.TIME,SENSOR.Q/pi*180,'*');
hold on
grid on
plot(GT.TIME,GT.Q/pi*180);
ylabel('q [deg/s]');
subplot(3,1,3)
plot(SENSOR.TIME,SENSOR.R/pi*180,'*');
hold on
grid on
plot(GT.TIME,GT.R/pi*180);
ylabel('r [deg/s]');

figure(3)
subplot(3,1,1)
plot(SENSOR.TIME,SENSOR.PHI/pi*180);
hold on
grid on
plot(GT.TIME,GT.PHI/pi*180);
ylabel('phi [deg]');
subplot(3,1,2)
plot(SENSOR.TIME,SENSOR.THETA/pi*180);
hold on
grid on
plot(GT.TIME,GT.THETA/pi*180);
ylabel('theta [deg]');
subplot(3,1,3)
plot(SENSOR.TIME,SENSOR.PSI/pi*180);
hold on
grid on
plot(GT.TIME,GT.PSI/pi*180);
ylabel('psi [deg]');
end
temp = 1;

end