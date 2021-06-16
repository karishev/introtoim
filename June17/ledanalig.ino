//Name: Shyngys Karishev
//NetID: sk8795
//The following code is making the led that uses analog brighter if the switch for blue led id pressed

// declaring the variables

const int blueLed = 3;
const int yellLed = 5;
const int sensor = A2;
const int button = A0;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  pinMode(sensor, INPUT);
  pinMode(button, INPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(yellLed, OUTPUT);
}

// the loop routine runs over and over again forever:
int k = 0;


void loop() {
  // read the input on analog pin 2 and 0:
  int sensorValue = analogRead(sensor);
  int buttonValue = digitalRead(button);
  // print out the value you read:

  //the following if statements are needed to change the color of the yellow led.
  
  if (buttonValue == 1 && k == 0) {
    analogWrite(yellLed, 125);
    k=1;
    delay(500);
  }
  else if (buttonValue == 1 && k ==1) {
    digitalWrite(yellLed, HIGH);
    k=2;
    delay(500);
  }
  else if (buttonValue == 1 && k == 2) {
    analogWrite(yellLed, 125);
    k=3;
    delay(500);
  }
  else if (buttonValue == 1 && k == 3) {
    digitalWrite(yellLed, LOW);
    k=0;
    delay(500);
  }

  //70 and 180 are made because of observations 
  sensorValue = constrain(sensorValue, 70, 180);
  
  int brightness = map(sensorValue, 70, 180, 0, 255);

  analogWrite(blueLed, brightness);
  
  delay(1);        // delay in between reads for stability
}
