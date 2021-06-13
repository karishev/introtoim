//Midterm Project
//Shyngys Karishev code

//importing libraries
import java.util.ArrayList;
import java.util.Iterator;
import processing.sound.*;

Game game;

class Bullet                                     //bullet class constructor
{  
  int x,y,w,h;
  PImage bullet;
  Bullet(int xpos,int ypos,int wpos,int hpos) {                  
    x = xpos;
    y = ypos;
    w = wpos;
    h = hpos;
    bullet = loadImage("images/bullet.png");
  }

  void display() {
    update();
    image(bullet, x, y , w, h);
  }

  void update() {
    y = y - 12;

    ArrayList<Monster> todelete2 = new ArrayList<Monster>();          //using this method to delete things, because only this way it works
    for (Monster m : game.monsters) {
      if ((x > m.x && x < m.x+m.w) && (y >= m.y && y <= m.y+m.h)) {      //checking the collisions
        todelete2.add(m);                          //putting them to delete, adding score
        game.score += 100;                          
      }
    }
    for (Monster m : todelete2) {                        //and here deleting them
      game.monsters.remove(m);
    }
  }
}


class Doodler                                     //doodler class constructor
{
  int x, y, vx , vy, img_h, img_w, fall;
  PImage rimg, limg, upimg;
  String dir, lastdir;
  boolean shoot;
  ArrayList<Bullet> bullets;
  ArrayList<Boolean> keys;
  SoundFile jumpsound3, shootingsound;                      //adding teh sound sof jumping and shooting

  Doodler(int xpos, int ypos, int w, int h, SoundFile jumpsound2, SoundFile shootsound) {
    x = xpos;
    y = ypos;
    vx = 0;
    vy = 0;
    rimg = loadImage("images/rimgsmall.png");
    limg = loadImage("images/limgsmall.png");
    upimg = loadImage("images/upimgsmall.png");
    img_h = h;
    img_w = w;
    dir = "RIGHT";
    lastdir = "RIGHT";
    shoot = false;
    fall = 1;
    bullets = new ArrayList<Bullet>();
    keys = new ArrayList<Boolean>();
    keys.add(false);
    keys.add(false);
    jumpsound3 = jumpsound2; 
    shootingsound = shootsound;
  }

  void display() {
    update();

    if (dir == "RIGHT" && shoot != true){
      image(rimg, x, y);
    }
    else if (dir == "LEFT" && shoot != true){
      image(limg, x, y);
    }
    if (shoot ==  true){
      image(upimg, x, y);
      
    }
    
  }

  void update() {
    if (y > height + 10) {                            //checking if the doodler fall over the screen and make alive false if yes
      game.alive = false;  
    }

    if (keys.get(0)) {                              //keys that are used for the left and right directions
      x += -7;
      dir = "LEFT";
      lastdir = "LEFT"; 
    }

    else if (keys.get(1)) {
      x += 7;
      dir = "RIGHT";
      lastdir = "RIGHT";
    }

    else if (shoot == true) {                          //creating bullets if up is pressed with some periodical timing and playing the sound
      if (bullets.size() == 0) {
        Bullet newbull = new Bullet(x+20, y , 20, 20);
        bullets.add(newbull);
        shootingsound.play();
      }
      else if (bullets.get(bullets.size()-1).y < 200) {
        Bullet newbull = new Bullet(x+20, y , 20, 20);
        bullets.add(newbull);
        shootingsound.play();
      }
    }
    else {                                    //so it remembers where he was looking and stays the same
      dir = lastdir;
    }

    Iterator<Bullet> itr = bullets.iterator();                  //I found out about this method later, so somewhere I added to another array and deleted then
    while(itr.hasNext()) {
      Bullet check = itr.next();
      if (check.y <= 0) {
        itr.remove();
      }
    }

    for (Bullet i : bullets) {
      i.display();
    }  

    vy += fall;
    for (Platform p : game.platforms) {                     // the comparison of the coordinates of the doodler and the platforms, so we now if he can land there
      if (((y+img_h >= p.y) && (y+img_h <= p.y+p.h) && (vy >= 0)) && ((x >= p.x-25) && (x <= p.x+p.w))) {
        y = p.y-70;
        vy = -15;
        jumpsound3.play();
      }
    }  

    x += vx;
    y += vy;

    if (x <= 0){                                //to make him go from one side to another
      x = (width+x);
    }
    if (x >= width) {
      x = (x-width);
    }

    if (y < game.h/2){                              //to make it look like the doodler is climbing up
      int climb = (game.h/2-y);
      y = game.h/2;
      for (Platform p : game.platforms){
        p.y += climb;
        game.score += climb;                        //adding the score as we climb
      }
      for (Monster m : game.monsters){
        m.y += climb;
      }
    }
  }
}

