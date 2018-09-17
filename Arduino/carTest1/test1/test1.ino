//to determine sim angle to servo value conversion 


//140 is roughly straight for the steering -> sim = 0
//115 max left, sim = -13.6
//155 max right, sim = 13.7


//Setup Servo
#include <Servo.h>
Servo myservo;


void setup() {
  //Setup Steering
  myservo.attach(10);  // attaches the servo on pin 10 to the servo object

}

void loop() {
  myservo.write(147); 

}
