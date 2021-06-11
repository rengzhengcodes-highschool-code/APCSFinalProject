import java.util.HashMap;
import java.util.Random;
int playerTire = 1;
int playerAgro = 10;
boolean race = false;
float playerMass = 900;
int playerTopSpeed = 10;
float playerWheelLength = 8;
//map start characteristics
//String map = "Zandvoort";//the map you load
Random rng = new Random();
String map = "Baku";//the map you load
HashMap<String, float[][]> mapStartPosses = new HashMap<String, float[][]>();
FloatDict mapStartAngles = new FloatDict();
FloatDict mapRelGrips = new FloatDict();
FloatDict mapRelTireWear = new FloatDict();
//final float meterToPixelRatio = 1/0.6;//1 px over 0.6 meter
//final float secondToFrameRatio = 120;// 20 frames over 1s
//ai Drivers
ArrayList<AIDriver> ais = new ArrayList<AIDriver>();;
//active track
Track t;
//the camera characteristics
TrackCamera tC = new TrackCamera();
byte cameraMode = 0;//which car is being followed
float scaleFactor = 5;//scaling when following a car.
int DEBUG = 0;

void mousePressed(){
	if(!race){
		if(mouseButton == LEFT){
			if(mouseX >= 20 && mouseX <= 120 && mouseY >= 40 && mouseY <= 90){
				race = true;
				float[][] positions = mapStartPosses.get(map);
				AIDriver ai = new AIDriver(playerAgro/10.0);
				Car c = new Car(positions[0][0], positions[0][1], playerMass,
				        playerTopSpeed/10.0, radians(360), 1, 2, playerWheelLength, mapStartAngles.get(map), 0,
				        mapStartAngles.get(map), 0, false, playerTire, ai, true);
				ai.setCar(c);
				ais.add(ai);
			}
			if(mouseX >= 170 && mouseX <= 220 && mouseY >= 100 && mouseY <= 125 && playerMass < 2000){
				playerMass += 10;
			}
			if(mouseX >= 170 && mouseX <= 220 && mouseY >= 125 && mouseY <= 150 && playerMass > 900){
				playerMass -= 10;
			}
			if(mouseX >= 170 && mouseX <= 220 && mouseY >= 160 && mouseY <= 185 && playerTopSpeed < 15){
				playerTopSpeed += 1;
			}
			if(mouseX >= 170 && mouseX <= 220 && mouseY >= 185 && mouseY <= 210 && playerTopSpeed > 5){
				playerTopSpeed -= 1;
			}
			if(mouseX >= 170 && mouseX <= 220 && mouseY >= 220 && mouseY <= 245 && playerWheelLength < 16){
				playerWheelLength += 1;
			}
			if(mouseX >= 170 && mouseX <= 220 && mouseY >= 245 && mouseY <= 270 && playerWheelLength > 3){
				playerWheelLength -= 1;
			}
			if(mouseX >= 170+70 && mouseX <= 290 && mouseY >= 280 && mouseY <= 305 && playerAgro < 50){
				playerAgro += 1;
			}
			if(mouseX >= 170+70 && mouseX <= 290 && mouseY >= 305 && mouseY <= 330 && playerAgro > 7){
				playerAgro -= 1;
			}
			if(mouseX >= 400 && mouseX <= 700 && mouseY >= 50 && mouseY <= 100){
				if(map.equals("Zandvoort")){
					map = "Monaco";
					ais.clear();
					setup();
				}else{
					if(map.equals("Monaco")){
						map = "Baku";
						ais.clear();
						setup();
					}else{
						map = "Zandvoort";
						ais.clear();
						setup();
					}
				}
			}
			if(mouseX >= 20 && mouseX <= 170 && mouseY >= 400 && mouseY <= 450){
				if(playerTire != 5){
					playerTire++;
				}else{
					playerTire = 1;
				}
			}
			//rect(20, 400, 150, 50);
		}
	}
}

void setup() {
	frameRate(120);
	size(1000, 800);
	defineStartPos();
	//giving the ais cars lined up at the right position
	float[][] positions = mapStartPosses.get(map);
	for (int i = 1; i < positions.length; i++) {
		AIDriver ai = new AIDriver();
		Car c = new Car(positions[i][0], positions[i][1], 900,
		        1.1 + (float)(Math.random()*0.4), radians(360), 1, 2, 8, mapStartAngles.get(map), 0,
		        mapStartAngles.get(map), 0, false, rng.nextInt(5) + 1, ai, false);
		ai.setCar(c);
		ais.add(ai);
	}
	//creates track
	t = new Track(mapRelGrips.get(map), mapRelTireWear.get(map), loadImage(map + ".png"), loadImage(map + "BW.png"));
}

