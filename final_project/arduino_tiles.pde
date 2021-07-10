import java.util.ArrayList;
import java.util.Iterator;
import processing.serial.*;

//declaring notes and songs below
int NOTE_B0 =31;
int NOTE_C1 =33;
int NOTE_CS1=35;
int NOTE_D1 =37;
int NOTE_DS1=39;
int NOTE_E1 =41;
int NOTE_F1 =44;
int NOTE_FS1=46;
int NOTE_G1 =49;
int NOTE_GS1=52;
int NOTE_A1 =55;
int NOTE_AS1=58;
int NOTE_B1 =62;
int NOTE_C2 =65;
int NOTE_CS2=69;
int NOTE_D2 =73;
int NOTE_DS2=78;
int NOTE_E2 =82;
int NOTE_F2 =87;
int NOTE_FS2=93;
int NOTE_G2 =98;
int NOTE_GS2=104;
int NOTE_A2 =110;
int NOTE_AS2=117;
int NOTE_B2 =123;
int NOTE_C3 =131;
int NOTE_CS3=139;
int NOTE_D3 =147;
int NOTE_DS3=156;
int NOTE_E3 =165;
int NOTE_F3 =175;
int NOTE_FS3=185;
int NOTE_G3 =196;
int NOTE_GS3=208;
int NOTE_A3 =220;
int NOTE_AS3=233;
int NOTE_B3 =247;
int NOTE_C4 =262;
int NOTE_CS4=277;
int NOTE_D4 =294;
int NOTE_DS4=311;
int NOTE_E4 =330;
int NOTE_F4 =349;
int NOTE_FS4=370;
int NOTE_G4 =392;
int NOTE_GS4=415;
int NOTE_A4 =440;
int NOTE_AS4=466;
int NOTE_B4 =494;
int NOTE_C5 =523;
int NOTE_CS5=554;
int NOTE_D5 =587;
int NOTE_DS5=622;
int NOTE_E5 =659;
int NOTE_F5 =698;
int NOTE_FS5=740;
int NOTE_G5 =784;
int NOTE_GS5=831;
int NOTE_A5 =880;
int NOTE_AS5=932;
int NOTE_B5 =988;
int NOTE_C6 =1047;
int NOTE_CS6=1109;
int NOTE_D6 =1175;
int NOTE_DS6=1245;
int NOTE_E6 =1319;
int NOTE_F6 =1397;
int NOTE_FS6=1480;
int NOTE_G6 =1568;
int NOTE_GS6=1661;
int NOTE_A6 =1760;
int NOTE_AS6=1865;
int NOTE_B6 =1976;
int NOTE_C7 =2093;
int NOTE_CS7=2217;
int NOTE_D7 =2349;
int NOTE_DS7=2489;
int NOTE_E7 =2637;
int NOTE_F7 =2794;
int NOTE_FS7=2960;
int NOTE_G7 =3136;
int NOTE_GS7=3322;
int NOTE_A7 =3520;
int NOTE_AS7=3729;
int NOTE_B7 =3951;
int NOTE_C8 =4186;
int NOTE_CS8=4435;
int NOTE_D8 =4699;
int NOTE_DS8=4978;
int REST    = 0;


int happybirthday[] = {

  // Happy Birthday

  REST,16, NOTE_C4,4, NOTE_C4,8, 
  NOTE_D4,-4, NOTE_C4,-4, NOTE_F4,-4,
  NOTE_E4,-2, NOTE_C4,4, NOTE_C4,8, 
  NOTE_D4,-4, NOTE_C4,-4, NOTE_G4,-4,
  NOTE_F4,-2, NOTE_C4,4, NOTE_C4,8,

  NOTE_C5,-4, NOTE_A4,-4, NOTE_F4,-4, 
  NOTE_E4,-4, NOTE_D4,-4, NOTE_AS4,4, NOTE_AS4,8,
  NOTE_A4,-4, NOTE_F4,-4, NOTE_G4,-4,
  NOTE_F4,-2,
  REST,16
};

