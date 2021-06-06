PImage img;
float change = 50;
void setup() {
  size (500,500);
  img = loadImage("actor1.png");
  img.resize(500,500);
  //image(img,0,0);
  background(0);
  noStroke();
  //frameRate(1200);
  
}

void draw() {
  img.loadPixels();
  //for(int c = 0; c<10;c++) {
  if (mousePressed) loop();
  else noLoop();
  for (int i = 0; i < img.width; i++) {
    for(int p = 0; p <img.height; p++) {
      color k = img.pixels[i*img.height + p];
      float r = red(k);
      float g = green(k);
      float b = blue(k);
      r=r+change;
      g=g+change;
      b=b+change;
      if (r >= 256 || r<=0) change = -change;
      if (g >= 256 || g<=0) change = -change;
      if (b >= 256 || b<=0) change = -change;
      
      if (i ==100 && p == 10) println(r);
      //color myColor = color(r,g,b);
      //img.pixels[p*img.width + i] = myColor;
      //fill(256-r,g,256-b);
      //square(i,p,0.3);
      img.pixels[p*img.width + i] = color(r,g,b);
    }
  }
  img.updatePixels();
  image(img,0,0);
  //noLoop();
}

void mousePressed() {
  loop();
}
