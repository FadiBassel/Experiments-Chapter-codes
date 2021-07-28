% This file takes as input the absolute values of joint angle, angular velocity and angular
%acceleration of the links with respect to the x-axis, and outputs the
%values of torque supplied to each joint.

global m
m = 0.042; % mass (assumed constant for all links)
global l
l = 0.088; % length (assumed constant for all links)
global d
d = 0.035; % distance of CM of links (assumed constant for all links)

g = 9.81;
fx = 0.5; %friction force (assumed constant for all links)
Ny = 0.4; %supporting force (assumed constant for all links)
I = 0.014; % moment of inertia based on SolidWorks design (assumed constant for all links)

%inputs: as per the inverse dynamic model, it is required to enter
%instantaneous relative angles and their derivatives along with the initial
%conditions, so I wrote this part of code to do it and calculate the values of theta, thetadot and thetaDdot acoordingly.
%But if you want to use this method, please uncomment lines 22 to 51 and
%comment lines 54 to 131 and replace every theta13 with theta(13).
% E = [0 0 0 0 0 0 0 0 0 0 0 0;
%      1 0 0 0 0 0 0 0 0 0 0 0;
%      1 1 0 0 0 0 0 0 0 0 0 0;
%      1 1 1 0 0 0 0 0 0 0 0 0;
%      1 1 1 1 0 0 0 0 0 0 0 0;
%      1 1 1 1 1 0 0 0 0 0 0 0;
%      1 1 1 1 1 1 0 0 0 0 0 0;
%      1 1 1 1 1 1 1 0 0 0 0 0;
%      1 1 1 1 1 1 1 1 0 0 0 0;
%      1 1 1 1 1 1 1 1 1 0 0 0;
%      1 1 1 1 1 1 1 1 1 1 0 0;
%      1 1 1 1 1 1 1 1 1 1 1 0];
% e = [1 1 1 1 1 1 1 1 1 1 1 1];
% THETA1 = 0;
% THETAdot1 = 0;
% THETADdot1 = 0;
% phi = [0 0 0 0 0 0 0 0 0 0 0 0]; %input phi
% phidot = [0 0 0 0 0 0 0 0 0 0 0 0]; %input phidot
% phiDdot = [0 0 0 0 0 0 0 0 0 0 0 0]; %input phiDdot
% THETA = E*phi + e*THETA1;
% THETAdot = E*phidot + e*THETAdot1;
% THETADdot = E*phiDdot + e*THETADdot1;
% global theta
% theta = [THETA1 THETA(1) THETA(2) THETA(3)  THETA(4) THETA(5) THETA(6) THETA(7) THETA(8) THETA(9) THETA(10) THETA(11)];
% global thetadot
% thetadot = [THETAdot1 THETAdot(1) THETAdot(2) THETAdot(3) THETAdot(4)
% THETAdot(5) THETAdot(6) THETAdot(7) THETAdot(8) THETAdot(9) THETAdot(10) THETAdot(11)];
% global thetaDdot
% thetaDdot = [THETADdot1 THETADdot(1) THETADdot(2) THETADdot(3) THETADdot(4)
% THETADdot(5) THETADdot(6) THETADdot(7) THETADdot(8) THETADdot(9) THETADdot(10) THETADdot(11)];

% input q vector for all links
q1 = 10;
q2 = 20;
q3 = 30;
q4 = 40;
q5 = 50;
q6 = 60;
q7 = 70;
q8 = 80;
q9 = 70;
q10 = 60;
q11 = 50;
q12 = 40;

% input qdot vector for all links
qdot1 = 0.1;
qdot2 = 0.2;
qdot3 = 0.3;
qdot4 = 0.4;
qdot5 = 0.5;
qdot6 = 0.6;
qdot7 = 0.2;
qdot8 = 0.115;
qdot9 = 0.43;
qdot10 = 0.65;
qdot11 = 0.4;
qdot12 = 0;

