ArrayList<Car> cars;
Track t;
boolean keyPressed = false;
void setup() {
	size(1000, 800);
	cars = new ArrayList<Car>();
	cars.add(new Car());
	t = new Track(1, 0.8, 0, loadImage("Monaco.png"));
}

void draw() {
	background(200);
	t.display();
	for(Car c : cars) {
		c.move();
		c.display();
		decelerateCar(c);
		//System.out.println("X: " + c.getX());
		//System.out.println("Y: " + c.getY());
	}
	fill(0);
	textSize(20);
	text("FPS: "+frameRate,0,20);
	System.out.println(cars.get(0).toString());
}

void decelerateCar(Car c) {
	float acceleration = Physics.resolve(c, t);
	if (!keyPressed) {//if its not currently accelerating
		if (c.getVelocity() > acceleration) {//if the velocity is greater than a tenth of the front force
			c.accelerate(-acceleration, c.getMoveAngle());//apply currently arbitrary drag acceleration.
		} else {//if not, set the acceleration to 0
			c.setVelocity(0, c.getMoveAngle());
		}
	}
}

void keyPressed() {
	Car c = cars.get(0);
	keyPressed = true;
	c.setFrontForce(10);
	float theta = c.getAngle();
	System.out.println("" + keyCode);
	if(keyCode == 38) {
		c.setFrontForce(10);
		acceleration = Physics.resolve(c, t);
	}
	if(keyCode == 39) {
		theta += radians(10);
	}
	if(keyCode == 40){
		c.setFrontForce(10);
		theta += Math.PI;
		acceleration = Physics.resolve(c, t);
	}
	if(keyCode == 37){
		theta -= radians(10);
	}

	theta %= 2*Math.PI;
	float[] newV = Physics.addVector(c.getVelocity(), c.getMoveAngle(), acceleration, theta);
	c.setVelocity(newV[0], newV[1]);
	c.setAngle(theta);
}

void keyReleased() {
  keyPressed = false;
}
