//Shyngys Karishev 
//Arduino Tiles


#include "pitches.h"
#include <LiquidCrystal.h>

//declaring the lcd
LiquidCrystal lcd(13, 12, 7, 10, 9, 8);

// change this to make the song slower or faster
int tempo = 85;

// this calculates the duration of a whole note in ms
int wholenote = (60000 * 4) / tempo;

int divider = 0, noteDuration = 0;

int left = 0;
int p = -2;
int right = -2;
int k,released, scoree = 0, a1, a2, whichsong, prev = -1;
//declaring the variables

const int greentap = 6;
const int yelltap = 5;
const int bluetap = 4;
const int redtap = 3;
const int pause = 11;
const int buzzer = 2;
void setup() {
  lcd.begin(16, 2);                 //tell the lcd library that we are using a display that is 16 characters wide and 2 characters high
  lcd.clear();
  //pinning everything and writing 5 zeros to serial
  Serial.begin(9600);
  Serial.println("0,0,0,0,0");
  pinMode(greentap, INPUT);
  pinMode(yelltap, INPUT);
  pinMode(bluetap, INPUT);
  pinMode(redtap, INPUT);
  pinMode(pause, INPUT);
  pinMode(buzzer, OUTPUT);
}
int count = 0;
void loop() {
  //while the serial available we send the information of the buttons to the processing
  while (Serial.available()) {
    //getting info from the proccesing, which note played now, paused or not, is the long released or not, score of the game, what are the note that should be played and name of the song
    right = Serial.parseInt();
    k = Serial.parseInt();
    released = Serial.parseInt();
    scoree = Serial.parseInt();
    a1 = Serial.parseInt();
    a2 = Serial.parseInt();
    whichsong = Serial.parseInt();

    if (prev != whichsong) { //so it doesn't clear all the time
      lcd.clear();
    }
    prev = whichsong;

    //Just checking which song was chosen and display on lcd
    lcd.setCursor(0, 0);
    if (whichsong == 0) {
      lcd.print("Choosing a song");
      scoree = 000;
    }
    else if (whichsong == 1) {
      lcd.print("Game of Thrones");
    }
    else if (whichsong == 2) {
      lcd.print("Happy Birthday");
    }
    else if (whichsong == 3) {
      lcd.print("Harry Potter");
    }
    else if (whichsong == 4) {
      lcd.print("Godfather");
    }
    
    //printing the score on lcd
    lcd.setCursor(0, 1);     
    lcd.print("Score: ");       
    lcd.print(scoree);

    if(released) noTone(buzzer); //if long tile is released we stop the tone

    //writing info to the processing which tile or pause is pressed
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

    //if the prev is played only then we play next
    if (left!=right && p!=right && k == 0) {
      noTone(buzzer);
      divider = a1;
      
      if (divider > 0) {
        // regular note, just proceed
        noteDuration = (wholenote) / divider;
      } else if (divider < 0) {
        // dotted notes are represented with negative durations!!
        noteDuration = (wholenote) / abs(divider);
        noteDuration *= 1.5; // increases the duration in half for dotted notes
      }
  
      // we only play the note for 90% of the duration, leaving 10% as a pause
      tone(buzzer, a2, noteDuration * 0.9);
      // Wait for the specief duration before playing the next note.
      left = right;
      p = right;
    }
    
    
  }
  if (k==1) delay(100);
}
