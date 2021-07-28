Time = 0:0.1:10;
motor1_anglesW = zeros(1,101);
motor2_anglesW = zeros(1,101);
motor3_anglesW = zeros(1,101);
motor4_anglesW = zeros(1,101);
motor5_anglesW = zeros(1,101);
motor6_anglesW = zeros(1,101);
motor7_anglesW = zeros(1,101);
motor8_anglesW = zeros(1,101);
motor9_anglesW = zeros(1,101);
motor10_anglesW = zeros(1,101);
motor11_anglesW = zeros(1,101);
motor12_anglesW = zeros(1,101);
T = length(Time);

%Sidewinding motion
for i=1:T
    motor1_anglesW(i)= 90+90*i/T; %90+90*i/t
    motor2_anglesW(i)= 90+90*i/T;
    motor3_anglesW(i)= 90+90*i/T;
    motor4_anglesW(i)= 90+90*i/T;
    motor5_anglesW(i)= 90+90*i/T;
    motor6_anglesW(i)= 90+90*i/T;
    motor7_anglesW(i)= 90+90*i/T;
    motor8_anglesW(i)= 90+90*i/T;
    motor9_anglesW(i)= 90+90*i/T;
    motor10_anglesW(i)= 90+90*i/T;
    motor11_anglesW(i)= 90+90*i/T;
    motor12_anglesW(i)= 90+90*i/T;    
end