int harrypotter[] = {


  // Hedwig's theme fromn the Harry Potter Movies

  REST, 2, NOTE_D4, 4,
  NOTE_G4, -4, NOTE_AS4, 8, NOTE_A4, 4,
  NOTE_G4, 2, NOTE_D5, 4,
  NOTE_C5, -2, 
  NOTE_A4, -2,
  NOTE_G4, -4, NOTE_AS4, 8, NOTE_A4, 4,
  NOTE_F4, 2, NOTE_GS4, 4,
  NOTE_D4, -1, 
  NOTE_D4, 4,

  NOTE_G4, -4, NOTE_AS4, 8, NOTE_A4, 4, //10
  NOTE_G4, 2, NOTE_D5, 4,
  NOTE_F5, 2, NOTE_E5, 4,
  NOTE_DS5, 2, NOTE_B4, 4,
  NOTE_DS5, -4, NOTE_D5, 8, NOTE_CS5, 4,
  NOTE_CS4, 2, NOTE_B4, 4,
  NOTE_G4, -1,
  NOTE_AS4, 4,
    
  NOTE_D5, 2, NOTE_AS4, 4,//18
  NOTE_D5, 2, NOTE_AS4, 4,
  NOTE_DS5, 2, NOTE_D5, 4,
  NOTE_CS5, 2, NOTE_A4, 4,
  NOTE_AS4, -4, NOTE_D5, 8, NOTE_CS5, 4,
  NOTE_CS4, 2, NOTE_D4, 4,
  NOTE_D5, -1, 
  REST,4, NOTE_AS4,4,  

  NOTE_D5, 2, NOTE_AS4, 4,//26
  NOTE_D5, 2, NOTE_AS4, 4,
  NOTE_F5, 2, NOTE_E5, 4,
  NOTE_DS5, 2, NOTE_B4, 4,
  NOTE_DS5, -4, NOTE_D5, 8, NOTE_CS5, 4,
  NOTE_CS4, 2, NOTE_AS4, 4,
  NOTE_G4, -1, 
  REST,16
};

int gameofthrones[] = {

  // Game of Thrones

  REST,16, NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16, //4
  NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16,
  NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16,
  NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16,
  NOTE_G4,-4, NOTE_C4,-4,//5

  NOTE_DS4,16, NOTE_F4,16, NOTE_G4,4, NOTE_C4,4, NOTE_DS4,16, NOTE_F4,16, //6
  NOTE_D4,-1, //7 and 8
  NOTE_F4,-4, NOTE_AS3,-4,
  NOTE_DS4,16, NOTE_D4,16, NOTE_F4,4, NOTE_AS3,-4,
  NOTE_DS4,16, NOTE_D4,16, NOTE_C4,-1, //11 and 12

  //repeats from 5
  NOTE_G4,-4, NOTE_C4,-4,//5

  NOTE_DS4,16, NOTE_F4,16, NOTE_G4,4, NOTE_C4,4, NOTE_DS4,16, NOTE_F4,16, //6
  NOTE_D4,-1, //7 and 8
  NOTE_F4,-4, NOTE_AS3,-4,
  NOTE_DS4,16, NOTE_D4,16, NOTE_F4,4, NOTE_AS3,-4,
  NOTE_DS4,16, NOTE_D4,16, NOTE_C4,-1, //11 and 12
  NOTE_G4,-4, NOTE_C4,-4,
  NOTE_DS4,16, NOTE_F4,16, NOTE_G4,4,  NOTE_C4,4, NOTE_DS4,16, NOTE_F4,16,

  NOTE_D4,-2,//15
  NOTE_F4,-4, NOTE_AS3,-4,
  NOTE_D4,-8, NOTE_DS4,-8, NOTE_D4,-8, NOTE_AS3,-8,
  NOTE_C4,-1,
  NOTE_C5,-2,
  NOTE_AS4,-2,
  NOTE_C4,-2,
  NOTE_G4,-2,
  NOTE_DS4,-2,
  NOTE_DS4,-4, NOTE_F4,-4, 
  NOTE_G4,-1,

  NOTE_C5,-2,//28
  NOTE_AS4,-2,
  NOTE_C4,-2,
  NOTE_G4,-2, 
  NOTE_DS4,-2,
  NOTE_DS4,-4, NOTE_D4,-4,
  NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16, NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16,
  NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16, NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16,

  REST,4, NOTE_GS5,16, NOTE_AS5,16, NOTE_C6,8, NOTE_G5,8, NOTE_GS5,16, NOTE_AS5,16,
  NOTE_C6,8, NOTE_G5,16, NOTE_GS5,16, NOTE_AS5,16, NOTE_C6,8, NOTE_G5,8, NOTE_GS5,16, NOTE_AS5,16,
  REST,16
};

