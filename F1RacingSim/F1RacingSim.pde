import java.util.Map;

HashMap<String, float[]> maps = new HashMap<String, float[]>();
ArrayList<AIDriver> ais;
Track t;
TrackCamera tC = new TrackCamera();
byte cameraMode = 0;
float scaleFactor = 5;
String map = "Monaco";
void setup() {
	size(1000, 800);
	defineStartPos();
	//adding ais to sim
	ais = new ArrayList<AIDriver>();
	ais.add(new AIDriver());
	//giving the ais cars lined up at the right position
	float[] p1 = maps.get(map);
	for (int i = 1; i < 4; i++) {
		Car c = new Car(p1[0] - i * 10, p1[1] + i * 10, 900,
										2, radians(-50), 0,
										radians(-50), 0, false);
		AIDriver ai = new AIDriver();
		ai.setCar(c);
		ais.add(ai);
	}
	t = new Track(0.9, 0.68, 0, loadImage(map + ".png"), loadImage(map + "BW.png"));
}

void defineStartPos() {
	maps.put("Monaco", new float[] {225, 200});
	maps.put("Zandvoort", new float[] {1, 1});
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
