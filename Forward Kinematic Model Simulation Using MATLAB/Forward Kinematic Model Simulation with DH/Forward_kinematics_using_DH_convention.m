%this file outputs the position of end effector based on random generated values of joints angles,
%using the DH convention
close all
clc

theta0 = pi;
theta1 = pi*rand(1,1);
theta2 = pi*rand(1,1);
theta3 = pi*rand(1,1);
theta4 = pi*rand(1,1);
theta5 = pi*rand(1,1);
theta6 = pi*rand(1,1);
theta7 = pi*rand(1,1);
theta8 = pi*rand(1,1);
theta9 = pi*rand(1,1);
theta10 = pi*rand(1,1);
theta11 = pi*rand(1,1);
theta12 = pi*rand(1,1);

l = 0.088; % length (assumed same for all links)
    
[Hg_12] = fwd_Ki(theta1, theta2, theta3, theta4, theta5, theta6, theta7, theta8, theta9, theta10, theta11, theta12, l);
    
x12 = Hg_12(1,4);
y12 = Hg_12(2,4);
z12 = Hg_12(3,4);
disp(x12)
disp(y12)
disp(z12)

function [Hg_12] = fwd_Ki(theta1,theta2,theta3,theta4,theta5,theta6,theta7,theta8,theta9,theta10,theta11,theta12,l)

    function [T] = dhm(theta, alpha, r, d)
        T = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) r*cos(theta);
            sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) r*sin(theta);
            0 sin(alpha) cos(alpha) 0;
            0 0 0 1];
    end
Tg_h = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Th_0 = [-1 0 0 -l; 0 -1 0 0; 0 0 1 0; 0 0 0 1];
T0_1 = dhm(theta1, -pi/2, l, 0);
T1_2 = dhm(theta2, pi/2, l, 0);
T2_3 = dhm(theta3, -pi/2, l, 0);
T3_4 = dhm(theta4, pi/2, l, 0);
T4_5 = dhm(theta5, -pi/2, l, 0);
T5_6 = dhm(theta6, pi/2, l, 0);
T6_7 = dhm(theta7, -pi/2, l, 0);
T7_8 = dhm(theta8, pi/2, l, 0);
T8_9 = dhm(theta9, -pi/2, l, 0);
T9_10 = dhm(theta10, pi/2, l, 0);
T10_11 = dhm(theta11, -pi/2, l, 0);
T11_12 = dhm(theta12, 0, l, 0);

Hg_12 = Tg_h*Th_0*T0_1*T1_2*T2_3*T3_4*T4_5*T5_6*T6_7*T7_8*T8_9*T9_10*T10_11*T11_12;

end
