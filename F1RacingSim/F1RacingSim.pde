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
    if(c.getVelocity() != 0){
      Physics.driftSlow(c, 0.25, 0.10);
    }
    //Physics.resolve(c, 0.90, 0.68);
    //Physics.driftSlow(c, 0.90, 68);
		//System.out.println("X: " + c.getX());
		//System.out.println("Y: " + c.getY());
	}
	fill(0);
	textSize(20);
	text("FPS: "+frameRate,0,20);
	System.out.println(cars.get(0).toString());
}

void keyPressed() {
  if(keyCode == 32){
    for(Car c: cars){
      Physics.driftSlow(c, 0.90, 0.68);
    }
  }
	//System.out.println("" + keyCode);
	if(keyCode == 39){
		for(Car c : cars){
			c.shiftAngle(Math.PI/2);
			//c.setFrontForce(10);
			float acc = Physics.resolve(c, 0.90, 0.68);
			float facingAngle = c.getAngle();
			//System.out.println("" + c.getAngle());
			//System.out.println("" + c.getVelocity());
			float speed = c.getVelocity();
			float moveAngle = c.getMoveAngle();
			float[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
			c.setVelocity(newMoveVector[0],newMoveVector[1]);
			//System.out.println("" + newMoveVector[0]);
			//System.out.println("" + newMoveVector[1]);
			//System.out.println("-------");

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
	drive(c);
}

void keyReleased() {
  keyPressed = false;
}

/**
	*@param c The car being driven.
	*@postcondition The car has accelerated and turned.
*/
void drive(Car c) {
	float acceleration = 0;
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
		for(Car c : cars){
			//c.shiftAngle((float)Math.PI/2);
			c.setFrontForce(-10);
			float acc = Physics.resolve(c, 0.90, 0.68);
			float facingAngle = c.getAngle();
			//System.out.println("" + c.getAngle());
			//System.out.println("" + c.getVelocity());
			float speed = c.getVelocity();
			float moveAngle = c.getMoveAngle();
			float[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
			c.setVelocity(newMoveVector[0],newMoveVector[1]);
			//System.out.println("" + newMoveVector[0]);
			//System.out.println("-------");
		}
	}
	if(keyCode == 37){
		for(Car c : cars){
			c.shiftAngle(-Math.PI/2);
			//c.setFrontForce(10);
			float acc = Physics.resolve(c, 0.90, 0.68);
			float facingAngle = c.getAngle();
			//System.out.println("" + c.getAngle());
			//System.out.println("" + c.getVelocity());
			float speed = c.getVelocity();
			float moveAngle = c.getMoveAngle();
			//System.out.println("Acc:" + acc);
			//System.out.println("facing angle:" + facingAngle);
			float[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
			//System.out.println("" + newMoveVector[0]);
			//System.out.println("" + newMoveVector[1]);
			c.setVelocity(newMoveVector[0],newMoveVector[1]);
			//System.out.println("-----");
		}
	}
	if(keyCode == 38){
		for(Car c : cars){
			//c.shiftAngle(Math.PI*1.5);
			c.setFrontForce(10);
			float acc = Physics.resolve(c, 0.90, 0.68);
			float facingAngle = c.getAngle();
			//System.out.println("" + c.getAngle());
			//System.out.println("" + c.getVelocity());
			float speed = c.getVelocity();
			float moveAngle = c.getMoveAngle();
			float[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
			c.setVelocity(newMoveVector[0],newMoveVector[1]);
			//System.out.println("" + newMoveVector[0]);
			//System.out.println("-------");
		}
		c.setFrontForce(10);
		theta += Math.PI;
		acceleration = Physics.resolve(c, t);
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