class Monster {                                    //monster class constructor

  int x,y,w,h;
  PImage monsterimg;

  Monster( int xpos,int ypos, int wpos, int hpos, String enemytype){        //type, because there are two types of monsters
    x = xpos;
    y = ypos;
    w = wpos;
    h = hpos;
    monsterimg = loadImage("/images/" + enemytype + ".png");
  }
  void update(){
    Doodler d = game.doodler;
    if ((x >= d.x && x <= d.x+d.img_w) && (y >= d.y && y <= d.y+d.img_h)) {    //checking collisions with the doodler and if yes, alive sets to false
      game.alive = false;
    }    
  }
  void display(){
    update();
    image(monsterimg, x, y, w, h);
  }
}

class Platform{                                    //platform class constructor

  int x, y, w, h, vx;
  PImage platform;
  String type;



  Platform( int xpos, int ypos, int wpos, int hpos, String platformType) {
    x = xpos;
    y = ypos;
    w = wpos;
    h = hpos;
    vx = 3;
    type = platformType;
    if (type == "stable") {
      platform = loadImage("/images/platform1.png");
    }
    else if (type == "moving"){
      platform = loadImage("/images/platform2.png");
    }
  }
      
  void display() {
    movingplatform();
    image(platform, x, y, w, h);
  }
  

  void movingplatform(){                               //function to move the "moving" type platforms
    if (type == "moving") {
      if (x + w >= game.w - 4) {
        vx = -3;
      }
      else if (x <= 4){
        vx = 3;
      }
      x += vx;
    }
  }
}


class Game{                                      //game class constructor

  int w,h, score, level;
  ArrayList<Platform> platforms;
  ArrayList<Monster> monsters;
  Doodler doodler;
  boolean alive, pause;
  PImage backgroundImage;


  Game(int wpos,int hpos, SoundFile jumpsound1, SoundFile shooting){
    w = wpos;
    h = hpos;
    platforms = new ArrayList<Platform>();
    monsters = new ArrayList<Monster>();
    backgroundImage = loadImage("/images/back.png");
    addPlatforms(8);
    doodler = new Doodler(platforms.get(0).x, platforms.get(0).y - 100, 40, 50, jumpsound1, shooting);
    score = 0;
    pause = true;
    alive = true;
    level = 0;

  }
  
  void addPlatforms(int n){                             //adds n platforms to the game
    for (int i = n-1; i>=0; i--) {
      int x = int(random(0, w-80));
      int y = (h/8)*i;
      platforms.add(new Platform(x, y, 80, 20, "stable"));
    }
  }
  
  void display(){
    if (pause) {                                //pause and start screen
      background(0);
      fill(255, 255, 255);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("DOODLE JUMP", width/2, 1*height/10);
      textSize(20);
      text("Shooting: [UP]", width/2, 6*height/10);
      text("Movement: [LEFT] [RIGHT]", width/2, 7*height/10);
      text("PAUSE/START: [Q]", width/2, 8*height/10);
      text("Exit: [ESC]", width/2, 9*height/10);
      textAlign(LEFT);
    }

    else if (alive && !pause){                          //the game display
      strokeWeight(0);
      image(backgroundImage,0,0);
      for (Platform p : platforms) {
        p.display();
      }
      for (Monster m : monsters) {
        m.display();
      }
      doodler.display();
      game_manager();
      fill(0, 0, 0);
      textSize(30);
      text("Score: "+str(game.score/100), 20, 40);
      
      if (score/100 >= 300) {                          //two levels: 0 without monser, 1: with monsters
        level = 1;
      }
      else{
        level = 0;
      }
    }
        
    else{                                     //the game over screen
      background(0);
      fill(255, 255, 255);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("GAME OVER", width/2, 1*height/10);
      textSize(20);
      text("Score: "+str(game.score/100), width/2, 7*height/10);
      text("Retry: [CLICK MOUSE]", width/2, 8*height/10);
      text("Exit: [ESC]", width/2, 9*height/10);
      textAlign(LEFT);
    }
  }
}

 


