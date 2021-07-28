%This file aims to display the derivative of the jacobian matrix element by element, function
%in the q and qdot vectors (symbolically)

syms q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12
syms q1dot q2dot q3dot q4dot q5dot q6dot q7dot q8dot q9dot q10dot q11dot q12dot

q = [q1; q2; q3; q4; q5; q6; q7; q8; q9; q10; q11; q12];
global theta13 X0 Y0 l d
theta13 = 45;
X0 = 0;
Y0 = 0;
l = 0.088; % length (assumed constant for all links)
d = 0.035; % distance of CM of links (assumed constant for all links)

A = jacobe(q);

i = 6; %counter that you have to change from 1 to 6 to iterate over the rows of the jacobian matrix
j = 12; %counter that you have to change from 1 to 12 to iterate over the columns of the jacobian matrix
        
        p1 = diff(A(i,j),q1)*q1dot; %differentiate the element with respect to q1 and multiply it by q1dot
        p2 = diff(A(i,j),q2)*q2dot; %differentiate the element with respect to q2 and multiply it by q2dot
        p3 = diff(A(i,j),q3)*q3dot; %differentiate the element with respect to q3 and multiply it by q3dot
        p4 = diff(A(i,j),q4)*q4dot; %differentiate the element with respect to q4 and multiply it by q4dot
        p5 = diff(A(i,j),q5)*q5dot; %differentiate the element with respect to q5 and multiply it by q5dot
        p6 = diff(A(i,j),q6)*q6dot; %differentiate the element with respect to q6 and multiply it by q6dot
        p7 = diff(A(i,j),q7)*q7dot; %differentiate the element with respect to q7 and multiply it by q7dot
        p8 = diff(A(i,j),q8)*q8dot; %differentiate the element with respect to q8 and multiply it by q8dot
        p9 = diff(A(i,j),q9)*q9dot; %differentiate the element with respect to q9 and multiply it by q9dot
        p10 = diff(A(i,j),q10)*q10dot; %differentiate the element with respect to q10 and multiply it by q10dot
        p11 = diff(A(i,j),q11)*q11dot; %differentiate the element with respect to q11 and multiply it by q11dot
        p12 = diff(A(i,j),q12)*q12dot; %differentiate the element with respect to q12 and multiply it by q12dot
       
        %display each part alone and then the 12 outputs will be copied
        %manually and put in the inverse_acceleration_kinematics file
        disp(p1)
        disp(p2)
        disp(p3)
        disp(p4)
        disp(p5)
        disp(p6)
        disp(p7)
        disp(p8)
        disp(p9)
        disp(p10)
        disp(p11)
        disp(p12)

% These were other methods that I tried to use to get the derivative of the
% matrix but they didn't work mainly because they took long time to be
% processed or that the output was truncated.

% syms J11 J12 J13 J14 J15 J16 J17 J18 J19 J110 J111 J112
% syms J21 J22 J23 J24 J25 J26 J27 J28 J29 J210 J211 J212
% syms J31 J32 J33 J34 J35 J36 J37 J38 J39 J310 J311 J312
% syms J41 J42 J43 J44 J45 J46 J47 J48 J49 J410 J411 J412
% syms J51 J52 J53 J54 J55 J56 J57 J58 J59 J510 J511 J512
% syms J61 J62 J63 J64 J65 J66 J67 J68 J69 J610 J611 J612
% 
% JD = [JD11 JD12 JD13 JD14 JD15 JD16 JD17 JD18 JD19 JD110 JD111 JD112;
%       JD21 JD22 JD23 JD24 JD25 JD26 JD27 JD28 JD29 JD210 JD211 JD212;
%       JD31 JD32 JD33 JD34 JD35 JD36 JD37 JD38 JD39 JD310 JD311 JD312;
%       JD41 JD42 JD43 JD44 JD45 JD46 JD47 JD48 JD49 JD410 JD411 JD412;
%       JD51 JD52 JD53 JD54 JD55 JD56 JD57 JD58 JD59 JD510 JD511 JD512;
%       JD61 JD62 JD63 JD64 JD65 JD66 JD67 JD68 JD69 JD610 JD611 JD612];
%         p1 = simplify(p1, 'Steps',20);
%         vpa(p1, 3)
%         p2 = simplify(p2, 'Steps',20);
%         vpa(p2, 3)
%         p3 = simplify(p3, 'Steps',20);
%         vpa(p3, 3)
%         p4 = simplify(p4, 'Steps',20);
%         vpa(p4, 3)
%         p5 = simplify(p5, 'Steps',20);
%         vpa(p5, 3)
%         p6 = simplify(p6, 'Steps',20);
%         vpa(p6, 3)
%         p7 = simplify(p7, 'Steps',20);
%         vpa(p7, 3)
%         p8 = simplify(p8, 'Steps',20);
%         vpa(p8, 3)
%         p9 = simplify(p9, 'Steps',20);
%         vpa(p9, 3)
%         p10 = simplify(p10, 'Steps',20);
%         vpa(p10, 3)
%         p11 = simplify(p11, 'Steps',20);
%         vpa(p11, 3)
%         p12 = simplify(p12, 'Steps',20);
%         vpa(p12, 3)
% 
% subs(JD, {q1,q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q1dot, q2dot, q3dot, q4dot, q5dot, q6dot, q7dot, q8dot, q9dot, q10dot, q11dot, q12dot}, {10,20,30,40,50,60,70,80,70,60,50,40, 0.01,0.02,0.03,0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.08,0.07,0.06});
% disp(JD)


function [Jacobian] = jacobe(q)
%Getting the jacobian matrix
global l
Tg_h = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
Th_0 = [-1 0 0 -l; 0 -1 0 0; 0 0 1 0; 0 0 0 1];
T0_1 = dhm(q(1), -90, l, 0);
T1_2 = dhm(q(2), 90, l, 0);
T2_3 = dhm(q(3), -90, l, 0);
T3_4 = dhm(q(4), 90, l, 0);
T4_5 = dhm(q(5), -90, l, 0);
T5_6 = dhm(q(6), 90, l, 0);
T6_7 = dhm(q(7), -90, l, 0);
T7_8 = dhm(q(8), 90, l, 0);
T8_9 = dhm(q(9), -90, l, 0);
T9_10 = dhm(q(10), 90, l, 0);
T10_11 = dhm(q(11), -90, l, 0);
T11_12 = dhm(q(12), 0, l, 0);

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
