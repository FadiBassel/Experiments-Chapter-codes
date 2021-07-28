time = 0:0.1:10;
motor1_angles = zeros(1,101);
motor2_angles = zeros(1,101);
motor3_angles = zeros(1,101);
motor4_angles = zeros(1,101);
motor5_angles = zeros(1,101);
motor6_angles = zeros(1,101);
motor7_angles = zeros(1,101);
motor8_angles = zeros(1,101);
motor9_angles = zeros(1,101);
motor10_angles = zeros(1,101);
motor11_angles = zeros(1,101);
motor12_angles = zeros(1,101);
t = length(time);


%Straight line
% for i=1:floor(t)
%     motor1_angles(i)= 90*i/t;
%     motor2_angles(i)= 0;
%     motor3_angles(i)= 0;
%     motor4_angles(i)= 0;
%     motor5_angles(i)= 0;
%     motor6_angles(i)= 0;
%     motor7_angles(i)= 0;
%     motor8_angles(i)= 0;
%     motor9_angles(i)= 0;
%     motor10_angles(i)= 0;
%     motor11_angles(i)= 0;
%     motor12_angles(i)= 90;    
% end

%C-shape
% for i=1:floor(t)
%     motor1_angles(i)= 90;
%     motor2_angles(i)= 0;
%     motor3_angles(i)= 0;
%     motor4_angles(i)= 0;
%     motor5_angles(i)= 90*i/t;
%     motor6_angles(i)= 0;
%     motor7_angles(i)= 0;
%     motor8_angles(i)= 0;
%     motor9_angles(i)= 90*i/t;
%     motor10_angles(i)= 0;
%     motor11_angles(i)= 0;
%     motor12_angles(i)= 90;    
% end

%Ubend
% for i=1:floor(t)
%     motor1_angles(i)= 90;
%     motor2_angles(i)= 0;
%     motor3_angles(i)= 0;
%     motor4_angles(i)= 0;
%     motor5_angles(i)= 0;
%     motor6_angles(i)= 90*i/t;
%     motor7_angles(i)= 0;
%     motor8_angles(i)= 90*i/t;
%     motor9_angles(i)= 0;
%     motor10_angles(i)= 0;
%     motor11_angles(i)= 0;
%     motor12_angles(i)= 90;    
% end

%Ring
% for i=1:floor(t/2)
%     motor1_angles(i)= 2*i*45/t;
%     motor2_angles(i)= 0;
%     motor3_angles(i)= -4*i*45/t;
%     motor4_angles(i)= 2*i*45/t;
%     motor5_angles(i)= 0;
%     motor6_angles(i)= -4*i*45/t;
%     motor7_angles(i)= 2*i*45/t;
%     motor8_angles(i)= 0;
%     motor9_angles(i)= -4*i*45/t;
%     motor10_angles(i)= 2*i*45/t;
%     motor11_angles(i)= 0;
%     motor12_angles(i)= 90;    
% end
% 
% for i=floor(t/2)+1:t
%     motor1_angles(i)= 2*i*45/t;
%     motor2_angles(i)= 0;
%     motor3_angles(i)= -4*i*45/t;
%     motor4_angles(i)= 2*i*45/t;
%     motor5_angles(i)= 0;
%     motor6_angles(i)= -4*i*45/t;
%     motor7_angles(i)= 2*i*45/t;
%     motor8_angles(i)= 0;
%     motor9_angles(i)= -4*i*45/t;
%     motor10_angles(i)= 2*i*45/t;
%     motor11_angles(i)= 0;
%     motor12_angles(i)= 90;    
% end

%Forward motion
% for i=1:floor(t/2)
%     motor1_angles(i)= 90+90*i/t; %90+90*i/t
%     motor2_angles(i)= 0;
%     motor3_angles(i)= 0; %90-90*i/t
%     motor4_angles(i)= 0;
%     motor5_angles(i)= 90-90*i/t;
%     motor6_angles(i)= 0;
%     motor7_angles(i)= 0;
%     motor8_angles(i)= 0;
%     motor9_angles(i)= 90*i/t;
%     motor10_angles(i)= 0;
%     motor11_angles(i)= 0;
%     motor12_angles(i)= 90;    
% end
% 
% for i=floor(t/2)+1:t
%     motor1_angles(i)= 180-90*i/t; 
%     motor2_angles(i)= 0;
%     motor3_angles(i)= 0;
%     motor4_angles(i)= 0;
%     motor5_angles(i)= 90*i/t;
%     motor6_angles(i)= 0;
%     motor7_angles(i)= 0;
%     motor8_angles(i)= 0;
%     motor9_angles(i)= 90-90*i/t;
%     motor10_angles(i)= 0;
%     motor11_angles(i)= 0;
%     motor12_angles(i)= 90;    
% end


%InchWorm 
% for i=1:floor(t/6)
%     motor1_angles(i)= 90+90*i/t; 
%     motor12_angles(i) = 90;
% end
% for i=floor(t/6):floor(2*t/6)
%     motor1_angles(i)= 90;
%     motor3_angles(i)= 90*i/t; 
%     motor4_angles(i) = 0;
%     motor12_angles(i) = 90;
% end
% for i=floor(2*t/6):floor(3*t/6)
%     motor1_angles(i)= 90;
%     motor5_angles(i)= 90*i/t; 
%     motor6_angles(i) = 0;
%     motor12_angles(i) = 90;
% end
% for i=floor(3*t/6):floor(4*t/6)
%     motor1_angles(i)= 90;
%     motor7_angles(i)= 90*i/t; 
%     motor8_angles(i) = 0;
%     motor12_angles(i) = 90;
% end
% for i=floor(4*t/6):floor(5*t/6)
%     motor1_angles(i)= 90;
%     motor9_angles(i)= 90*i/t; 
%     motor10_angles(i) = 0;
%     motor12_angles(i) = 90;
% end
% for i=floor(5*t/6):t
%     motor1_angles(i)= 90;
%     motor11_angles(i)= 90*i/t; 
%     motor12_angles(i) = 90;
% end

%InchWorm2: this motion is more similar to what will happen during
%implementaion because it propagates from the tail to the head thus moving
%forward. The problem is that when the signal going to the revolute joint
%during simulation terminates, the joint doesn't return to its initial
%position parallel to the ground.
%
% for i=1:floor(t/6)
%     motor1_angles(i)= 90;
%     motor11_angles(i)= 90*i/t; 
%     motor12_angles(i) = 90;
% end
% for i=floor(t/6):floor(2*t/6)
%     motor1_angles(i)= 90;
%     motor9_angles(i)= 90*i/t; 
%     motor10_angles(i) = 0;
%     motor12_angles(i) = 90;
% 
% end
% for i=floor(2*t/6):floor(3*t/6)
%     motor1_angles(i)= 90;
%     motor7_angles(i)= 90*i/t; 
%     motor8_angles(i) = 0;
%     motor12_angles(i) = 90;
% end
% for i=floor(3*t/6):floor(4*t/6)
%     motor1_angles(i)= 90;
%     motor5_angles(i)= 90*i/t; 
%     motor6_angles(i) = 0;
%     motor12_angles(i) = 90;
% end
% for i=floor(4*t/6):floor(5*t/6)
% 
%     motor1_angles(i)= 90;
%     motor3_angles(i)= 90*i/t; 
%     motor4_angles(i) = 0;
%     motor12_angles(i) = 90;
% end
% for i=floor(5*t/6):t
%     motor1_angles(i)= 90+90*i/t; 
%     motor12_angles(i) = 90;
% end