int godfather[] = {

  // The Godfather theme

  REST, 4, REST, 8, REST, 8, REST, 8, NOTE_E4, 8, NOTE_A4, 8, NOTE_C5, 8, //1
  NOTE_B4, 8, NOTE_A4, 8, NOTE_C5, 8, NOTE_A4, 8, NOTE_B4, 8, NOTE_A4, 8, NOTE_F4, 8, NOTE_G4, 8,
  NOTE_E4, 2, NOTE_E4, 8, NOTE_A4, 8, NOTE_C5, 8,
  NOTE_B4, 8, NOTE_A4, 8, NOTE_C5, 8, NOTE_A4, 8, NOTE_C5, 8, NOTE_A4, 8, NOTE_E4, 8, NOTE_DS4, 8,

  NOTE_D4, 2, NOTE_D4, 8, NOTE_F4, 8, NOTE_GS4, 8, //5
  NOTE_B4, 2, NOTE_D4, 8, NOTE_F4, 8, NOTE_GS4, 8,
  NOTE_A4, 2, NOTE_C4, 8, NOTE_C4, 8, NOTE_G4, 8, 
  NOTE_F4, 8, NOTE_E4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_E4, 8, NOTE_GS4, 8,

  NOTE_A4, 2, REST,8, NOTE_A4, 8, NOTE_A4, 8, NOTE_GS4, 8, //9
  NOTE_G4, 2, NOTE_B4, 8, NOTE_A4, 8, NOTE_F4, 8, 
  NOTE_E4, 2, NOTE_E4, 8, NOTE_G4, 8, NOTE_E4, 8,
  NOTE_D4, 2, NOTE_D4, 8, NOTE_D4, 8, NOTE_F4, 8, NOTE_DS4, 8, 

  NOTE_E4, 2, REST, 8, NOTE_E4, 8, NOTE_A4, 8, NOTE_C5, 8, //13

  //repeats from 2
  NOTE_B4, 8, NOTE_A4, 8, NOTE_C5, 8, NOTE_A4, 8, NOTE_B4, 8, NOTE_A4, 8, NOTE_F4, 8, NOTE_G4, 8, //2
  NOTE_E4, 2, NOTE_E4, 8, NOTE_A4, 8, NOTE_C5, 8,
  NOTE_B4, 8, NOTE_A4, 8, NOTE_C5, 8, NOTE_A4, 8, NOTE_C5, 8, NOTE_A4, 8, NOTE_E4, 8, NOTE_DS4, 8,

  NOTE_D4, 2, NOTE_D4, 8, NOTE_F4, 8, NOTE_GS4, 8, //5
  NOTE_B4, 2, NOTE_D4, 8, NOTE_F4, 8, NOTE_GS4, 8,
  NOTE_A4, 2, NOTE_C4, 8, NOTE_C4, 8, NOTE_G4, 8, 
  NOTE_F4, 8, NOTE_E4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_E4, 8, NOTE_GS4, 8,

  NOTE_A4, 2, REST,8, NOTE_A4, 8, NOTE_A4, 8, NOTE_GS4, 8, //9
  NOTE_G4, 2, NOTE_B4, 8, NOTE_A4, 8, NOTE_F4, 8, 
  NOTE_E4, 2, NOTE_E4, 8, NOTE_G4, 8, NOTE_E4, 8,
  NOTE_D4, 2, NOTE_D4, 8, NOTE_D4, 8, NOTE_F4, 8, NOTE_DS4, 8, 

  NOTE_E4, 2, //13
  REST,16
};

int tempo = 85;

