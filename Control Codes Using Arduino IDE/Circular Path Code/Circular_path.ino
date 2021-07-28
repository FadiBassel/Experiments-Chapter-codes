//This file aims to control the snake robot to slither in a circulat path of radius 2 meters.

#include <Servo.h>

Servo myServos[12]; //create 12 servos

float pi=3.14159;
int TotalNumberofServos=12; //change as required
float Shift = 2*pi/TotalNumberofServos; // Phase lag between segments
float Wavelengths, rads;
int InteriorAngle, SetpointAngle, MaxAngleDisplacement;

void setup() {
  Serial.begin(9600);
  //Order of servos is such that myServos[0]=tail segment, and myServos[11]=head segment
  myServos[0].attach(A0);
  myServos[1].attach(A1);
  myServos[2].attach(A2);
  myServos[3].attach(A3);
  myServos[4].attach(A4);
  myServos[5].attach(A5);
  myServos[6].attach(3);
  myServos[7].attach(4);
  myServos[8].attach(5);
  myServos[9].attach(6);
  myServos[10].attach(7);
  myServos[11].attach(8);

  //Initialise snake in a straight line
  for(int i=0; i<12; i++){  
    myServos[i].write(90);
    delay(15); 
  }
  delay(1000);
}

void slither(int offset, int Amplitude, int Speed, float Wavelengths){
  MaxAngleDisplacement=abs(offset)+abs(Amplitude); //amount servo can rotate from the SetpointAngle without going out of the [0,180] degree range
  while(MaxAngleDisplacement>90){ //prevents a setpoint angle outside the rage of[0,180]
    Amplitude=abs(Amplitude)-1;
    MaxAngleDisplacement=abs(offset)+Amplitude;
  }
  for(int i=0; i<360; i++){
   rads=i*pi/180.0;     //convert from degrees to radians
   for(int j=0; j<12; j++){  
      myServos[j].write(90+offset+Amplitude*sin(Speed*rads+j*Wavelengths*Shift));
     }
   delay(10);
  }
}

void loop() {
  // put your main code here, to run repeatedly:

    slither(5, 35, 2, 1.5);           // circular slither
    //The value of the offset determines the radius of the circular path. The higher the value is, the maller the radius will be.
}
