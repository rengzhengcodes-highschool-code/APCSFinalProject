ArrayList<AIDriver> ais;
Track t;
boolean keyPressed = false;
void setup() {
	size(1000, 800);
	ais = new ArrayList<AIDriver>();
	ais.add(new AIDriver());
	t = new Track(0.9, 0.68, 0, loadImage("Monaco.png"), loadImage("MonacoBW.png"), true);
}

void draw() {
	background(200);
	t.displayEdge();
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
	for(AIDriver ai : ais) {
		Car c = ai.getCar();
		float acceleration = 0;
		float theta = c.getAngle();
		//System.out.println("" + keyCode);
		if(keyCode == 38) {
			c.setFrontForce(10);
			acceleration = Physics.resolve(c, t);
		}
		if(keyCode == 39) {
			theta += radians(10);
		}
		if(keyCode == 37){
			theta -= radians(10);
		}
		if (acceleration == 0 && c.getVelocity() == 0) {//if both magnitudes are 0 CartesianPolarMath will return NaN when converting between the two because of how acos and asin work.
			c.setAngle(theta);
		} else {
			theta %= 2*Math.PI;
			float[] newV = Physics.addVector(c.getVelocity(), c.getMoveAngle(), acceleration, theta);
			c.setVelocity(newV[0], newV[1]);
			c.setAngle(theta);
		}
	}
}
