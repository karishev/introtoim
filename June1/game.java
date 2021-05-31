//this import math is neded for the power
import java.lang.Math;

//declating the game class
gamee game1;

//setting up the screen
void setup()

{

	size(500,500);
	game1 = new gamee();
}

//srawing everything
void draw() 
{
	frameRate(60);
	background(123,135,132);  
	int divisions = 20;
	size(500, 500);
	int xSteps = width/divisions;
	int ySteps = height/divisions;

	for (int x = 0; x < width; x += xSteps) {
		for (int y = 0; y < height; y += ySteps) {

		// horizontal lines go from x=0 to x=width but at different y locations
			line(0, y, width, y);

		// Vertical lines go from y=0 to y=height but at different x locations
			line(x, 0, x, height);
		}
	}
	game1.display();
}




//class of the circle that we are playing as
//it is same as I have sent it yesterday, just added a function to calculate the distance between block to snake
class snake
{
	float x,y,vx,vy; //coordinates and velocity
	String dir;  //direction
	int radius;  //radius for distance calculation
	int colorr;
	String prevdir;


	snake(float xpos, float ypos, String direction, int col) //how it looks at the start
	{
		x = xpos;
		vx = 0;
		vy = 0;
		y = ypos;
		dir = direction;
		radius = 25;
		colorr = col;
	}

	void update()    //to update the info all the time
	{

		if (dir == "right" && frameCount%10 == 0 ) {
			vx = 25;
			vy = 0;
			
		}
		//so it moves to right and so on the others
		else if (dir == "left" && frameCount%10 == 0 ) {
			vx = - 25;
			vy = 0;
		}
		else if (dir == "down" && frameCount%10 == 0 ) {
			vy = 25;
			vx = 0;
		}
		else if (dir == "up" && frameCount%10 == 0 ) {
			vy = - 25;
			vx = 0;
		}

		//slowdown the game
		if (frameCount%10 == 0) {
			// game1.updatedirections();
			game1.updatedirections();
			x = x + vx;
			y = y + vy;
			
		}

		//those below are needed to make an effect as the snake or as in pac man
		if (y<0) y = height-12.5;
		if (y>height) y = 12.5;
		if (x<0) x = width-12.5;
		if (x>width) x = 12.5;
	}

	//dispaying everything and updating in it
	void display() 
	{
		stroke(0);
		fill(colorr,124,123);
		rectMode(CENTER);
		rect(x,y,radius,radius);
		update();
	}

	//this is for collision detection
	double distancefood(fruit other)
	{
		return Math.pow((Math.pow((x - other.x),2) + Math.pow((y-other.y),2)),0.5);
	}
	double distancetail(block other)
	{
		return Math.pow((Math.pow((x - other.x),2) + Math.pow((y-other.y),2)),0.5);
	}
}

//class of 'fruit' that will be taken.
class fruit
{
	float x, y, radius;

	fruit()
	{
		x = round(random(1,19)); //random coordinates where it will be placed
		y = round(random(1,19));
		x = 25*x+12.5;
		y = 25*y + 12.5;
		radius = 15;
	}

	void display() { //just stacnding at one point and having a color
		stroke(0);
		fill(123,123,123);
		ellipse(x,y,radius,radius);
	}
}

class block //tail of the snake 
{
	float x, y;

	block(float xpos, float ypos)
	{
		x = xpos;
		y = ypos;
	}

	void display()
	{
		stroke(0);
		fill(0,123,123);
		rectMode(CENTER);
		rect(x,y,25,25);
	}


}

class gamee                      //GAME CLASS and how everything will work
{
	int score;     				 
	snake ball;  				//it was called ball from yesterday's assignment, so I left him that way
	fruit food;
	block[] snakearray; 
	boolean alive;
	gamee()                      //declaration of everything, if we hit the 'bad fruit' alive will become false.
	{
		score = 0;
		ball = new snake(12.5,12.5, "right", 210);
		snakearray = new block[10];
		food = new fruit();
		alive = true;
	}