void defineStartPos() {
	mapStartPosses.put("Monaco", new float[][] {
		{225, 200},
		{215, 210},
		{205, 220},
		{195, 230},
		//{185, 240},
		//{175, 250},
		//{165, 260},
		//{155, 270},
		//{145, 280},
		//{135, 290}
	});
	mapStartAngles.set("Monaco", radians(-50));
	mapRelGrips.set("Monaco", 0.8);//https://www.mclaren.com/racing/2017/monaco-grand-prix/track-tips-and-circuit-stats/. Info from the pirelli site below suggests its the lowest grip of the year, and thus has been docked another 0.1
	mapRelTireWear.set("Monaco", 0.7);//https://www.pirelli.com/tyres/en-gb/motorsport/f1/calendar-and-circuits/monte-carlo-grandprix

	mapStartPosses.put("Zandvoort", new float[][] {
		{260, 300},
		{255, 310},
		{250, 320},
		{245, 330}
	});
	mapStartAngles.set("Zandvoort", radians(-65));
	mapRelGrips.set("Zandvoort", 1);//Zandvoort has high grip due to its turns and the new rebuild of the track. However, actual stats aren't out yet, so for now it remains 1.
	mapRelTireWear.set("Zandvoort", 1);//https://www.formula1.com/en/latest/article.pirelli-explain-zandvoort-special-tyre-tests-in-barcelona.7l3hXIScig3wVqIxVuydDG.html. Pirelli developed special tires to compensate for Zandvoort's abnormal track conditions, so we're standardizing the dist traveled to assume they compensated for that.

	mapStartPosses.put("Baku", new float[][] {
		{860, 320},
		{850, 322},
		{840, 324},
		{830, 326},
	});
	mapStartAngles.set("Baku", radians(-15));
	mapRelGrips.set("Baku", 0.9);//https://www.mclaren.com/racing/2017/azerbaijan-grand-prix/track-tips-and-circuit-stats/
	mapRelTireWear.set("Baku", 1.3);//Baku 2021 had explosive tires for 2 people and Hamilton overheating his tires due to a misplay. This means 1) Google SEO makes the info incredibly hard to find the actual tire wear levels since its all speculation as to changes in Baku's condition and 2) High tire wear seems appropriate given this is simulating 2021 rules.
}

void draw() {
	if(!race){
		fill(255);
		rect(20, 40, 100, 50);
		fill(0);
		textSize(20);
		text("start race",25,70);

		fill(255);
		rect(20, 100, 150, 50);
		fill(0);
		textSize(20);
		text("Mass: "+playerMass,25,130);

		fill(255);
		rect(170, 100, 50, 25);
		fill(0);
		textSize(20);
		text("More",170,117);

		fill(255);
		rect(170, 125, 50, 25);
		fill(0);
		textSize(20);
		text("Less",170,142);

		fill(255);
		rect(20, 160, 150, 50);
		fill(0);
		textSize(20);
		text("Top Speed: "+playerTopSpeed/10.0,23,190);

		fill(255);
		rect(170, 160, 50, 25);
		fill(0);
		textSize(20);
		text("More",170,177);

		fill(255);
		rect(170, 185, 50, 25);
		fill(0);
		textSize(20);
		text("Less",170,202);

		fill(255);
		rect(20, 220, 150, 50);
		fill(0);
		textSize(20);
		text("Car Length: "+playerWheelLength,23,250);

		fill(255);
		rect(170, 220, 50, 25);
		fill(0);
		textSize(20);
		text("More",170,237);

		fill(255);
		rect(170, 245, 50, 25);
		fill(0);
		textSize(20);
		text("Less",170,262);

		fill(255);
		rect(20, 220+60, 150+70, 50);
		fill(0);
		textSize(20);
		text("Driver agression: "+playerAgro/10.0,23,250+60);

		fill(255);
		rect(170+70, 220+60, 50, 25);
		fill(0);
		textSize(20);
		text("More",170+70,237+60);

		fill(255);
		rect(170+70, 245+60, 50, 25);
		fill(0);
		textSize(20);
		text("Less",170+70,262+60);

		fill(255);
		rect(400, 50, 300, 50);
		fill(0);
		textSize(20);
		text("Track: "+map, 405, 85);

		fill(0);
		textSize(20);
		text("Top Speed controls the maximum output of your car. \nMass is the car's mass in kg."+
		" \nLength controlls how the physics engine sees your car."+
		"\nThe longer it is, the less manuverable it is,"+
		"\nbut it is also less likely to get run off the track."+
		"\nYou can click on the tires or the track to cycle through them."+
		"\nThe softer the tires are, the less distance they can handle,"+"\nbut they have more grip.", 350, 200);

		fill(255);
		rect(20, 400, 150, 50);
		fill(0);
		textSize(20);
		if(playerTire == 1){
			text("Tire: ultra soft",23,430);
		}else{
			if(playerTire == 2){
				text("Tire: super soft",23,430);
			}else{
				if(playerTire == 3){
					text("Tire: Soft",23,430);
				}else{
					if(playerTire == 4){
						text("Tire: Medium",23,430);
					}else{
						text("Tire: Hard", 23, 430);
					}
				}
			}
		}
	}else{
		frameRate(120);
		background(200);
		fill(0);
		pushMatrix();
		Car tracked = null;
		if (cameraMode != 0) {//If camera is not in default track view.
			try {
				tracked = ais.get(cameraMode - 1).getCar();
				tC.trackCar(tracked);
			} catch (IndexOutOfBoundsException e) {
				System.out.println("There is no driver " + cameraMode);
				cameraMode = 0;
				for(AIDriver ai : ais){
					Car c = ai.getCar();
					c.setSize(0.07);
				}
			}
		}

		t.display();
		for(AIDriver ai : ais) {
			Car c = ai.getCar();
			ai.drive();
			c.move(ais);
			c.display();
			if (DEBUG != 0 && (cameraMode > ais.size() || cameraMode == 0)) {
				c.displayDEBUG();
			}
			if (DEBUG != 0) ai.displayLineOfSight();
		}
		popMatrix();

		textSize(20);
		textAlign(LEFT, TOP);
		text("FPS: "+frameRate,0,0);

		if (tracked != null) {
			tracked.focusDEBUG();
		}

		for (AIDriver ai : ais) {
			Car c = ai.getCar();
			if(c.getVelocity() != 0) {
				Physics.driftSlow(c, 0.25, 0.10);
			}
		}
	}
}

void keyPressed() {
	if (48 <= keyCode && keyCode <= 57) {
		cameraMode = Byte.parseByte("" + key);//if the key pressed is a number, set the cameramode to the key pressed
		for(AIDriver ai : ais){
			Car c = ai.getCar();
			c.setSize(0.03);
		}
	}

	if (key == 'd') DEBUG = (DEBUG + 1) % 4;
}
