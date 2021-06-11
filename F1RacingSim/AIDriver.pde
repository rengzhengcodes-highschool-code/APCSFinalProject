public class AIDriver extends Driver {
	private float sightRange = 50;
	private final boolean DEBUG = false;

	public float findFrontWallDist() {
		return findWallAtAngleDist(0);
	}

	public float findLeftWallDist() {
		return findWallAtAngleDist(-radians(90)) -1;
	}

	public float findRightWallDist() {
		return findWallAtAngleDist(radians(90)) -1;
	}
	/**
		*@param angle Angle offset from move angle in radians.
	*/
	private float findWallAtAngleDist(float angle) {
		float theta = getCar().getMoveAngle();
		float[] boundPixelOffset = closestBound(sightRange, theta + angle, t.getTrackEdge());
		return dist(0, 0, boundPixelOffset[0], boundPixelOffset[1]);
	}

	public float[] closestBound(float visualRange, float angle, PImage bound) {
		Car c = getCar();
		float xOff = 0;
		float yOff = 0;

		for (int i = 0; i < visualRange; i++) {
			color boundColor = bound.get((int)(c.getX() + xOff),
			                   	        (int)(c.getY() + yOff));
			color matching = color(255);

			if ((pitting() || t.getTrackEdge().get((int)c.getX(), (int)c.getY()) == color(255, 0, 0))
				&& t.getTrackEdge().get((int)c.getX(), (int)c.getY()) != color(0, 0, 255)) {
				matching = color(255, 0, 0);
				boundColor = color(red(boundColor), 0, 0);//checks blue element is 255 to be passable. For pitting because pits are only red, and white has 255 red.
			} else {
				matching = color(0, 0, 255);
				boundColor = color(0, 0, blue(boundColor));
			}

			if (matching != boundColor) {
				return new float[] {xOff, yOff};
			} else {
				xOff += cos(angle);
				yOff += sin(angle);
			}
		}

		return new float[] {xOff, yOff};
	}

	public boolean pitting() {
		Car c = getCar();
		Tire tire = c.getTire();
		return tire.getMaxDist() - tire.getDistTraveled() < 5000;
	}

	public void displayLineOfSight() {
		Car c = getCar();
		for (int i = -1; i <= 1; i++) {
			float[] closestBound = closestBound(sightRange, c.getMoveAngle() + radians(90) * i, t.getTrackEdge());
			stroke(255, 0, 0);
			line(c.getX(), c.getY(), c.getX() + closestBound[0], c.getY() + closestBound[1]);
		}
	}

	public boolean pitLane() {
		Car c = getCar();

		for (int xOff = -1; xOff <= 1; xOff++) {
			for (int yOff = -1; yOff <= 1; yOff++) {
				color trackColor = t.getTrackEdge().get((int)(c.getX()) + xOff,
														(int)(c.getY()) + yOff);
				if (trackColor == color(255, 0, 0)) {
					return true;
				}
			}
		}
		return false;
	}

	public void drive() {
		Car c = getCar();
		if (pitLane() && pitting()) {
			c.changeTire();
			System.out.println("TIRE CHANGE");
		}//if you're pitting and in the pit lane, AKA getting a tire change
		/**distance between the car and the wall
		*/
		float d = findFrontWallDist();
		/**distance to leftWall
		*/
		float dL = findLeftWallDist();
		/**distance to rightWall
		*/
		float dR = findRightWallDist();

		float a = 0;
		float theta = c.getMoveAngle();


		float[] bound = closestBound(sightRange, theta, t.getTrackEdge());
		int turnDirection = 1;

		if (dL > dR) {//if my default assumption of you need to turn right is wrong, turn left.
			turnDirection = -1;//multiplier to make it turn the other way
		}

		boolean turned = false;
		float nuTheta = theta;
		if (d != 0) {
			for (float i = degrees(c.getHandling()); i > 0 && !turned;//the 17 is SUPER important. It was 10 originally and we had a lot of understeer. The i = 360 is to make sure it sweeps all 360 degrees.
			    i--) {
				nuTheta += radians(1) * turnDirection;
				bound = closestBound(sightRange, nuTheta, t.getTrackEdge());
				if (17 < dist(0, 0, bound[0], bound[1])) {
					turned = true;
					theta = nuTheta;
				}
			}
		} else {
			for (float i = degrees(c.getHandling()); i > 0 && !turned;//the 20 is SUPER important. It was 10 originally and we had a lot of understeer. The i = 360 is to make sure it sweeps all 360 degrees.
			    i--) {
				nuTheta += radians(1) * turnDirection;
				bound = closestBound(sightRange, nuTheta, t.getTrackEdge());
				if (20 < dist(0, 0, bound[0], bound[1])) {
					turned = true;
					theta = nuTheta;
				}
			}
		}
		//default acceleration speed
		c.setFrontForce(10);
		a = Physics.resolve(c, t);

		theta %= Math.PI * 2;
		if (a == 0 && c.getVelocity() == 0) {//if both magnitudes are 0 CartesianPolarMath will return NaN when converting between the two because of how acos and asin work.
			c.turn(theta);
		} else {
			theta %= 2*Math.PI;
			float[] newV = Physics.addVector(c.getVelocity(), c.getMoveAngle(), a, theta);
			c.setVelocity(newV[0], newV[1]);
			c.turn(theta);
		}

	}
}
