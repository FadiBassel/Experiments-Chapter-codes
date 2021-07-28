//This file is to only make sure that all servos are working properly and that the signals are delivered to them correctly.
//I tested each servo at a time and attached it to pin 8.

#include <Servo.h> 

Servo servo;

void setup() 
{ 
  servo.attach(8);
  servo.write(0);  // set servo to mid-point
  delay(2000);
} 

void loop() {

  servo.write(90);
  delay(1000);
  servo.write(0);
  delay(1000);
}
