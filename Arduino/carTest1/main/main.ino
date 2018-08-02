//Car Driving Testing
//By Ryan and Harki
#include "network.h"
using namespace std;


//Setup Servo
#include <Servo.h>
Servo myservo;

//Servo start position
int pos = 140; //140 is roughly straight for the steering
float currentB = 0; //Sense drive motor current draw

//Arrays used
double arrIn[7];
double arrOut[2];
double coeff[64] = {0.010058,0.021507,-0.64508,0.5071,0.0482,0.027718,-0.33932,-0.88842,0.091274,-0.14505,-0.14499,0.28647,0.075744,0.15063,0.66329,0.050569,0.096072,0.45521,0.004986,0.21156,0.020915,-0.10862,0.16578,0.067902,-0.12386,0.71624,0.011182,-1.6959,0.1411,-0.13506,-0.028443,-0.153,0.10195,-0.016707,-0.13686,0.15883,0.12873,0.3206,-0.010895,-0.28423,-0.068332,0.11177,0.03218,0.10542,-0.26854,0.19184,-0.015392,0.1184,0.65344,0.021146,-18.542,38.112,-0.058833,0.14627,0.30615,2.6266,0.15227,0.10383,-0.072868,-0.0048141,-0.014333,-16.707,-0.2758};

//Controlling Global Variables
double currentSpeed = 0;
double currentSteering = pos;


///////Sensor Set Up///////
// Sensor 1 -> looking striaght -> arrIn[0] 
// Sensor 2 -> left front
// Sensor 3 -> right front
// Sensor 4 -> left side
// Sensor 5 -> right side -> arrIn[4]
// Current speed -> arrIn[5]
// Current steering angle -> arrIn[6]

const int trigPin1 = 7;
const int echoPin1 = 6;
const int trigPin2 = 5;
const int echoPin2 = 4;
const int trigPin3 = 9;
const int echoPin3 = 8;
const int trigPin4 = 3;
const int echoPin4 = 2;
const int trigPin5 = 13;
const int echoPin5 = 12;
  
void setup() {
  
  //Setup Channel A
  pinMode(13, OUTPUT); //Initiates Motor Channel B pin
  pinMode(8, OUTPUT); //Initiates Brake Channel B pin
  //View Serial Monitor for feedback
  Serial.begin(9600);
  //Setup Steering
  myservo.attach(10);  // attaches the servo on pin 10 to the servo object

  //Sensor Set Up
  pinMode(trigPin1, OUTPUT);
  pinMode(echoPin1, INPUT);
  pinMode(trigPin2, OUTPUT);
  pinMode(echoPin2, INPUT);
  pinMode(trigPin3, OUTPUT);
  pinMode(echoPin3, INPUT);
  pinMode(trigPin4, OUTPUT);
  pinMode(echoPin4, INPUT);
  pinMode(trigPin5, OUTPUT);
  pinMode(echoPin5, INPUT);
}


void loop(){

  //Steer straight
  myservo.write(pos); 

getSensorData(arrIn);
//arrIn[5] = currentSpeed;
//arrIn[6] = currentSteering;
sim(arrIn,coeff,arrOut);
Serial.println(arrOut[0]);
Serial.println(arrOut[1]);


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

void getSensorData(double arrIn[]){
  digitalWrite(trigPin1, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin1, LOW);
  arrIn[0] = pulseIn(echoPin1, HIGH)*0.034/2;
  
  digitalWrite(trigPin2, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin2, LOW);
  arrIn[1] = pulseIn(echoPin2, HIGH)*0.034/2;
    
  digitalWrite(trigPin3, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin3, LOW);
  arrIn[2] = pulseIn(echoPin3, HIGH)*0.034/2;
  
  digitalWrite(trigPin4, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin4, LOW);
  arrIn[3] = pulseIn(echoPin4, HIGH)*0.034/2;
    
  digitalWrite(trigPin5, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin5, LOW);
  arrIn[4] = pulseIn(echoPin5, HIGH)*0.034/2;
  
  Serial.print("Distance1: ");
  Serial.println(arrIn[0]);
  Serial.print("Distance2: ");
  Serial.println(arrIn[1]);
  Serial.print("Distance3: ");
  Serial.println(arrIn[2]);
  Serial.print("Distance4: ");
  Serial.println(arrIn[3]);
  Serial.print("Distance5: ");
  Serial.println(arrIn[4]);
}

