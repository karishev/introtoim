
void setup() {
  size(1000, 1000);
  background(255);
  //CHIN
  smooth();
  stroke(0);
  curve(550, 650, 600, 650, 650, 500, 600, 500);
  noStroke();
  smooth();
  stroke(0);
  curve(500, 650, 500, 700, 600, 650, 600, 500);
  smooth();
  stroke(0);
  curve(450, 650, 400, 650, 350, 500, 400, 500);
  noStroke();
  smooth();
  stroke(0);
  curve(500, 650, 500, 700, 400, 650, 400, 500);
  
  //zone near the ears
  line(650,500,650,450);
  line(350,500,350,450);
  
  //HAIR
  curve(500,500,500,300,700,440,500,500);
  curve(500,500,500,300,700,400,500,500);
  curve(500,500,500,300,700,360,500,500);
  curve(500,500,500,300,700,320,500,500);
  curve(500,500,500,300,300,440,500,500);
  curve(500,500,500,300,300,400,500,500);
  curve(500,500,500,300,300,360,500,500);
  curve(500,500,500,300,300,320,500,500);
  line(500,300,500,350);
  
  //EYEBROWS
  strokeWeight(7);
  curve(500,450,400,450,470,460,500,590);
  curve(500,450,600,450,530,460,500,590);
  
  //EYES
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(428,474,40,30);
  ellipse(572,474,40,30);
  fill(0);
  ellipse(428,474,15,13);
  ellipse(572,474,15,13);
  noFill();
  
  //NOSE
  curve(500,530,494,520,486,550,484,540);
  curve(500,530,506,520,514,550,516,540);
  arc(488,560,20,20,PI/3, 3*PI/2.1);
  arc(512,560,20,20,-PI/2.4, 2*PI/3.1);
  line(494,568, 506, 568);
  
  //MOUTH
  line(451,618,549,618);   
}

//I used this function to find the coordinates
void draw() {
  frameRate(12);
  println(mouseX + " : " + mouseY);
}
