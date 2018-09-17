//To determine sim speed to motor value conversion
void setup() {
  //Setup Channel A
  pinMode(13, OUTPUT); //Initiates Motor Channel B pin
  pinMode(8, OUTPUT); //Initiates Brake Channel B pin

}

void loop() {
  digitalWrite(13, LOW); //Establishes forward direction of Channel A
  digitalWrite(8, LOW);   //Disengage the Brake for Channel A
  analogWrite(11, 222);  //max is 255 -  implies 9 Volts -- need 12V at least supply to motor
}
