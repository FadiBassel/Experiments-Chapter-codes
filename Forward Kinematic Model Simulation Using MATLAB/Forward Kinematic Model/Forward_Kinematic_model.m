% This file takes as inputs the value of relative joint angles q, angular velocities qdot and angular
%accelerations qDdot of the links. It then calculates the values of absolute joint angles theta 
%with respect to the x-axis. Also it takes as inputs the 
%initial conditions of base link, and outputs the position, velocity and
%acceleration of the end effector.

%initial conditions of base link
X0 = 0;
Xdot0 = 0;
XDdot0 = 0;
Y0 = 0;
Ydot0 = 0;
YDdot0 = 0;

% variables needed for calculations
f1 = 0;
f2 = 0;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;
f7 = 0;
f8 = 0;

l = 0.088; % length (assumed constant for all links)
d = 0.035; % distance of CM of links (assumed constant for all links)

% input relative joint angles for all links
q1 = 1.0e+04 *1.8863;
q2 = 1.0e+04 *-0.1429;
q3 = 1.0e+04 *-0.2074;
q4 = 1.0e+04 *-0.0235;
q5 = 1.0e+04 *0.1560;
q6 = 1.0e+04 *0.0828;
q7 = 1.0e+04 *0.0426;
q8 = 1.0e+04 *-0.3573;
q9 = 1.0e+04 *-0.2913;
q10 = 1.0e+04 *-0.1481;
q11 = 1.0e+04 *0.1017;
q12 = 1.0e+04 *-0.0027;

% input relative angular velocities qdot for all links
qdot1 = 0;
qdot2 = 0;
qdot3 = 0;
qdot4 = 0;
qdot5 = 0;
qdot6 = 0;
qdot7 = 0;
qdot8 = 0;
qdot9 = 0;
qdot10 = 0;
qdot11 = 0;
qdot12 = 0;

% input relative angular acceleration qDdot for all links
qDdot1 = 0;
qDdot2 = 0;
qDdot3 = 0;
qDdot4 = 0;
qDdot5 = 0;
qDdot6 = 0;
qDdot7 = 0;
qDdot8 = 0;
qDdot9 = 0;
qDdot10 = 0;
qDdot11 = 0;
qDdot12 = 0;

q = [q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12];
qdot = [qdot1 qdot2 qdot3 qdot4 qdot5 qdot6 qdot7 qdot8 qdot9 qdot10 qdot11 qdot12];
qDdot = [qDdot1 qDdot2 qDdot3 qDdot4 qDdot5 qDdot6 qDdot7 qDdot8 qDdot9 qDdot10 qDdot11 qDdot12];
theta13 = 45;
thetadot13 = 0;
thetaDdot13 = 0;

theta = [0 0 0 0 0 0 0 0 0 0 0 0]; %initialize a matrix for the absolute joint angles
thetadot = [0 0 0 0 0 0 0 0 0 0 0 0]; %initialize a matrix for the absolute joint velocities
thetaDdot = [0 0 0 0 0 0 0 0 0 0 0 0]; %initialize a matrix for the absolute joint accelerations

for i = 1:12
   qSum = 0;
   for n = i:12
      qSum = qSum + q(n); 
   end    
   theta(i) =  qSum + theta13; %calculate each absolute joint angle using the relative one 
end

for i = 1:12
   qdotSum = 0;
   for n = i:12
      qdotSum = qdotSum + qdot(n); 
   end    
   thetadot(i) =  qdotSum + thetadot13; %calculate each absolute velocity using the relative one 
end

for i = 1:12
   qDdotSum = 0;
   for n = i:12
      qDdotSum = qDdotSum + qDdot(n); 
   end    
   thetaDdot(i) =  qDdotSum + thetaDdot13; %calculate each absolute accleration using the relative one 
end


for j = 1:12
    f1 = f1 + cosd(theta(j));
end

X13 = X0 + l*f1 + d*cosd(theta13);
disp(X13) % displays the position of end-effector in x-axis

for j = 1:12
    f2 = f2 + sind(theta(j));
end
Y13 = Y0 + l*f2 + d*sind(theta13);
disp(Y13) % displays the position of end-effector in y-axis


for j = 1:12
    f3 = f3 + (thetadot(j)*sind(theta(j)));
end
Xdot13 = Xdot0 - l*f3 - d*thetadot13*sind(theta13);
disp(Xdot13) % displays the velocity of end-effector in x-axis

for j = 1:12
    f4 = f4 + (thetadot(j)*cosd(theta(j)));
end
Ydot13 = Ydot0 + l*f4 + d*thetadot13*cosd(theta13);
disp(Ydot13) % displays the velocity of end-effector in y-axis


for j = 1:12
    f5 = f5 + (thetadot(j)*thetaDdot(j)*sind(theta(j)));
end
for j = 1:11
    f6 = f6 + (thetadot(j)*thetadot(j)*cosd(theta(j)));
end
XDdot13 = XDdot0 - l*f5 - l*f6 - d*thetaDdot13*sind(theta13) - d*theta13*theta13*cosd(theta13);
disp(XDdot13) % displays the acceleration of end-effector in x-axis


for j = 1:12
    f7 = f7 + (thetadot(j)*thetaDdot(j)*cosd(theta(j)));
end
for j = 1:11
    f8 = f8 + (thetadot(j)*thetadot(j)*sind(theta(j)));
end
YDdot13 = YDdot0 + l*f7 - l*f8 + d*thetaDdot13*cosd(theta13) + d*theta13*theta13*sind(theta13);
disp(YDdot13) % displays the acceleration of end-effector in y-axis

