# Piano Tiles

One of the first ideas I thought about was the recreaton of piano tiles. I have already worked on it for 28.06 assignment, where I made the touch detection from arduino. Now I am 
thinking of adding the tone to arduino to play some music and maybe adding the long tiles to the games that produce longer sounds.

### 01.07.2021

In the assignment I made a section where you can press the tiles, but then I decided to make it possible anywhere on the screen, since this is the logic in the game too. I tried to implement it without making it collapse with other pressed buttons, but it didn't work. So I decided to let the last touched tile row/button still be pressed even tho it is not his turn. Basically I then checked that it possible to do in the actual game too, so I am not so off cheatinf right now.

### 02.07.2021

Rewrote the code so I can play from the computer and tried to implement the long tiles. I was thinking how to detect the end of the press and how much shoud be added. Just added a new attribute to tile class that will say how much should be collored of the long tiles. It worked perfectly. Then I tried to do the same with Arduino and it worked fine.

### 04.07.2021

Started to search for the music that could be played and found this source https://github.com/robsoncouto/arduino-songs. After that used the game of thrones song. There was tempo, the length/duration of the note played, so I was adjutsing how should I map those values with duration attribute in the Tiles. After some time of trying it started to adjust normally and it ooked like it was working. Then I tried to connect the arduino and processing and added a buzzer to play the melody and it didn't work perfectly. Basically, at first there was a delay in the arduino songs code, so I deleted it and then adjusted the map values again so it will look better now. There are still some issues with the sounds.

### 05.07.2021

Playing the song was still hard to implement, so I tried ro readjust some things in processing. Changed the speed of the tiles and speed of the long tiles coloring thing. Now it works a little better. 

### 06.07.2021

I understood that tone function is not blocking so it became much easier. I implemented the Game of Thrones song fully and it worked fine. After that I added three more songs that could be played and added a screen to change the music. Everything worked fine and it was almost all done.

### 07.07.2021

Added the LCD and it took more time that I thought. There were some errors with the pins or something, so I just randomly changed positions. That's why some of the pins are not logically on their places. Worked at first, but then again a mistake. It was a communication error and I was passing the data incorrectly and fixed it. Then some errors with the LCD and only then found out about the lcd.clear() function that helped a lot in prettiness. After that I was fully done.
