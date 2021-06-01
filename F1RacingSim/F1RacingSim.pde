ArrayList<AIDriver> ais;
Track t;
TrackCamera tC = new TrackCamera();
byte cameraMode = 0;
void setup() {
	size(1000, 800);
	ais = new ArrayList<AIDriver>();
	ais.add(new AIDriver());
	for (int i = 1; i < 4; i++) {
		Car c = new Car(225 - i * 10, 200 + i * 10, 900,
										2, radians(-50), 0,
										radians(-50), 0, false);
		AIDriver ai = new AIDriver();
		ai.setCar(c);
		ais.add(ai);
	}
	t = new Track(0.9, 0.68, 0, loadImage("Monaco.png"), loadImage("MonacoBW.png"));
}

void draw() {
	background(200);
	if (cameraMode != 0) {//If camera is not in default track view.
		try {
			Car tracked = ais.get(cameraMode - 1).getCar();
			tC.trackCar(tracked);
		} catch (IndexOutOfBoundsException e) {
			System.out.println("There is no driver " + cameraMode);
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

	fill(0);
	textSize(20);
	text("FPS: "+frameRate,0,20);
}
/**
	*@param c The car being driven.
	*@postcondition The car has accelerated and turned.
*/
void keyPressed() {
	if (48 <= keyCode && keyCode <= 57) cameraMode = Byte.parseByte("" + key);//if the key pressed is a number, set the cameramode to the key pressed
}
