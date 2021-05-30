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
	game1.display();
}


//class of the circle that we are playing as
class sharik
{
	int x,y,vx,vy; //coordinates and velocity
	String dir;  //direction
	int radius;  //radius for distance calculation


	sharik() //how it looks at the start
	{
		x = 30;
		vx = 0;
		vy = 0;
		y = 30;
		dir = "none";
		radius = 20;
	}

	void update()    //to update the info all the time
	{
		if (dir == "right") vx = 5;   //so it moves to right and so on the others
		else if (dir == "left") vx = - 5;
		else if (dir == "down") vy = 5;
		else if (dir == "up") vy = - 5;
		else {
			vx = 0;
			vy = 0;
		}
		x = x + vx;
		y = y + vy;

		//those below are needed to make an effect as the snake or as in pac man
		if (y<0) y = height;
		if (y>height) y = 0;
		if (x<0) x = width;
		if (x>width) x = 0;
	}

	//dispaying everything and updating in it
	void display() 
	{
		stroke(0);
		fill(210.124,123);
		ellipse(x,y,radius,radius);
		update();
	}

	//this is for collision detection
	double distance(fruit other)
	{
		return Math.pow((Math.pow((x - other.x),2) + Math.pow((y-other.y),2)),0.5);
	}
}

//class of the 'enemy' or a 'fruit' that will be taken. if it is white, you can't eat it, if it is another color, it is okay.
class fruit
{
	int x, y, radius, badorgood; //badorgood is needed for random and if the fruit is good or not
	boolean bad;

	fruit()
	{
		x = round(random(16,484)); //random coordinates where it will be placed
		y = round(random(16,484));
		radius = 15;
		badorgood = round(random(0,2));
	}

	void display() { //just stacnding at one point and having a color
		stroke(0);
		if (badorgood == 0) {
			bad = true;
			fill(123*2,123*2,123*2);
		}
		else {
			bad = false;
			fill(123,123,123);
		}
		ellipse(x,y,radius,radius);
	}
}

class gamee											//GAME CLASS and how everything will work
{
	int score, timepast;							//timepast is needed to autodestroy 'bad fruit' after some time and score is just for score.
	sharik ball;
	fruit enemy;
	boolean alive;
	gamee()											//declaration of everything, if we hit the 'bad fruit' alive will become false.
	{
		score = 0;
		ball = new sharik();
		enemy = new fruit();
		timepast = frameCount;
		alive = true;
	}

	void update()									//updating info
	{
		if (ball.distance(enemy) < (ball.radius + enemy.radius)/2) {  //if collision happens, it checks
			if (enemy.bad) {										  //if it was a 'bad fruit' ball dies
				alive = false;
			}
			else {													  //if it is a 'good fruit' score increments and new fruit creates
				enemy = new fruit();
				timepast = frameCount;
				score++;
			}
		}
	}

	void display()
	{
		if (alive == false) {						//end screen when the ball dies
			fill(255);
			rectMode(CENTER);
			rect(250,250,100,100);
			fill(143,224,99);
			textSize(33);
			textAlign(CENTER, CENTER);
			text(score, 250, 250);
			return;
		}

		else {										//updating everything
			update();
			ball.display();
			enemy.display();
			fill(0);
			textSize(18);
			text(score,20,30);
			if (enemy.bad && (frameCount-timepast)%240 == 0) { //
				enemy = new fruit();
				timepast = frameCount;
			}
		}
	}
}

//If some of the keys are pressed something changes, the direction changes
void keyPressed() {
	if(key == CODED){

		if(keyCode == LEFT){
			game1.ball.dir = "left";
		}
		else if(keyCode == RIGHT){
			game1.ball.dir = "right";
		}
		else if(keyCode == DOWN){
			game1.ball.dir = "down";
		}
		else if(keyCode == UP) {
			game1.ball.dir = "up";
		}
		else game1.ball.dir = "none";
	}
}
//If the keys are released, then the ball stops
void keyReleased() {
	game1.ball.dir = "none";
}
