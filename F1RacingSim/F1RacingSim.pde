import java.util.Map;
//map start characteristics
String map = "Monaco";//the map you load
HashMap<String, float[][]> mapStartPosses = new HashMap<String, float[][]>();
FloatDict mapStartAngles = new FloatDict();
HashMap<String, float[]> mapFrictionCoeffs = new HashMap<String, float[]>();
//ai Drivers
ArrayList<AIDriver> ais = new ArrayList<AIDriver>();;
//active track
Track t;
//the camera characteristics
TrackCamera tC = new TrackCamera();
byte cameraMode = 0;//which car is being followed
float scaleFactor = 5;//scaling when following a car.
void setup() {
	size(1000, 800);
	defineStartPos();
	//giving the ais cars lined up at the right position
	float[][] positions = mapStartPosses.get(map);
	for (float[] position : positions) {
		Car c = new Car(position[0], position[1], 900,
										2, radians(360), 1, 2, mapStartAngles.get(map), 0,
										mapStartAngles.get(map), 0, false);
		AIDriver ai = new AIDriver();
		ai.setCar(c);
		ais.add(ai);
	}
	//creates track
	float[] frictionCoeffs = mapFrictionCoeffs.get(map);
	t = new Track(frictionCoeffs[0], frictionCoeffs[1], 0, loadImage(map + ".png"), loadImage(map + "BW.png"));
}

void defineStartPos() {
	mapStartPosses.put("Monaco", new float[][] {
		{225, 200},
		{215, 210},
		{205, 220},
		{195, 230},
	});
	mapStartAngles.set("Monaco", radians(-50));
	mapFrictionCoeffs.put("Monaco", new float[] {0.7, 0.4});//0.7 and 0.4 are default tire on asphalt coefficients, Monaco is a low grip track so IRL these are lower. It goes (statGrip, kenGrip)

	mapStartPosses.put("Zandvoort", new float[][] {
		{260, 300},
		{255, 310},
		{250, 320},
		{245, 330},
	});
	mapStartAngles.set("Zandvoort", radians(-65));
	mapFrictionCoeffs.put("Zandvoort", new float[] {0.8, 0.5});//Zandvoort has high grip due to its turns and the new rebuild of the track.
}

void draw() {
	background(200);
	fill(0);
	textSize(20);
	text("FPS: "+frameRate,0,20);

	if (cameraMode != 0) {//If camera is not in default track view.
		try {
			Car tracked = ais.get(cameraMode - 1).getCar();
			tC.trackCar(tracked);
		} catch (IndexOutOfBoundsException e) {
			System.out.println("There is no driver " + cameraMode);
			cameraMode = 0;
		}
	}

	t.display();
	for(AIDriver ai : ais) {
		Car c = ai.getCar();
		ai.drive();
		c.move();
		c.display();
		ai.displayLineOfSight();
		if(c.getVelocity() != 0) {
			Physics.driftSlow(c, 0.25, 0.10);
		}
	}
}
/**
	*@param c The car being driven.
	*@postcondition The car has accelerated and turned.
*/
void keyPressed() {
	if (48 <= keyCode && keyCode <= 57) cameraMode = Byte.parseByte("" + key);//if the key pressed is a number, set the cameramode to the key pressed
}