void game_manager() {                                 //this function adds/deletes platforms and monsters  
  while (game.platforms.size() < 8){
    int x = int(random(game.w-80));
    int y = game.platforms.get(game.platforms.size()-1).y - 70;
    int random_num = int(random(30));                      //just so it makes less moving platforms an more stable with 1/6 probability
    if (random_num > 25){
      Platform newplat = new Platform(x, y, 80, 20, "moving");
      game.platforms.add(newplat);
    }
    else{    
      Platform newplat = new Platform(x, y, 80, 20, "stable");
      game.platforms.add(newplat);
    }
  }

  if (game.level == 1 && game.monsters.size() < 2){                     
    Platform p = game.platforms.get(game.platforms.size()-1);
    int k = 2;
    while (p.type == "moving"){                         //so the monster only appears on stable platforms and doesn't move
      p = game.platforms.get(game.platforms.size()-k);
      k++;
    }
    int x = p.x;
    int y = p.y-40;
    int ran = int(random(2));                          //random to which monster will show up
    Monster newmonster;
    if (ran == 0) newmonster = new Monster(x, y, 50, 50, "monster1");
    else newmonster = new Monster(x, y, 50, 50, "monster2");
    game.monsters.add(newmonster);
  }

  ArrayList<Platform> todelete1 = new ArrayList<Platform>();            //deleting monsters and platforms if they are out of window zone
  for ( Platform p : game.platforms) {
    if (p.y >= game.h){
      todelete1.add(p);
    }
  }
  for (Platform p : todelete1) {
    game.platforms.remove(p);
  }

  ArrayList<Monster> todelete2 = new ArrayList<Monster>();
  for ( Monster m : game.monsters) {
    if (m.y >= game.h){
      todelete2.add(m);
    }
  }
  for (Monster m : todelete2) {
    game.monsters.remove(m);
  }
}

void setup(){
  SoundFile jumpsound = new SoundFile(this, "Doodle_Sounds/jump.wav");      //adding the sounds to game first and then to doodler, didn't know how to add directly to doodler
  SoundFile bulletsound = new SoundFile(this, "Doodle_Sounds/arcade-laser.mp3");
  game = new Game(400, 700, jumpsound, bulletsound);
  frameRate(50);
  size(400, 700);
  background(255, 255, 255);
}

void draw(){
  background(255, 255, 255);
  game.display();
}

void keyPressed(){                                  //checking the keys pressed and released
  if (keyCode == LEFT){
    game.doodler.keys.set(0, true);
  }
  else if (keyCode == RIGHT){
    game.doodler.keys.set(1, true);
  }
  else if (keyCode == UP){
    game.doodler.shoot = true;
  }
}
void keyReleased(){
  if (keyCode == LEFT){
    game.doodler.keys.set(0,false);
  }
  else if (keyCode == RIGHT){
    game.doodler.keys.set(1,false);
  }
  else if (keyCode == UP){
    game.doodler.shoot = false;
  }
  if ((key == 'q'|| key == 'Q') && game.alive) {                  //if game is not ended we can pause it and at the start "start" it
    if (game.pause) game.pause = false;
    else game.pause = true;  
  }
}

void mousePressed() {                                //if the game is ended, we can restart it
  if (!game.alive) {
    SoundFile jumpsound = new SoundFile(this, "Doodle_Sounds/jump.wav");
    SoundFile bulletsound = new SoundFile(this, "Doodle_Sounds/arcade-laser.mp3");
    game = new Game(400, 700, jumpsound, bulletsound);
    game.pause = false;

  }
}
