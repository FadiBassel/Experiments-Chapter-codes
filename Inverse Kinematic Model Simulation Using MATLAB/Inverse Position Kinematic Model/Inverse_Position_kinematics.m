%This file takes as inputs the x & y  values of the required position of
%the end effector. It then uses the Newton-Raphson method to calculate the
%relative joint angles till it reaches the q vector  that satisfies this
%position.

% input x and y of end effector
Xe = 0.2253;
Ye = -0.1887;

%input initial guess of relative joint angles other than zeros so the
%Jacobian matrix won't be singular and can be inversed
q1 = 1;
q2 = 2;
q3 = 3;
q4 = 4;
q5 = 5;
q6 = 6;
q7 = 1;
q8 = 2;
q9 = 3;
q10 = 4;
q11 = 5;
q12 = 6;


q = [q1; q2; q3; q4; q5; q6; q7; q8; q9; q10; q11; q12];
global theta13 X0 Y0 l d
theta13 = 45;
X0 = 0;
Y0 = 0;
l = 0.088; % length (assumed constant for all links)
d = 0.035; % distance of CM of links (assumed constant for all links)
flag = 0;

fwd = [Xend(q);
       Yend(q)]; %creates a matrix of x and y values of the end effector based on the q vector given
i = 0;
while (fwd(1)~= Xe) && (fwd(2)~= Ye) && (flag == 0) %loop until the values calculated are equal to the required position
    A = jacobe(q); %calculate the jacobian matrix given the vector q
    first_row = A(1,:); %extract the first row from the jacobian matrix
    second_row = A(2,:); %extract the second row from the jacobian matrix
    z = [first_row; second_row]; %put the 2 rows in the same matrix which are only needed for calculation
    u = invJ(z); %calculate the inverse of this matrix
    delta_q = u*[Xe - fwd(1); Ye - fwd(2)];
    q = delta_q + q; %calculate the new vector q to be used in the Newton-Raphson method
    fwd = [Xend(q);
           Yend(q)];
    disp(fwd) %display the values x & y calculated
    i = i+1;
    disp(i) %keeps track of the number of iterations to know if the method is stuck and to change the initial guess
    if (fwd(1) == Xe) && (fwd(2) == Ye) %will cause the exit of the loop if the values are similar
        flag = 1;
    end
end

disp(q) %displays the relative joint angles that lead to the required end effector position

function [Jacobian] = jacobe(q)
%Getting the jacobian matrix
global l
%Get the transformation matrices
Tg_h = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Th_0 = [-1 0 0 -l; 0 -1 0 0; 0 0 1 0; 0 0 0 1];
T0_1 = dhm(q(1), -pi/2, l, 0);
T1_2 = dhm(q(2), pi/2, l, 0);
T2_3 = dhm(q(3), -pi/2, l, 0);
T3_4 = dhm(q(4), pi/2, l, 0);
T4_5 = dhm(q(5), -pi/2, l, 0);
T5_6 = dhm(q(6), pi/2, l, 0);
T6_7 = dhm(q(7), -pi/2, l, 0);
T7_8 = dhm(q(8), pi/2, l, 0);
T8_9 = dhm(q(9), -pi/2, l, 0);
T9_10 = dhm(q(10), pi/2, l, 0);
T10_11 = dhm(q(11), -pi/2, l, 0);
T11_12 = dhm(q(12), 0, l, 0);

%calculate Jvi
Z_0 = Tg_h*Th_0;
Z_1 = Z_0*T0_1;
Z_2 = Z_1*T1_2;
Z_3 = Z_2*T2_3;
Z_4 = Z_3*T3_4;
Z_5 = Z_4*T4_5;
Z_6 = Z_5*T5_6;
Z_7 = Z_6*T6_7;
Z_8 = Z_7*T7_8;
Z_9 = Z_8*T8_9;
Z_10 = Z_9*T9_10;
Z_11 = Z_10*T10_11;
Z_12 = Z_11*T11_12;

O1 = Z_12(:,4) - Z_0(:,4);
O2 = Z_12(:,4) - Z_1(:,4);
O3 = Z_12(:,4) - Z_2(:,4);
O4 = Z_12(:,4) - Z_3(:,4);
O5 = Z_12(:,4) - Z_4(:,4);
O6 = Z_12(:,4) - Z_5(:,4);
O7 = Z_12(:,4) - Z_6(:,4);
O8 = Z_12(:,4) - Z_7(:,4);
O9 = Z_12(:,4) - Z_8(:,4);
O10 = Z_12(:,4) - Z_9(:,4);
O11 = Z_12(:,4) - Z_10(:,4);
O12 = Z_12(:,4) - Z_11(:,4);

