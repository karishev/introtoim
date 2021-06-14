
// 
const int yellowButton = A0;
const int blueButton = A2;
const int redButton = A4;
const int yellowLed = 5;
const int blueLed = 7;
const int redLed = 3;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the button's pin an input:
  pinMode(yellowButton, INPUT);
  pinMode(blueButton, INPUT);
  pinMode(redButton, INPUT);
  pinMode(yellowLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(redLed, OUTPUT);
   
  digitalWrite(yellowLed,HIGH);
  delay(500);
  digitalWrite(yellowLed,LOW);
  delay(500);
  digitalWrite(blueLed,HIGH);
  delay(500);
  digitalWrite(blueLed, LOW);
  delay(500);
  digitalWrite(blueLed,HIGH);
  delay(500);
  digitalWrite(blueLed, LOW);
  delay(500);
  digitalWrite(redLed, HIGH);
  delay(500);
  digitalWrite(redLed, LOW);
  
}

// the loop routine runs over and over again forever:
int redtap = 0;
int bluetap = 0;
int yelltap = 0;
int count = 0;
void loop() {
  // read the input pin:
  
  
  while(count<4) {
    int yellSwitch = digitalRead(yellowButton);
    int redSwitch = digitalRead(redButton);
    int blueSwitch = digitalRead(blueButton);
    if (yellSwitch == 1) {
      digitalWrite(yellowLed,HIGH);
      delay(500);
      digitalWrite(yellowLed,LOW);
      delay(500);
      yelltap += 1;
      count+=1;
    }
    else if (redSwitch == 1) {
      digitalWrite(redLed,HIGH);
      delay(500);
      digitalWrite(redLed,LOW);
      delay(500);
      redtap += 1;
      count +=1;
    }
    else if(blueSwitch == 1) {
      digitalWrite(blueLed,HIGH);
      delay(500);
      digitalWrite(blueLed,LOW);
      delay(500);
      bluetap += 1;
      count+=1;
    }
  }

  if (yelltap == 1 && bluetap == 2 && redtap == 1) {
    digitalWrite(blueLed, HIGH);
    digitalWrite(redLed, HIGH);
    digitalWrite(yellowLed,HIGH);
    delay(1000);
    digitalWrite(blueLed, LOW);
    digitalWrite(redLed, LOW);
    digitalWrite(yellowLed,LOW);
    delay(1000);
  }
  else {
    digitalWrite(blueLed,HIGH);
    delay(500);
    digitalWrite(blueLed, LOW);
    delay(500);
    digitalWrite(yellowLed,HIGH);
    delay(500);
    digitalWrite(yellowLed,LOW);
    delay(500);
    digitalWrite(redLed, HIGH);
    delay(500);
    digitalWrite(redLed, LOW);
    delay(500);
  }
  // print out the state of the button:
  //  Serial.println(k);
  delay(1);        // delay in between reads for stability
}
