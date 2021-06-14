
// getting all the inputs
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
  // make the led's pin an output
  pinMode(yellowLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(redLed, OUTPUT);
   
  //showing once the order of the led lights to bright
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
int redtap = 0;   //count how many time red button and red led was pressed and voltage was high
int bluetap = 0;  //same with blue
int yelltap = 0;  //same with yellow
int count = 0;    //counting the times pressed on buttons
int order[4];     //so we will have the order of the pressed buttons and know for sure if the order was right
void loop() {
  
  while(count<4) {  //<4 to make it only 4 presses, so we can say if the order was right or not
    // getting the 0 and 1 of the buttons     
    int yellSwitch = digitalRead(yellowButton); 
    int redSwitch = digitalRead(redButton);
    int blueSwitch = digitalRead(blueButton);
    if (yellSwitch == 1) {  //if yell button was pressed, the yellow led will blink and the count and yelltap will increment by one, same with other lights
      digitalWrite(yellowLed,HIGH);
      delay(500);
      digitalWrite(yellowLed,LOW);
      delay(500);
      order[count] = 1;   //if yellow, it will put 1
      yelltap += 1;
      count+=1;
    }
    else if (redSwitch == 1) {
      digitalWrite(redLed,HIGH);
      delay(500);
      digitalWrite(redLed,LOW);
      delay(500);
      order[count] = 2;   //if red, it will put 2
      redtap += 1;
      count +=1;
    }
    else if(blueSwitch == 1) {
      digitalWrite(blueLed,HIGH);
      delay(500);
      order[count] = 3;   //if blue, it will put 3
      digitalWrite(blueLed,LOW);
      delay(500);
      bluetap += 1;
      count+=1;
    }
  }
  //as the while loop ends, if everything was right, all three leds will blink at the same time
  //and also checking if the order was right with the order[] 
  if (yelltap == 1 && bluetap == 2 && redtap == 1 && order[0] == 1 && order[1]==3 && order[2] == 3 && order[3] == 2) {    
    digitalWrite(blueLed, HIGH);
    digitalWrite(redLed, HIGH);
    digitalWrite(yellowLed,HIGH);
    delay(1000);
    digitalWrite(blueLed, LOW);
    digitalWrite(redLed, LOW);
    digitalWrite(yellowLed,LOW);
    delay(1000);
  }
  else {                                                //if wrong order, they will blink in order blue, yell, red.
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
  
  delay(1);        // delay in between reads for stability
}
