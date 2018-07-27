//Car Driving Testing
//By Ryan and Harki

//Setup Servo
#include <Servo.h>
Servo myservo;

//Servo start position
int pos = 140; //140 is roughly straight for the steering
float currentB = 0; //Sense drive motor current draw

  //Sensor Set Up
  long duration;
  int distance;
  const int trigPin = 3;
  const int echoPin = 2;
  
void setup() {
  
  //Setup Channel A
  pinMode(13, OUTPUT); //Initiates Motor Channel B pin
  pinMode(8, OUTPUT); //Initiates Brake Channel B pin
  //View Serial Monitor for feedback
  Serial.begin(9600);
  //Setup Steering
  myservo.attach(10);  // attaches the servo on pin 10 to the servo object

  //Sensor Set Up
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}


void loop(){

  //Steer straight
  myservo.write(pos); 

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance= duration*0.034/2;
  Serial.print("Distance: ");
  Serial.println(distance);


 
//  forward @ full speed
//  digitalWrite(13, HIGH); //Establishes forward direction of Channel A
//  digitalWrite(8, LOW);   //Disengage the Brake for Channel A
//  analogWrite(11, 222);  //max is 255 -  implies 9 Volts -- need 12V at least supply to motor
//  currentB = analogRead(A1);//current sense motor A
//  Serial.print(currentB); //max is 2 Amps
//  Serial.print("milliamps\n");








  
//  
//  delay(3000);
//  
//  digitalWrite(9, HIGH); //engage the Brake for Channel A
//
//  delay(1000);
//  
//  //backward @ half speed
//  digitalWrite(12, LOW); //Establishes backward direction of Channel A
//  digitalWrite(9, LOW);   //Disengage the Brake for Channel A
//  analogWrite(3, 123);   //Spins the motor on Channel A at half speed
//  
//  delay(3000);
//  
//  digitalWrite(9, HIGH); //Eengage the Brake for Channel A
//  
//  delay(1000);
  
}