int wholenote = (60000 * 4) / tempo;

int divider = 0;
int noteDuration = 0;
Boolean release = false;

//Class Tile declaration
class Tile {                            //Tile class declaration
  float x, y, w, h, vy, duration, clr;
  Boolean touched;
  int type, rrr;

  Tile(float xpos, float ypos, int speed, int typee, float durationn) {
    x = xpos;
    y = ypos;    
    w = width/4;
    duration = durationn;
    clr = 0;
    vy = speed;
    touched = false;
    type = typee;
    if (type == 1) h = height/3.5;
    else h = height/duration; //duration is needed for the long tiles
    rrr=0;
  }

  void update() {
    y += vy;

    if (type == 1 && this == firstuntouched()) {                  //checks if pressed correctly
      touchchecker(this);
    }  
    else if (type == 0 && this == firstuntouched()) {             //checks if the long tile is pressed correctly 
      longtouchchecker(this);
    }
  }

  void display() {
    update();

    if (type == 1) {
      if (touched) fill(204,0,255);
      else fill(0,0,0);
      
      rect(x, y, w, h);

    } else if (type == 0 && clr < h) {      //so we make an effect as it is progresses as we touch
      fill(100,50,80);
      rect(x, y, w, h);
      fill(204,0,255);
      rect(x, y + h - clr, w, clr);
    } else if (type == 0 && clr >= h) {
      fill(204,0,255);
      rect(x, y, w, h);
      
    }
  }

}

  
class Game {                            //Game class declaration
  ArrayList<Tile> tiles;
  ArrayList<Boolean> keys;                    //keys for understanding which tile/row is pressed 
  Boolean gameover, pause, chooseperiod;
  int tilespeed, notenumber, noteplayed, a1,a2, whichsong;
  int[] melody;
  float score, notedur;
  PImage backgroundImage;


  Game() {
    tiles = new ArrayList<Tile>();
    keys = new ArrayList<Boolean>();
    keys.add(false); 
    keys.add(false);
    keys.add(false);
    keys.add(false);
    tilespeed = 9;
    whichsong = 0;
    gameover = false;
    pause = true;
    chooseperiod = false;    //chossing cong period
    score = 0;
    notenumber = 2;
    backgroundImage = loadImage("background.jpg");
    backgroundImage.resize(width, height);
    noteplayed = 0;
  }

