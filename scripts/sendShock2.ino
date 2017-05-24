/*
 wait for an incoming serial signal to send 
 out a ttl pulse to trigger shock device 
 
 author: Kelly, kelhennigan@gmail.com
 May 2014
 Modified to include delay to make trigger reliable with high-resource tasks
 */

// define pulse and ground pin numbers
int Shock = 6;
int Grnd = 12;

// for incoming serial data
char incomingByte;

void setup() {

  // initialize serial 
  Serial.begin(57600);

  // initialize output pins
  pinMode(Grnd, OUTPUT);     
  pinMode(Shock, OUTPUT);     

}

void loop() {

  digitalWrite(Shock, LOW);   // keep pins set to LOW output
  digitalWrite(Grnd, LOW);   // keep ground pin on LOW voltage level

  if (Serial.available()) {

    incomingByte = Serial.read(); // read the incoming byte:

    // say what you got:
    Serial.print("\nI received: ");
    Serial.println(incomingByte);

    if (incomingByte == 't')
    {
      pulseOut();
    }
    Serial.flush(); //flushes the buffer of incoming serial data
  }
}

void pulseOut() {
  digitalWrite(Shock, HIGH);   // send a 5V pulse 
  delay(10);               // wait for a 10 msec 
  digitalWrite(Shock, LOW);   // set pin back to LOW
}


