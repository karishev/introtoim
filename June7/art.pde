PImage img;
float change = 50;
void setup() {
  size (500,500);
  img = loadImage("actor1.png");                          //loading the image, which is in the folder
  img.resize(500,500);                                    //resizing it to to the size of the setup
  background(0);
  noStroke();  
}

void draw() {
  img.loadPixels();                                       //loading the pixels of the img
  if (mousePressed) loop();                               //it was just for the recording, but you can look how it changes
  else noLoop();
  for (int i = 0; i < img.width; i++) {
    for(int p = 0; p <img.height; p++) {
      color k = img.pixels[i*img.height + p];             //taking the color of the pixel
      float r = red(k);
      float g = green(k);
      float b = blue(k);
      r=r+change;                                         //changing the color
      g=g+change;
      b=b+change;
      if (r >= 256 || r<=0) change = -change;             //if rgb is bigger than 256 or smaller than 0, we change the 'change' variable
      if (g >= 256 || g<=0) change = -change;
      if (b >= 256 || b<=0) change = -change;
      img.pixels[p*img.width + i] = color(r,g,b);         //now updating the pixel of the image, but reversed the row and col
    }
  }
  img.updatePixels();
  image(img,0,0);
}

void mousePressed() {
  loop();
}