  void display() {

    if (pause) {                                //pause and start screen
      background(0);
      fill(255, 255, 255);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("PIANO TILES", width/2, 1*height/10);
      textSize(20);
      text("Left Buttons for tiles", width/2, 6*height/10);
      text("Right Button for pause/start", width/2, 7*height/10);
      text("Exit: [ESC]", width/2, 9*height/10);
      textAlign(LEFT);
    }
  
    else if (chooseperiod) {                    //choosing the song screen
      background(0);
      fill(255, 255, 255);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("Choose Song", width/2, 1*height/10);
      textSize(20);
      text("Use left buttons corresponding numbers", width/2, 3*height/10);
      text("1. Game of Thrones", width/2, 6*height/10);
      text("2. Happy Birthday", width/2, 7*height/10);
      text("3. Harry Potter", width/2, 8*height/10);
      text("4. Godfather", width/2, 9*height/10);
      textAlign(LEFT);
      if (keys.get(0)) {
        melody=gameofthrones;
        whichsong = 1;
        chooseperiod = false;
        if (melody[1]>0) tiles.add(new Tile(0,-height/3.5, tilespeed,1,1));
        else {
          float duration = map((wholenote*1.5)/(Math.abs(divider)), 0, wholenote*1.5,2.2,0.35);
          tiles.add(new Tile(0,-height/duration, tilespeed,0,duration));
        }
        delay(100);
      }
      else if (keys.get(1)){
        melody=happybirthday;
        whichsong = 2;
        chooseperiod = false;
        if (melody[1]>0) tiles.add(new Tile(width/4,-height/3.5, tilespeed,1,1));
        else {
          float duration = map((wholenote*1.5)/(Math.abs(divider)), 0, wholenote*1.5,2.2,0.35);
          tiles.add(new Tile(width/4,-height/duration, tilespeed,0,duration));
        }
        delay(100);
      }
      else if (keys.get(2)) {
        melody=harrypotter;
        whichsong = 3;
        chooseperiod = false;
        if (melody[1]>0) tiles.add(new Tile(width/4*2,-height/3.5, tilespeed,1,1));
        else {
          float duration = map((wholenote*1.5)/(Math.abs(divider)), 0, wholenote*1.5,2.2,0.35);
          tiles.add(new Tile(width/4*2,-height/duration, tilespeed,0,duration));
        }
        delay(100);
      } 
      else if (keys.get(3)){
        melody = godfather;
        whichsong = 4;
        chooseperiod = false;
        if (melody[1]>0) tiles.add(new Tile(width/4*3,-height/3.5, tilespeed,1,1));
        else {
          float duration = map((wholenote*1.5)/(Math.abs(divider)), 0, wholenote*1.5,2.2,0.35);
          tiles.add(new Tile(width/4*3,-height/duration, tilespeed,0,duration));
        }
        delay(100);
      } 
      
    }

    else if (!pause && !gameover && !chooseperiod) {                        //game screen
      strokeWeight(0);
      image(backgroundImage,0,0);
      strokeWeight(1);
      stroke(0 ,0 ,0);
      line(width/4, 0, width/4, height);
      line(2*width/4, 0, 2*width/4, height);
      line(3*width/4, 0, 3*width/4, height);
      strokeWeight(0.3);
      stroke(125,125,125);
      line(0,650,width,650);
      if (noteplayed < melody.length) {
        update();
        for (Tile t : tiles) {
          t.display();
        }
      }
      else if (noteplayed == melody.length) {
        for (Tile t : tiles) {
          t.display();
        }
        noteplayed ++;
      }
      else gameover = true;
      fill(255, 130, 2);
      textAlign(CENTER, CENTER);
      textSize(40);
      text("Score: "+str(int(score)), width/2, 60);
    }

    else if (gameover) {                            //gameover screen
      background(0);
      fill(255, 255, 255);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("GAME OVER", width/2, 1*height/10);
      textSize(20);
      text("Score: "+str(int(score)), width/2, 7*height/10);
      text("Retry: Right Button", width/2, 8*height/10);
      text("Exit: [ESC]", width/2, 9*height/10);
      textAlign(LEFT);
    }
    
  }

  void update() {                            //updating the number of tiles if needed and deleting if touched
    int last = tiles.size() - 1;
    if (tiles.get(last).y >= -1) {
      int row = int(random(0,4));
      while (tiles.get(last).x == width/4*row) {
        row = int(random(0,4));
      }
      
      divider = melody[notenumber + 1];
      println(divider);
      if (divider > 4) {
        notedur = (wholenote)/divider;
        tiles.add(new Tile(width/4*row,-height/3.5, tilespeed,1,1));
      } else {
        
        float duration = map((wholenote*1.5)/(Math.abs(divider)), 0, wholenote*1.5,2.2,0.35);
        tiles.add(new Tile(width/4*row,-height/duration, tilespeed,0,duration));
        println(notenumber);
      }
      if (notenumber < melody.length-2) notenumber+=2;
      
      
    }

    Iterator<Tile> itr = tiles.iterator(); 
    while(itr.hasNext()) {
      Tile check = itr.next();
      if (check.y >= 900 && check.touched == true) {
        itr.remove();
      }
      else if (check.y >= 900 && check.touched == false) {
        gameover = true;
      }
    }  
    // }
    score += 0.08;
  }
}

void touchchecker(Tile given) {                            //checking if the tile is pressed by the buttons in arduino
  int row = int(given.x*4/width);
  for (int i = 0; i<game.keys.size(); i++) {
    if (game.keys.get(i) == true && row == i) {
      given.touched = true;
      game.a1 = game.melody[game.noteplayed + 1];
      game.a2 = game.melody[game.noteplayed];
      game.noteplayed += 2;
      
    }
    else if (game.keys.get(i) == true && row != i) {
      int k = game.tiles.indexOf(given);
      if(k!=0) {
        if (int(game.tiles.get(k-1).x*4/width) != i) {
          game.gameover = true;
        }
      }
      else{
        game.gameover = true;
      }
    }
  }
}

