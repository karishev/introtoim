//Name: SHyngys Karishev
//Net ID: sk8795

#include "pitches.h"

//declaring all the variables

const int potentiometer = A3;
const int blueSwitch = 5;
const int redSwitch = 7;
const int music = 2; 

// two arrays of notes to play
int notes1[] = {
  NOTE_A4, NOTE_B4, NOTE_C3, 0, NOTE_D4
};
int notes2[] = {
  NOTE_C4, NOTE_G3, 0, NOTE_A3, NOTE_B3
};

//setup and pinning
void setup() {
  Serial.begin(9600);
  pinMode(blueSwitch, INPUT);
  pinMode(potentiometer, INPUT);
  pinMode(redSwitch, INPUT);
}

//to traverse through the notes in two arrays
int k1 = 0;
int k2 = 0;

void loop() {
  int sensorReading = analogRead(potentiometer);  //reading the value from 0 to 1023
  int blueswitchReading = digitalRead(blueSwitch);  //reading 0 or 1
  int redswitchReading = digitalRead(redSwitch);    //reading 0 or 1
  sensorReading = map(sensorReading, 0,1023, 30,700); //mapping the value to make it into the duration of notes

  
  if (blueswitchReading == 1) {       //if blue is pressed we traverse to the next note in first array, same with the next block of code
    k1=k1+1;
    if (k1==4) k1 = 0;
    delay(10);
  }
  if (redswitchReading == 1) {
    k2=k2+1;
    if (k2==4) k2 = 0;
    delay(10);
  }
    
  tone(music, notes2[k2], sensorReading);     //sensorReading is now from 0 to 700 and makes the duration better, you can adjust it yourself
  delay(400);
  tone(music, notes1[k1], sensorReading);
    
  delay(400);
  