	void updatecollisions()                  //updating info
	{
		if (ball.distancefood(food) < (ball.radius + food.radius)/2) {  //if collision happens, it checks
			snakearray[score] = new block(700,700); //so it can't be seen and we put it on score, because score represents how many fruits were eaten so , how many blocks we got
			food = new fruit();	//so the new food generates, if we have eaten one
			score++;
			resizearray();
		}
		for (int i = 0; i<score; i++) {
			if (ball.distancetail(snakearray[i]) < 25) { //if we touch our tail, the game ends
				alive = false;
			}
		}
	}

	void display()
	{
		if (alive == false) {            //end screen when the snake dies
			fill(255);
			rectMode(CENTER);
			rect(250,250,100,100);
			fill(143,224,99);
			textSize(33);
			textAlign(CENTER, CENTER);
			text(score, 250, 250);
			return;
		}

		else {                    //updating everything
			updatecollisions();
			ball.display();
			if (score>0){
				for (int i = 0; i < score; i++) {
					snakearray[i].display();
				}
			}
			food.display();
			fill(0);
			textSize(18);
			text(score,20,30);
		}
	}
	void resizearray() //we just resize the array of tails, so if the length is as the size, we need to resize it
	{
		if (snakearray.length <= score+1) {
			block[] sarray1 = new block[2*score];
			for (int i = 0; i < snakearray.length; i++) {
				sarray1[i] = snakearray[i];
			}
			snakearray = sarray1;
		}
	}
	void updatedirections() //I worked at this function the most. At the end I just left it the way, that the next block goes to the position of the previous.
	//it seems like there was nothing to do, but at the start I was trying to do something with the directions, as I didn't use the block class and used the snake class.
	//some of the work could be seen in the comments.
	{
		// String temp = snakearray[0].dir;
		// if (score>0) snakearray[1].dirsnakearray[0].dir  // String yes;
		// int i = 0;
		// while (i<score) {
		//   snakearray[i+1].dir = snakearray[i].dir;
		//   snakearray[i].dir = snakearray[i].dir;
		//   i++;
		// }
		// String temp;
		// for (int i = 0; i<score; i++) {
		//   if (snakearray[i+1].dir != snakearray[i].dir) {
		//     temp = snakearray[i+1].dir;
		//     wheretoput(snakearray[i], snakearray[i+1]);
		//     snakearray[i+1].dir = temp;
		//   }
		//   else snakearray[i].dir = snakearray[i].dir;
		// }

		float xtemp, ytemp, xtemp1, ytemp1;

		xtemp = ball.x;
		ytemp = ball.y;
		
		for (int i = 0; i < score; i++) {
			xtemp1 = snakearray[i].x;
			ytemp1 = snakearray[i].y;
	
			snakearray[i].x = xtemp;
			snakearray[i].y = ytemp;

			xtemp = xtemp1;
			ytemp = ytemp1;
		}

		// String dirtemp;

		// for (int i = 0; i < score; i++) {

		//   if (snakearray[i].x - snakearray[i+1].x > 25) {
		//     snakearray[i+1].x = snakearray[i].x - 25;
		//     snakearray[i+1].dir = "right";
		//   }
		//   else if (snakearray[i].x - snakearray[i+1].x < 25) {
		//     snakearray[i+1].x = snakearray[i].x + 25;
		//     snakearray[i+1].dir = "left";
		//   }
			
		//   else if (snakearray[i].y - snakearray[i+1].y > 25) {
		//     snakearray[i+1].y = snakearray[i].y - 25;
		//     snakearray[i+1].dir = "down";
		//   }
		//   else if (snakearray[i].y - snakearray[i+1].y < 25) {
		//     snakearray[i+1].y = snakearray[i].y + 25;
		//     snakearray[i+1].dir = "up";
		//   }
		
		// }

	}
}

//If some of the keys are pressed something changes, the direction changes
//You can't go the oposite direction from where you were.
void keyPressed() {
	if(key == CODED){
		game1.ball.prevdir = game1.ball.dir;
		if(keyCode == LEFT && game1.ball.prevdir != "right"){
			game1.ball.dir = "left";
		}
		if(keyCode == RIGHT && game1.ball.prevdir != "left"){
			game1.ball.dir = "right";
		}
		if(keyCode == DOWN && game1.ball.prevdir != "up"){
			game1.ball.dir = "down";
		}
		if(keyCode == UP && game1.ball.prevdir != "down") {
			game1.ball.dir = "up";
		}
	}
}