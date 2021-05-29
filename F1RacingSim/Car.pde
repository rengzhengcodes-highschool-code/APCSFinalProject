public class Car{
  private boolean skid;
  private float xCor;
  private float yCor;
  private float mass;
  private float topSpeed;
  //angle and magnitude of vector 1:
  //the direction the car is trying to go
  private float angle;
  private float frontForce;
  //angle and magnitude of vector 2:
  //the direction the car is actually moving
  //the velocity in m/s
  private float moveAngle;
  private float velocity;
  private PImage car = loadImage("RaceCar.png");//from https://www.vectorstock.com/royalty-free-vector/top-view-a-racing-car-vector-15938905
  private PImageProcessor rotateProcess = new PImageProcessor();
  /**
    *@param x X coord of the car.
    *@param y Y coord of the car.
    *@param m Mass of the car.
    *@param tS Top speed of the car.
    *@param a Starting angle of the car.
    *@param fS Front force of the car.
    *@param dA moveAngle The starting angle delta.
    *@param dS The starting velocity.
    *@postcondition The instance variables are set.
  */
  public Car(float x, float y, float m,
             float tS, float a, float fS,
             float dA, float dS, boolean skd) {
    xCor = x;
    yCor = y;
    mass = m;
    topSpeed = tS;
    angle = a;
    frontForce = fS;
    moveAngle = dA;
    velocity = dS;
    skid = skd;
  }
  /**The default car constructor.
  */
  public Car() {
		car.resize((int)(0.2*car.width), (int)(0.2*car.height));
    xCor = 200;
    yCor = 200;
    mass = 900;
    topSpeed = 10;
    angle = 0;
    frontForce = 0;
    moveAngle = 0;
    velocity = 0;
    skid = false;
  }

  public void display(float x, float y){}
  public void display() {
		pushMatrix();
    translate(xCor,yCor);
    rotate(angle + (float)Math.PI/2);
		imageMode(CENTER);
		image(car, 0, 0);
		popMatrix();
  }

  public void setFrontForce(float acc) {
    frontForce = acc;
  }

	public void setAngle(double theta) {
		angle = (float)theta;
	}

  public void shiftAngle(double theta) {
    angle += (float)theta;
  }

  public void move() {
    if(velocity > topSpeed){
      velocity = topSpeed;
    }
    float[] shift = CartesianPolarMath.polarToCartesian(velocity, moveAngle);
    xCor += shift[0];
    yCor += shift[1];

    System.out.println(CartesianPolarMath.cartesianToPolar(shift[0], shift[1])[0]);
    screenEdgeDetection();
  }

  public void setVelocity(float mag, float theta) {
    velocity = mag;
    moveAngle = theta;
  }

  public boolean isSkidding(){
    return skid;
  }

	public void accelerate(float mag, float theta) {
		float[] vector = Physics.addVector(velocity, moveAngle, mag, theta);
		this.setVelocity(vector[0], vector[1]);
	}

  /*Get Methods. Self explanatory*/
  public float getX() {
    return xCor;
  }
  public float getY() {
    return yCor;
  }
  public float getMass() {
    return mass;
  }
  public float getTopSpeed() {
    return topSpeed;
  }
  public float getAngle() {
    return angle;
  }
  public float getFrontForce() {
    return frontForce;
  }
  public float getMoveAngle() {
    return moveAngle;
  }
  public float getVelocity() {
    return velocity;
  }
  /**
    *prevents car from going off the edge of the screen
  */
  public void screenEdgeDetection() {
    boolean onEdge = false;
    if (xCor < 0) {//x axis detection
      xCor = 0;
      onEdge = true;
    } else if (xCor >= width) {
      xCor = width - 1;
      onEdge = true;
    }

		if (yCor < 0) {//y axis detection
			yCor = 0;
			onEdge = true;
		} else if (yCor >= height) {
			yCor = height - 1;
			onEdge = true;
		}

    if (onEdge) {
      moveAngle = -moveAngle;
      velocity = 0;
    }
  }

	public String toString() {
		return "Coords: (" + xCor + ", " + yCor + ") | Velocity: ("
						+ velocity + ", " + moveAngle + ") | Car Angle: " + angle +
						" frontForce: " + frontForce;
	}
}