% input q double dot vector for all links
qDdot1 = 0.05;
qDdot2 = 0.06;
qDdot3 = 0.04;
qDdot4 = 0.045;
qDdot5 = 0.034;
qDdot6 = 0.025;
qDdot7 = 0.046;
qDdot8 = 0.087;
qDdot9 = 0.098;
qDdot10 = 0.076;
qDdot11 = 0.086;
qDdot12 = 0.095;

q = [q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12];
qdot = [qdot1 qdot2 qdot3 qdot4 qdot5 qdot6 qdot7 qdot8 qdot9 qdot10 qdot11 qdot12];
qDdot = [qDdot1 qDdot2 qDdot3 qDdot4 qDdot5 qDdot6 qDdot7 qDdot8 qDdot9 qDdot10 qDdot11 qDdot12];
theta13 = 0;
thetadot13 = 0;
thetaDdot13 = 0;

global theta
global thetadot
global thetaDdot
theta = [0 0 0 0 0 0 0 0 0 0 0 0 theta13];
thetadot = [0 0 0 0 0 0 0 0 0 0 0 0 thetadot13];
thetaDdot = [0 0 0 0 0 0 0 0 0 0 0 0 thetaDdot13];

for i = 1:12
   qSum = 0;
   for n = i:12
      qSum = qSum + q(n); 
   end    
   theta(i) =  qSum + theta13;
end

for i = 1:12
   qdotSum = 0;
   for n = i:12
      qdotSum = qdotSum + qdot(n); 
   end    
   thetadot(i) =  qdotSum + thetadot13;
end

for i = 1:12
   qDdotSum = 0;
   for n = i:12
      qDdotSum = qDdotSum + qDdot(n); 
   end    
   thetaDdot(i) =  qDdotSum + thetaDdot13;
end

