clc
clear
hold on
'Snake Locomotion Parameters..............................................';
n =17; %number of segments
a = pi/3; %degree of undulation
aDEG = a*(180/pi);
b = 2*pi; %periods of unit lenghts
c = 0; %changes the direction of propagation
omega=.5; %in rad/s
frequency= omega/(2*pi); %in Hz
lag = (2*pi)/n; %in rad
% The X-Y position of the center of each segment can
% be aproximated by the following code:
x(1) = 0; %For the origin or tail position
y(1) = 0; %For the origin or tail position
plot(x(1),y(1),'bo') %plot the tail position in the graph
hold on %hold this position in the graph when another point
%position is plotted in the graph
%to calculate the remaining x-y positions following the formulas
for i=1:1:n+1
for k=1:1:i
x(k+1) = x(k)+(1/n)*cos(a*cos(k*b/n)); %x position for i-th segment
y(k+1) = y(k)+(1/n)*sin(a*cos(k*b/n)); %y position for i-th segment
if i<=n
line([x(k),x(k+1)],[y(k),y(k+1)])
end
end
hold on

plot(x(k),y(k),'bo'); %plot the x-y coordinates
xlabel('x [cm]')
ylabel('y [cm]')
title('Postion Graph in Cartesian Plane')
pause(.05); %pause to see it like an animation
hold off
%to determine the relative angle of the i-th segment
end
%to calculate the change in theta with time
'Theta angles for each joint changing with time for 20 seconds.........';
figure
for t=1:1:20
for i=1:1:n
theta(t,i) = 2*a*(180/pi)*abs(sin(b/(2*n)))*sin(omega*t+(b/n)*(i-1));
end
%Plot the theta angle with time
hold on
plot(t,theta(t,1),'-or')
plot(t,theta(t,2),'-ob')
plot(t,theta(t,3),'-om')
plot(t,theta(t,4),'-oy')
plot(t,theta(t,5),'-og')
plot(t,theta(t,6),'-ok')
plot(t,theta(t,7),'-oc')
xlabel('time [s]')
ylabel('\theta [degrees]')
title('Change in \theta Angle')
end
for i=1:1:n-1
line([0,1],[0,theta(1,i)],'color','k')
for t=1:1:19
line([t,t+1],[theta(t,i), theta(t+1,i)],'color','k')
end
end
hold off
theta;
%to draw the snake moving
x(1) = 0; %For the origin or tail position
y(1) = 0; %For the origin or tail position
%plot(x(1),y(1),'bo') %plot the tail position in the graph
hold on %hold this position in the graph when another point
%position is plotted in the graph

%to calculate the remaining x-y positions following the formulas
for t=1:1:20
figure
for i=1:1:n
for k=1:1:i
x(k+1) = x(k)+(1/n)*cos(theta(t,k)*(pi/180)); %x position for i-th segment
y(k+1) = y(k)+(1/n)*sin(theta(t,k)*(pi/180)); %y position for i-th segment
if i<=n
line([x(k),x(k+1)],[y(k),y(k+1)])
end
end
hold on
plot(x(k),y(k),'bo'); %plot the x-y coordinates
xlabel('x [cm]')
ylabel('y [cm]')
title('Postion Graph in Cartesian Plane')
axis([0 1 -.3 .3])
end
mov(t) = getframe;
end
figure
pause(2);
movie(mov,1,1)
%to calculate the delay in seconds of the control signals
'Time delay between square-wave control signals..........................';
delay = 2*pi*(b/(n*2*pi))/omega;