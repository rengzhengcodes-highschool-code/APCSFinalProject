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
	private PImageProcessor rotateProcess = new PImageProcessor(
			new float[][] {
				{1./9, 1./9, 1./9},
				{1./9, 1./9, 1./9},
				{1./9, 1./9, 1./9}
			}
		);
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
		float scalingFactor = 0.5;
		imageMode(CENTER);
		PImage rotated = rotateProcess.rotate(car, angle + (float)Math.PI/2);
		rotated.resize((int)(rotated.width * scalingFactor), (int)(rotated.height * scalingFactor));
		image(rotated, xCor, yCor);
	}

	public void setFrontForce(float acc) {
		frontForce = acc;
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
	}

	public void setVelocity(float mag, float theta) {
		velocity = mag;
		moveAngle = theta;
	}

  public boolean isSkidding(){
    return skid;
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
}
