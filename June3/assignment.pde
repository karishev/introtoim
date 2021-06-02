//class rectangle that produces rectangles or ellipses
class rectangle
{
	float x,y,r,g,b,w,h,angle, speed; //all the attributes needed
	String figure;

	rectangle(String circleorrectangle) {		//making everything random, so we don't know how it would like from the beginning
		x = random(0,500);			
		y = random(0,500);
		w = random(10,200);
		h = random(10,200);
		r = random(0,256);
		g = random(0,256);
		b = random(0,256);
		angle = 0;
		speed = random(0,0.2);
		figure = circleorrectangle;				//this is needed to understand what to draw: rectangle or ellipse

	} 

	void spin()									//for spinning purposes
	{
		angle += speed;
	}

	void display()	
	{
		if (figure == "rect") {					//if rectangle was chosen
			rectMode(CENTER);
			stroke(0);
			fill(r,g,b);
			pushMatrix(); 
			translate(x, y);
			rotate(angle);
			rect(0, 0, w,h);
			popMatrix();
		}	
		else {									//if ellipse was chosen
			ellipseMode(CENTER);
			stroke(0);
			fill(r,g,b);
			pushMatrix(); 
			translate(x, y);
			rotate(angle);
			ellipse(0, 0, w,w+h);
			popMatrix();
		}
		spin();									//spin function
			
	}
		

}

rectangle[] rectangles;
int check;

void setup() {
	size(500,500);
	
	rectangles = new rectangle[40];
	for (int i = 0; i<40; i++) {
		check = round(random(0,2));
		if (check == 0) rectangles[i] = new rectangle("rect");
		else rectangles[i] = new rectangle("ellipse");
	}
}

void draw() {
	background(123,123,123);
	for (int i = 0; i<40; i++) {
		rectangles[i].display();
	}
}

void mousePressed() 							//If we press somewhere on the screen, the rotation will stop and figures will stay at onoe position.
{
	for (int i = 0; i<40; i++) {
		rectangles[i].speed = 0;
	}
}

void mouseReleased()							//If released, the rotation will start again.
{
	for (int i = 0; i<40; i++) {
		rectangles[i].speed = random(0,0.2);
	}
}
