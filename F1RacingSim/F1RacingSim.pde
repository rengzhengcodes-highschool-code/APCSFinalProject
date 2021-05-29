ArrayList<Car> cars;
Track t;
boolean keyPressed = false;
void setup() {
  size(1000, 800);
  cars = new ArrayList<Car>();
  cars.add(new Car());
  t = new Track(0.9, 0.68, 0, loadImage("Monaco.png"));
}

void draw() {
<<<<<<< HEAD
  background(200);
  t.display();
  for(Car c : cars) {
    c.move();
    c.display();
    if(c.getVelocity() != 0) {
      Physics.driftSlow(c, 0.10, 0.05);
=======
	background(200);
	t.displayEdge();
	for(Car c : cars) {
		c.move();
		c.display();
    if(c.getVelocity() != 0) {
      Physics.driftSlow(c, 0.25, 0.10);
>>>>>>> de342deac596150bde63f4c1350570d0cc49584b
    }
    //Physics.resolve(c, t);
    //Physics.driftSlow(c, 0.90, 68);
<<<<<<< HEAD
    //System.out.println("X: " + c.getX());
    //System.out.println("Y: " + c.getY());
  }
  fill(0);
  textSize(20);
  text("FPS: "+frameRate,0,20);
  //System.out.println(cars.get(0).toString());
=======
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
>>>>>>> de342deac596150bde63f4c1350570d0cc49584b
}

//void decelerateCar(Car c) {
//  float acceleration = Physics.resolve(c, t);
//  if (!keyPressed) {//if its not currently accelerating
//    if (c.getVelocity() > acceleration) {//if the velocity is greater than a tenth of the front force
//      c.accelerate(-acceleration, c.getMoveAngle());//apply currently arbitrary drag acceleration.
//    } else {//if not, set the acceleration to 0
//      c.setVelocity(0, c.getMoveAngle());
//    }
//  }
//}

//void keyPressed() {
//  Car c = cars.get(0);
//  keyPressed = true;
//  drive(c);
//}

//void keyReleased() {
//  keyPressed = false;
//}

/**
  *@param c The car being driven.
  *@postcondition The car has accelerated and turned.
*/
<<<<<<< HEAD
void keyPressed() {
  for(Car c : cars){
  float acceleration = 0;
  float theta = c.getAngle();
  //System.out.println("" + keyCode);
  if(keyCode == 38) {
    c.setFrontForce(10);
    acceleration = Physics.resolve(c, t);
  }
  if(keyCode == 39) {
    theta += radians(45);
  }
  if(keyCode == 37){
    theta -= radians(45);
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
=======
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
	if(keyCode == 37){
		theta -= radians(10);
	}
	if (keyCode == 40) {
		c.setFrontForce(10);
		acceleration = -Physics.resolve(c, t);
	}

	if (acceleration == 0 && c.getVelocity() == 0) {//if both magnitudes are 0 CartesianPolarMath will return NaN when converting between the two because of how acos and asin work.
		c.setAngle(theta);
	} else {
		theta %= 2*Math.PI;
		float[] newV = Physics.addVector(c.getVelocity(), c.getMoveAngle(), acceleration, theta);
		c.setVelocity(newV[0], newV[1]);
		c.setAngle(theta);
	}
>>>>>>> de342deac596150bde63f4c1350570d0cc49584b
}