QDdot = [thetaDdot(1);
         thetaDdot(2);
         thetaDdot(3);
         thetaDdot(4);
         thetaDdot(5);
         thetaDdot(6);
         thetaDdot(7);
         thetaDdot(8);
         thetaDdot(9);
         thetaDdot(10);
         thetaDdot(11);
         thetaDdot(12);
         theta13;
         XDdot0;
         YDdot0];
    %calculates the elements of the inertia matrix M
     M = [I+m*d^2+l*l*12*m (m*d*l+ 11*m*l*l)*cos(theta(1)-theta(2)) (m*d*l+ 10*m*l*l)*cos(theta(1)-theta(3)) (m*d*l+ 9*m*l*l)*cos(theta(1)-theta(4)) (m*d*l+ 8*m*l*l)*cos(theta(1)-theta(5)) (m*d*l+ 7*m*l*l)*cos(theta(1)-theta(6)) (m*d*l+ 6*m*l*l)*cos(theta(1)-theta(7)) (m*d*l+ 5*m*l*l)*cos(theta(1)-theta(8)) (m*d*l+ 4*m*l*l)*cos(theta(1)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(1)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(1)-theta(11)) (m*d*l + m*l*l)*cos(theta(1)-theta(12)) (m*d*l)*cos(theta(1)-theta13) -sind(theta(1))*(m*d + 12*l) cosd(theta(1))*(m*d + 12*l);
          (m*d*l+ 11*m*l*l)*cos(theta(1)-theta(2)) I+m*d^2+l*l*11*m (m*d*l+ 10*m*l*l)*cos(theta(2)-theta(3)) (m*d*l+ 9*m*l*l)*cos(theta(2)-theta(4)) (m*d*l+ 8*m*l*l)*cos(theta(2)-theta(5)) (m*d*l+ 7*m*l*l)*cos(theta(2)-theta(6)) (m*d*l+ 6*m*l*l)*cos(theta(2)-theta(7)) (m*d*l+ 5*m*l*l)*cos(theta(2)-theta(8)) (m*d*l+ 4*m*l*l)*cos(theta(2)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(2)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(2)-theta(11)) (m*d*l + m*l*l)*cos(theta(2)-theta(12)) (m*d*l)*cos(theta(2)-theta13) -sind(theta(2))*(m*d + 11*l) cosd(theta(2))*(m*d + 11*l);
          (m*d*l+ 10*m*l*l)*cos(theta(1)-theta(3)) (m*d*l+ 10*m*l*l)*cos(theta(2)-theta(3)) I+m*d^2+l*l*10*m (m*d*l+ 9*m*l*l)*cos(theta(3)-theta(4)) (m*d*l+ 8*m*l*l)*cos(theta(3)-theta(5)) (m*d*l+ 7*m*l*l)*cos(theta(3)-theta(6)) (m*d*l+ 6*m*l*l)*cos(theta(3)-theta(7)) (m*d*l+ 5*m*l*l)*cos(theta(3)-theta(8)) (m*d*l+ 4*m*l*l)*cos(theta(3)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(3)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(3)-theta(11)) (m*d*l + m*l*l)*cos(theta(3)-theta(12)) (m*d*l)*cos(theta(3)-theta13) -sind(theta(3))*(m*d + 10*l) cosd(theta(3))*(m*d + 10*l);
          (m*d*l+ 9*m*l*l)*cos(theta(1)-theta(4)) (m*d*l+ 9*m*l*l)*cos(theta(2)-theta(4)) (m*d*l+ 9*m*l*l)*cos(theta(3)-theta(4)) I+m*d^2+l*l*9*m (m*d*l+ 8*m*l*l)*cos(theta(4)-theta(5)) (m*d*l+ 7*m*l*l)*cos(theta(4)-theta(6)) (m*d*l+ 6*m*l*l)*cos(theta(4)-theta(7)) (m*d*l+ 5*m*l*l)*cos(theta(4)-theta(8)) (m*d*l+ 4*m*l*l)*cos(theta(4)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(4)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(4)-theta(11)) (m*d*l + m*l*l)*cos(theta(4)-theta(12)) (m*d*l)*cos(theta(4)-theta13) -sind(theta(4))*(m*d + 9*l) cosd(theta(4))*(m*d + 9*l);
          (m*d*l+ 8*m*l*l)*cos(theta(1)-theta(5)) (m*d*l+ 8*m*l*l)*cos(theta(2)-theta(5)) (m*d*l+ 8*m*l*l)*cos(theta(3)-theta(5)) (m*d*l+ 8*m*l*l)*cos(theta(4)-theta(5)) I+m*d^2+l*l*8*m (m*d*l+ 7*m*l*l)*cos(theta(5)-theta(6)) (m*d*l+ 6*m*l*l)*cos(theta(5)-theta(7)) (m*d*l+ 5*m*l*l)*cos(theta(5)-theta(8)) (m*d*l+ 4*m*l*l)*cos(theta(5)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(5)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(5)-theta(11)) (m*d*l + m*l*l)*cos(theta(5)-theta(12)) (m*d*l)*cos(theta(5)-theta13) -sind(theta(5))*(m*d + 8*l) cosd(theta(5))*(m*d + 8*l);
          (m*d*l+ 7*m*l*l)*cos(theta(1)-theta(6)) (m*d*l+ 7*m*l*l)*cos(theta(2)-theta(6)) (m*d*l+ 7*m*l*l)*cos(theta(3)-theta(6)) (m*d*l+ 7*m*l*l)*cos(theta(4)-theta(6)) (m*d*l+ 7*m*l*l)*cos(theta(5)-theta(6)) I+m*d^2+l*l*7*m (m*d*l+ 6*m*l*l)*cos(theta(6)-theta(7)) (m*d*l+ 5*m*l*l)*cos(theta(6)-theta(8)) (m*d*l+ 4*m*l*l)*cos(theta(6)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(6)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(6)-theta(11)) (m*d*l + m*l*l)*cos(theta(6)-theta(12)) (m*d*l)*cos(theta(6)-theta13) -sind(theta(6))*(m*d + 7*l) cosd(theta(6))*(m*d + 7*l);
          (m*d*l+ 6*m*l*l)*cos(theta(1)-theta(7)) (m*d*l+ 6*m*l*l)*cos(theta(2)-theta(7)) (m*d*l+ 6*m*l*l)*cos(theta(3)-theta(7)) (m*d*l+ 6*m*l*l)*cos(theta(4)-theta(7)) (m*d*l+ 6*m*l*l)*cos(theta(5)-theta(7)) (m*d*l+ 6*m*l*l)*cos(theta(6)-theta(7)) I+m*d^2+l*l*6*m (m*d*l+ 5*m*l*l)*cos(theta(7)-theta(8)) (m*d*l+ 4*m*l*l)*cos(theta(7)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(7)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(7)-theta(11)) (m*d*l + m*l*l)*cos(theta(7)-theta(12)) (m*d*l)*cos(theta(7)-theta13) -sind(theta(7))*(m*d + 6*l) cosd(theta(7))*(m*d + 6*l);
          (m*d*l+ 5*m*l*l)*cos(theta(1)-theta(8)) (m*d*l+ 5*m*l*l)*cos(theta(2)-theta(8)) (m*d*l+ 5*m*l*l)*cos(theta(3)-theta(8)) (m*d*l+ 5*m*l*l)*cos(theta(4)-theta(8)) (m*d*l+ 5*m*l*l)*cos(theta(5)-theta(8)) (m*d*l+ 5*m*l*l)*cos(theta(6)-theta(8)) (m*d*l+ 5*m*l*l)*cos(theta(7)-theta(8)) I+m*d^2+l*l*5*m (m*d*l+ 4*m*l*l)*cos(theta(8)-theta(9)) (m*d*l+ 3*m*l*l)*cos(theta(8)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(8)-theta(11)) (m*d*l + m*l*l)*cos(theta(8)-theta(12)) (m*d*l)*cos(theta(8)-theta13) -sind(theta(8))*(m*d + 5*l) cosd(theta(8))*(m*d + 5*l);
          (m*d*l+ 4*m*l*l)*cos(theta(1)-theta(9)) (m*d*l+ 4*m*l*l)*cos(theta(2)-theta(9)) (m*d*l+ 4*m*l*l)*cos(theta(3)-theta(9)) (m*d*l+ 4*m*l*l)*cos(theta(4)-theta(9)) (m*d*l+ 4*m*l*l)*cos(theta(5)-theta(9)) (m*d*l+ 4*m*l*l)*cos(theta(6)-theta(9)) (m*d*l+ 4*m*l*l)*cos(theta(7)-theta(9)) (m*d*l+ 4*m*l*l)*cos(theta(8)-theta(9)) I+m*d^2+l*l*4*m (m*d*l+ 3*m*l*l)*cos(theta(9)-theta(10)) (m*d*l+ 2*m*l*l)*cos(theta(9)-theta(11)) (m*d*l + m*l*l)*cos(theta(9)-theta(12)) (m*d*l)*cos(theta(9)-theta13) -sind(theta(9))*(m*d + 4*l) cosd(theta(9))*(m*d + 4*l);
          (m*d*l+ 3*m*l*l)*cos(theta(1)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(2)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(3)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(4)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(5)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(6)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(7)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(8)-theta(10)) (m*d*l+ 3*m*l*l)*cos(theta(9)-theta(10)) I+m*d^2+l*l*3*m (m*d*l+ 2*m*l*l)*cos(theta(10)-theta(11)) (m*d*l + m*l*l)*cos(theta(10)-theta(12)) (m*d*l)*cos(theta(10)-theta13) -sind(theta(10))*(m*d + 3*l) cosd(theta(10))*(m*d + 3*l);
          (m*d*l+ 2*m*l*l)*cos(theta(1)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(2)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(3)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(4)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(5)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(6)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(7)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(8)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(9)-theta(11)) (m*d*l+ 2*m*l*l)*cos(theta(10)-theta(11)) I+m*d^2+l*l*2*m (m*d*l + m*l*l)*cos(theta(11)-theta(12)) (m*d*l)*cos(theta(11)-theta13) -sind(theta(11))*(m*d + 2*l) cosd(theta(11))*(m*d + 2*l);
          (m*d*l+ 1*m*l*l)*cos(theta(1)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(2)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(3)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(4)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(5)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(6)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(7)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(8)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(9)-theta(12)) (m*d*l+ 1*m*l*l)*cos(theta(10)-theta(12)) (m*d*l + m*l*l)*cos(theta(11)-theta(12)) I+m*d^2+l*l*1*m (m*d*l)*cos(theta(12)-theta13) -sind(theta(12))*(m*d + 2*l) cosd(theta(12))*(m*d + 2*l);
          (m*d*l+ 0*m*l*l)*cos(theta(1)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(2)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(3)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(4)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(5)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(6)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(7)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(8)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(9)-theta13) (m*d*l+ 0*m*l*l)*cos(theta(10)-theta13) (m*d*l)*cos(theta(11)-theta13) (m*d*l)*cos(theta(12)-theta13) I+m*d^2+l*l*0*m -sind(theta13)*(m*d + 0*l) cosd(theta13)*(m*d + 0*l);
          -sind(theta(1))*(m*d + 12*l) -sind(theta(2))*(m*d + 11*l) -sind(theta(3))*(m*d + 10*l) -sind(theta(4))*(m*d + 9*l) -sind(theta(5))*(m*d + 8*l) -sind(theta(6))*(m*d + 7*l) -sind(theta(7))*(m*d + 6*l) -sind(theta(8))*(m*d + 5*l) -sind(theta(9))*(m*d + 4*l) -sind(theta(10))*(m*d + 3*l) -sind(theta(11))*(m*d + 2*l) -sind(theta(12))*(m*d + 1*l) -sind(theta13)*(m*d + 0*l) 13*m 0;
          cosd(theta(1))*(m*d + 12*l) cosd(theta(2))*(m*d + 11*l) cosd(theta(3))*(m*d + 10*l) cosd(theta(4))*(m*d + 9*l) cosd(theta(5))*(m*d + 8*l) cosd(theta(6))*(m*d + 7*l) cosd(theta(7))*(m*d + 6*l) cosd(theta(8))*(m*d + 5*l) cosd(theta(9))*(m*d + 4*l) cosd(theta(10))*(m*d + 3*l) cosd(theta(11))*(m*d + 2*l) cosd(theta(12))*(m*d + 1*l) cosd(theta13)*(m*d + 0*l) 0 13*m];
 
 % calculates the centrifugal and coriolos terms
 H = [l*F1(1);
      l* F1(2) + F2(2);
      l* F1(3) + F2(3);
      l* F1(4) + F2(4);
      l* F1(5) + F2(5);
      l* F1(6) + F2(6);
      l* F1(7) + F2(7);
      l* F1(8) + F2(8);
      l* F1(9) + F2(9);
      l* F1(10) + F2(10);
      l* F1(11) + F2(11);
      l* F1(12) + F2(12);
      l* F1(13) + F2(13);
      F3;
      F4];
  
  % calculates the friction forces matrix
  F = [l*sind(theta(1))*12*fx;
      l*sind(theta(2))*11*fx;
      l*sind(theta(3))*10*fx;
      l*sind(theta(4))*9*fx;
      l*sind(theta(5))*8*fx;
      l*sind(theta(6))*7*fx;
      l*sind(theta(7))*6*fx;
      l*sind(theta(8))*5*fx;
      l*sind(theta(9))*4*fx;
      l*sind(theta(10))*3*fx;
      l*sind(theta(11))*2*fx;
      l*sind(theta(12))*1*fx;
      0;
      -13*fx;
      0];
  
  % calculates the potential energy matrix
  G = [cos(theta(1))*(m*d + sind(theta(1))*12*l)*g;
       cos(theta(2))*(m*d + sind(theta(2))*11*l)*g;
       cos(theta(3))*(m*d + sind(theta(3))*10*l)*g;
       cos(theta(4))*(m*d + sind(theta(4))*9*l)*g;
       cos(theta(5))*(m*d + sind(theta(5))*8*l)*g;
       cos(theta(6))*(m*d + sind(theta(6))*7*l)*g;
       cos(theta(7))*(m*d + sind(theta(7))*6*l)*g;
       cos(theta(8))*(m*d + sind(theta(8))*5*l)*g;
       cos(theta(9))*(m*d + sind(theta(9))*4*l)*g;
       cos(theta(10))*(m*d + sind(theta(10))*3*l)*g;
       cos(theta(11))*(m*d + sind(theta(11))*2*l)*g;
       cos(theta(12))*(m*d + sind(theta(12))*1*l)*g;
       cos(theta13)*(m*d + sind(theta13)*0*l)*g;
       0;
       13*m*g];
  
   % calculates the supporting forces matrix
   S = [l*cosd(theta(1))*12*Ny;
        l*cosd(theta(2))*11*Ny;
        l*cosd(theta(3))*10*Ny;
        l*cosd(theta(4))*9*Ny;
        l*cosd(theta(5))*8*Ny;
        l*cosd(theta(6))*7*Ny;
        l*cosd(theta(7))*6*Ny;
        l*cosd(theta(8))*5*Ny;
        l*cosd(theta(9))*4*Ny;
        l*cosd(theta(10))*3*Ny;
        l*cosd(theta(11))*2*Ny;
        l*cosd(theta(12))*1*Ny;
        l*cosd(theta13)*0*Ny;
        0;
        -13*Ny];
    
    %constant matrix B
    B = [-1 0 0 0 0 0 0 0 0 0 0 0;
         1 -1 0 0 0 0 0 0 0 0 0 0;
         0 1 -1 0 0 0 0 0 0 0 0 0;
         0 0 1 -1 0 0 0 0 0 0 0 0;
         0 0 0 1 -1 0 0 0 0 0 0 0;
         0 0 0 0 1 -1 0 0 0 0 0 0;
         0 0 0 0 0 1 -1 0 0 0 0 0;
         0 0 0 0 0 0 1 -1 0 0 0 0;
         0 0 0 0 0 0 0 1 -1 0 0 0;
         0 0 0 0 0 0 0 0 1 -1 0 0;
         0 0 0 0 0 0 0 0 0 1 -1 0;
         0 0 0 0 0 0 0 0 0 0 1 -1;
         0 0 0 0 0 0 0 0 0 0 0 1;
         0 0 0 0 0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0 0 0 0 0];
   
     
     K = M*QDdot + H + F + G + S;
     %Gets the torques needed for each motor and displays them
     T = K\B;
     disp(T)
     
  %functions used to calculate some elements of the above matrices
  function x = F1(i)
    global m l d theta thetadot
    x = 0;
    f1 = 0;
    for j=i+1:13
        for k = j+1:13
         f1 = f1 + m; 
        end
      x = x + (m*d + l*f1)*sind(theta(i) - theta(j))*thetadot(j)*thetadot(j);
    end    
  end
  
  function y = F2(i)
      global m l d theta thetadot
      y = 0;
      f2 = 0;
      
      for k = i+1:13
          f2 = f2 + m; 
      end
      
      for j=1:i-1
          y = y + (m*d + l*f2)*sind(theta(i) - theta(j))*thetadot(j)*thetadot(j);
      end    
  end
  
  function z = F3
      global m l d theta thetadot
      z = 0;
      f3 = 0;
      
    for i=1:13
        for k = i+1:13
         f3 = f3 + m; 
        end
        z = z + cosd(theta(i))*(m*d + l *f3)*thetadot(i)*thetadot(i);
    end   
    z = -z;
  end
  
  function w = F4
      global m l d theta thetadot
      w = 0;
      f4 = 0;
      
    for i=1:13
        for k = i+1:13
         f4 = f4 + m; 
        end
        w = w + sind(theta(i))*(m*d + l *f4)*thetadot(i)*thetadot(i);
    end   
    w = -w;
  end
  
  