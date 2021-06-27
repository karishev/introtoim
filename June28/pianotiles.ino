int left = 0;
int right = 0;
//declaring the variables

const int greentap = 11;
const int yelltap = 10;
const int bluetap = 9;
const int redtap = 8;
const int pause = 5;
void setup() {
  //pinning everything and writing 5 zeros to serial
  Serial.begin(9600);
  Serial.println("0,0,0,0,0");
  pinMode(greentap, INPUT);
  pinMode(yelltap, INPUT);
  pinMode(bluetap, INPUT);
  pinMode(redtap, INPUT);
  pinMode(pause, INPUT);
}

void loop() {
  //while the serial available we send the information of the buttons to the processing
  while (Serial.available()) {
    int sensor0 = digitalRead(greentap);
    int sensor1 = digitalRead(yelltap);
    int sensor2 = digitalRead(bluetap);
    int sensor3 = digitalRead(redtap);
    int pausecheck = digitalRead(pause);
    Serial.print(sensor0);
    Serial.print(',');
    Serial.print(sensor1);
    Serial.print(',');
    Serial.print(sensor2);
    Serial.print(',');
    Serial.print(sensor3);
    Serial.print(',');
    Serial.println(pausecheck);
    delay(100); 
  }
}