void longtouchchecker(Tile given) {                      //checking if the long tile is pressed by the buttons in arduino
  int row = int(given.x*4/width);
  for (int i = 0; i<game.keys.size(); i++) {
    if (game.keys.get(i) == true && row == i) {
      given.clr += 11;
      if(given.rrr == 0) {
        game.a1 = game.melody[game.noteplayed + 1];
        game.a2 = game.melody[game.noteplayed];
        game.noteplayed += 2;
        
        given.rrr = 1;
      }
    }
    else if (game.keys.get(i) == false && row == i && given.clr > 0) {
      given.touched = true;
      release = true;
    }

    else if (game.keys.get(i) == true && row != i) {
      int k = game.tiles.indexOf(given);
      if(k!=0) {
        if (int(game.tiles.get(k-1).x*4/width) != i) {
          game.gameover = true;
        }
      }
      else{
        game.gameover = true;
      }
    }
  }
}

Tile firstuntouched() {                                   //to get the bottom untouched tile in some checker functions
  Tile lol = new Tile(0,0,0,1,1);
  Iterator<Tile> itr = game.tiles.iterator(); 
  while(itr.hasNext()) {
    Tile check = itr.next();
    if (check.touched != true) {
      return check;
    }
  }
  return lol;
}

Game game;
Serial myPort;

void setup() {
  size(600,900);
  game = new Game();
  String portname=Serial.list()[0];
  println(portname);
  myPort = new Serial(this,portname,9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

void draw() {
  background(2, 217, 255);
  game.display();
}

void serialEvent(Serial myPort){                          //Basically made the sae logic as the code commented above with key pressed
  String s=myPort.readStringUntil('\n');                      //if a button is pressed then one of the game.keys changes to true and therefore
  s=trim(s);                                              //make one of the tiles touched or lose the game.
  if (s!=null){
    println(s);
    int values[]=int(split(s,','));
    if (values.length==5){
      if (values[0] == 1) {
        game.keys.set(0,true);
      }
      else if (values[0] == 0) {
        game.keys.set(0,false);
      }

      if (values[1] == 1) {
        game.keys.set(1,true);
      }

      else if (values[1] == 0) {
        game.keys.set(1,false);
      }

      if (values[2] == 1) {
        game.keys.set(2,true);
      }

      else if (values[2] == 0) {
        game.keys.set(2,false);
      }
      if (values[3] == 1) {
        game.keys.set(3,true);
      }

      else if (values[3] == 0) {
        game.keys.set(3,false);
      }

      if (values[4] == 1 && !game.gameover) {                  //pause/start button
        if (game.pause && game.score>0) game.pause = false;
        else if (game.pause && game.score==0) {
          game.chooseperiod = true;
          game.pause = false;
        }
        else if (!game.pause && !game.chooseperiod) game.pause = true;  
      }

      if (values[4] == 1 && game.gameover) {                  //if gameover, you can reset by pressing the same button as start

        game.tiles = new ArrayList<Tile>();
        game.keys = new ArrayList<Boolean>();
        game.keys.add(false); 
        game.keys.add(false);
        game.keys.add(false);
        game.keys.add(false);
        game.tilespeed = 9;
        game.chooseperiod = true;
        game.gameover = false;
        game.pause = false;
        game.score = 0;
        game.notenumber = 2;
        game.noteplayed = 0;
        game.whichsong = 0;
      }

    }
  }
  if (release) {      //sending the info to arduino and changing release if sent
    myPort.write(int(game.noteplayed-2) + "," + int(game.pause) + "," + int(release) +"," + int(game.score) + "," +int(game.a1) +"," +int(game.a2) +","+ game.whichsong + "\n");
    release = false;
  }else {
    myPort.write(int(game.noteplayed-2) + "," + int(game.pause) + "," + int(release) +"," + int(game.score) + "," +int(game.a1) + "," +int(game.a2) +","+ game.whichsong + "\n");
  }
}
