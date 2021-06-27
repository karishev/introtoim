import java.util.ArrayList;
import java.util.Iterator;
import processing.serial.*;

class Tile {														//Tile class declaration
	float x, y, w, h, vy;
	Boolean touched;

	Tile(float xpos, float ypos, int speed) {
		x = xpos;
		y = ypos;		
		w = width/4;
		h = height/3.5;
		vy = speed;
		touched = false;
	}

	void update() {
		y += vy;

		if (y>600 && y <= 900) {									//in this are you can touch the tiles only and it checks
			touchchecker(this);
		}		
	}

	void display() {
		update();

		if (touched) fill(204,0,255);
		else fill(0,0,0);
		
		rect(x, y, w, h);
	}
}

	
class Game {														//Game class declaration
	ArrayList<Tile> tiles;
	ArrayList<Boolean> keys;										//keys for understanding which tile/row is pressed 
	Boolean gameover, pause;
	int tilespeed;
	float score;
	PImage backgroundImage;


	Game() {
		tiles = new ArrayList<Tile>();
		keys = new ArrayList<Boolean>();
		keys.add(false); 
		keys.add(false);
		keys.add(false);
		keys.add(false);
		tilespeed = 6;
		tiles.add(new Tile(0,-height/3.5, tilespeed));				//tilespeed is needed if in fututre I will implement the game faster after some levels
		gameover = false;
		pause = true;
		score = 0;
		backgroundImage = loadImage("background.jpg");
		backgroundImage.resize(width, height);
	}

	void display() {

		if (pause) {																//pause and start screen
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

		else if (!pause && !gameover) {												//game screen
			strokeWeight(0);
			image(backgroundImage,0,0);
			strokeWeight(1);
			stroke(0 ,0 ,0);
			line(width/4, 0, width/4, height);
			line(2*width/4, 0, 2*width/4, height);
			line(3*width/4, 0, 3*width/4, height);
			strokeWeight(0.3);
			stroke(125,125,125);
			line(0,600,width,600);
			update();
			for (Tile t : tiles) {
				t.display();
			}
			fill(255, 130, 2);
			textAlign(CENTER, CENTER);
			textSize(40);
			text("Score: "+str(int(score)), width/2, 60);

		}

		else if (gameover) {														//gameover screen
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

	void update() {
		int last = tiles.size() - 1;
		if (tiles.get(last).y >= -1) {
			int row = int(random(0,4));
			while (tiles.get(last).x == width/4*row) {
				row = int(random(0,4));
			}
			tiles.add(new Tile(width/4*row, -height/3.5, tilespeed));
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
		score += 0.08;

		// if(score > 200 && score < 400) tilespeed = 9;
		// else if (score > 400) tilespeed = 10;
	}
}

void touchchecker(Tile given) {														//checking if the tile is pressed by the buttons in arduino
	int row = int(given.x*4/width);
	for (int i = 0; i<game.keys.size(); i++) {
		if (game.keys.get(i) == true && row == i) {
			given.touched = true;
		}
		else if (game.keys.get(i) == true && row != i) {
			game.gameover = true;
		}
	}
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


// void keyPressed() {
// 	if (key == 'q' || key == 'Q') {
// 		game.keys.set(0,true);
// 	}
// 	else if (key == 'w' || key == 'W') {
// 		game.keys.set(1,true);
// 	}
// 	else if (key == 'e' || key == 'E') {
// 		game.keys.set(2,true);
// 	}
// 	else if (key == 'r' || key == 'R') {
// 		game.keys.set(3,true);
// 	}
// }

// void keyReleased() {
// 	if (key == 'q' || key == 'Q') {
// 		game.keys.set(0,false);
// 	}
// 	else if (key == 'w' || key == 'W') {
// 		game.keys.set(1,false);
// 	}
// 	else if (key == 'e' || key == 'E') {
// 		game.keys.set(2,false);
// 	}
// 	else if (key == 'r' || key == 'R') {
// 		game.keys.set(3,false);
// 	}

// 	if ((key == 't'|| key == 'T') && !game.gameover) {									//if game is not ended we can pause it and at the start "start" it
// 		if (game.pause) game.pause = false;
// 		else game.pause = true;	
// 	}
// }

// void mousePressed() {
// 	if (game.gameover) {
// 		game = new Game();
// 		game.pause = false;
// 		frameCount = 0;
// 	}
// }

void serialEvent(Serial myPort){													//Basically made the sae logic as the code commented above with key pressed
	String s=myPort.readStringUntil('\n');											//if a button is pressed then one og the game.keys changes to true and therefore
	s=trim(s);																		//make one of the tiles touched or lose the game.
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

			if (values[4] == 1 && !game.gameover) {									//pause/start button
				if (game.pause) game.pause = false;
				else game.pause = true;	
			}

			if (values[4] == 1 && game.gameover) {									//if gameover, you can reset by pressing the same button as start

				game.tiles = new ArrayList<Tile>();
				game.keys = new ArrayList<Boolean>();
				game.keys.add(false); 
				game.keys.add(false);
				game.keys.add(false);
				game.keys.add(false);
				game.tilespeed = 6;
				game.tiles.add(new Tile(0,-height/3.5, game.tilespeed));
				game.gameover = false;
				game.pause = false;
				game.score = 0;
			
			}

		}
	}
	myPort.write(1+","+1+"\n");														//giving dummy variables to arduino, but possibly changing it to something else
																					//since the main logic of the game is to have some music when you press the tiles.
																					//So I am thinking on sending to arduino notes that should be played on the speaker.
}