Jv1 = crossP(Z_0(:,3), O1);
Jv2 = crossP(Z_1(:,3), O2);
Jv3 = crossP(Z_2(:,3), O3);
Jv4 = crossP(Z_3(:,3), O4);
Jv5 = crossP(Z_4(:,3), O5);
Jv6 = crossP(Z_5(:,3), O6);
Jv7 = crossP(Z_6(:,3), O7);
Jv8 = crossP(Z_7(:,3), O8);
Jv9 = crossP(Z_8(:,3), O9);
Jv10 = crossP(Z_9(:,3), O10);
Jv11 = crossP(Z_10(:,3), O11);
Jv12 = crossP(Z_11(:,3), O12);

% fill in the jacobian matrix using the calculated vector Jvi
% (translational velocities) and Jwi (rotational velocities)

Jacobian = [Jv1(1) Jv2(1) Jv3(1) Jv4(1) Jv5(1) Jv6(1) Jv7(1) Jv8(1) Jv9(1) Jv10(1) Jv11(1) Jv12(1);
            Jv1(2) Jv2(2) Jv3(2) Jv4(2) Jv5(2) Jv6(2) Jv7(2) Jv8(2) Jv9(2) Jv10(2) Jv11(2) Jv12(2);
            Jv1(3) Jv2(3) Jv3(3) Jv4(3) Jv5(3) Jv6(3) Jv7(3) Jv8(3) Jv9(3) Jv10(3) Jv11(3) Jv12(3);
            Z_0(1,3) Z_1(1,3) Z_2(1,3) Z_3(1,3) Z_4(1,3) Z_5(1,3) Z_6(1,3) Z_7(1,3) Z_8(1,3) Z_9(1,3) Z_10(1,3) Z_11(1,3);
            Z_0(2,3) Z_1(2,3) Z_2(2,3) Z_3(2,3) Z_4(2,3) Z_5(2,3) Z_6(2,3) Z_7(2,3) Z_8(2,3) Z_9(2,3) Z_10(2,3) Z_11(2,3);
            Z_0(3,3) Z_1(3,3) Z_2(3,3) Z_3(3,3) Z_4(3,3) Z_5(3,3) Z_6(3,3) Z_7(3,3) Z_8(3,3) Z_9(3,3) Z_10(3,3) Z_11(3,3)];
end

function [pseudoJ] = invJ(Jacob) %calculates the pseudo-inverse of the jacobian since the system is over-actuated
    j = Jacob.';
    pseudoJ = j*inv(Jacob*j);
end

function [T] = dhm(theta, alpha, r, d) %calculates the transformation matrices
         T = [cosd(theta) -sind(theta)*cosd(alpha) sind(theta)*sind(alpha) r*cosd(theta);
            sind(theta) cosd(theta)*cosd(alpha) -cosd(theta)*sind(alpha) r*sind(theta);
            0 sind(alpha) cosd(alpha) 0;
            0 0 0 1];
        
end

function [res] = crossP(v, w) %calculates the cross product of 2 vectors
    i = (v(2)*w(3) - v(3)*w(2));
    j = -(v(1)*w(3) - v(3)*w(1));
    k = (v(1)*w(2) - w(1)*v(2));
    res = [i; j; k];
end

function X13 = Xend(q) %function to calculate the x position of the end effector
    global theta13 X0 l d

    for i = 1:12
    qSum = 0;
        for n = i:12
          qSum = qSum + q(n); 
        end    
    theta(i) =  qSum + theta13; %calculate each absolute joint angle using the relative one 
    end
    
   
    f1 = 0;
    for j = 1:12
        f1 = f1 + cosd(theta(j));
    end

    X13 = X0 + l*f1 + d*cosd(theta13);
end

function Y13 = Yend(q)  %function to calculate the y position of the end effector
    global theta13 Y0 l d
    
    for i = 1:12
    qSum = 0;
        for n = i:12
          qSum = qSum + q(n); 
        end    
    theta(i) =  qSum + theta13; %calculate each absolute joint angle using the relative one 
    end
    
    f2 = 0;
    for j = 1:12
        f2 = f2 + sind(theta(j));
    end
    Y13 = Y0 + l*f2 + d*sind(theta13);
end