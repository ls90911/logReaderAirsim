function [] = checkGroundTruthAngularVelocity(GT)
attitude = zeros(length(GT.TIME),3);
attitude_acc = zeros(length(GT.TIME),3);

for i = 1:length(GT.TIME)-1
    deltaT = GT.TIME(i+1)-GT.TIME(i);
    angularVelocity = [GT.P(i) GT.Q(i) GT.R(i)];
    phi = attitude(i,1);
    theta = attitude(i,2);
    psi = attitude(i,3);
    
    dTheta = [1 tan(theta)*sin(phi) tan(theta)*cos(phi);...
    0 cos(phi) -sin(phi);...
    0 sin(phi)/cos(theta) cos(phi)/cos(theta)]*angularVelocity';
    
    attitude(i+1,:) = attitude(i,:) + (dTheta*deltaT)';
    attitude_acc(i,1) = atan2(-GT.AY(i),-GT.AZ(i));
    attitude_acc(i,2) = atan2(GT.AX(i),sqrt(GT.AY(i)^2+GT.AZ(i)^2));
    
end

figure()
subplot(3,1,1)
hold on
grid on
plot(GT.TIME,GT.PHI/pi*180);
plot(GT.TIME,attitude(:,1)/pi*180);
plot(GT.TIME,attitude_acc(:,1)/pi*180);
ylabel('phi')

subplot(3,1,2)
hold on
grid on
plot(GT.TIME,GT.THETA/pi*180);
plot(GT.TIME,attitude(:,2)/pi*180);
plot(GT.TIME,attitude_acc(:,2)/pi*180);
ylabel('theta')

subplot(3,1,3)
hold on
grid on
plot(GT.TIME,GT.PSI/pi*180);
plot(GT.TIME,attitude(:,3)/pi*180);
ylabel('psi')

end