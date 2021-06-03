public class Car{
	private boolean skid;
	private float xCor;
	private float yCor;
	//changeable vars
	private float mass;
	private float topSpeed;
	private float handling;//the max degrees you can turn in a frame
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
	/**
		*@param x X coord of the car.
		*@param y Y coord of the car.
		*@param m Mass of the car.
		*@param tS Top speed of the car.
		*@param h The max turning angle per frame in radians.
		*@param a Starting angle of the car in radians.
		*@param fS Front force of the car.
		*@param dA moveAngle The starting angle delta.
		*@param dS The starting velocity.
		*@postcondition The instance variables are set.
	*/
	public Car(float x, float y, float m,
						 float tS, float h, float a, float fS,
						 float dA, float dS, boolean skd) {
		car.resize((int)(0.07*car.width), (int)(0.07*car.height));
		xCor = x;
		yCor = y;
		mass = m;
		topSpeed = tS;
		handling = h;
		angle = a;
		frontForce = fS;
		moveAngle = dA;
		velocity = dS;
		skid = skd;
	}
	/**The default car constructor.
	*/
	public Car() {
		this(225, 200, 900,
		     2, radians(360), radians(-50), 0,
				 radians(-50), 0, false);
	}

	public void display() {
		pushMatrix();
		translate(xCor, yCor);
		rotate(angle + (float)Math.PI/2);
		imageMode(CENTER);
		image(car, 0, 0);
		popMatrix();
	}
	/*Set methods. Self explanatory*/
	public void setFrontForce(float acc) {
		frontForce = acc;
	}

	public void setVelocity(float mag, float theta) {
		velocity = mag;
		moveAngle = theta;
	}
	/*Movement methods*/
	/**
		*@param theta The angle you want to shift the car to.
	*/
	public void turn(float theta) {
		if (Math.abs(theta - angle) > handling) theta = angle + handling * Math.signum(theta - angle);
		angle = theta;
	}
	/**
		*@postcondition Car moves by its given velocity vector.
	*/
	public void move() {
		if(velocity > topSpeed){
			velocity = topSpeed;
		}
		float[] shift = CartesianPolarMath.polarToCartesian(velocity, moveAngle);
		xCor += shift[0];
		yCor += shift[1];

		screenEdgeDetection();
	}
	/**
		*@param mag The magnitude of the acceleration.
		*@param theta The direction of the acceleration.
		*@postcondition Velocity changes according to the acceleration vector.
	*/
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
	public float getHandling() {
		return handling;
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

	public boolean isSkidding() {
		return skid;
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
			angle = moveAngle + (float)Math.PI;
			angle %= 2*Math.PI;
			velocity = 0;
		}
	}

	public String toString() {
		return "Coords: (" + xCor + ", " + yCor + ") | Velocity: ("
						+ velocity + ", " + moveAngle + ") | Car Angle: " + angle +
						" frontForce: " + frontForce;
	}
}
