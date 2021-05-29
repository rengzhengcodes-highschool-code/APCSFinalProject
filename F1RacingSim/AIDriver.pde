public class AIDriver extends Driver {
	private float sightRange = 50;
	private final boolean DEBUG = false;

	public float findDistToWall() {
		return getCar().distanceToBounds(sightRange);
	}

	public float findLeftWallDist() {
		float theta = getCar().getMoveAngle();
		float[] boundPixelOffset = closestBound(sightRange, theta - (float)Math.PI/2, t.getTrackEdge());
		return dist(0, 0, boundPixelOffset[0], boundPixelOffset[1]);
	}

	public float findRightWallDist() {
		float theta = getCar().getMoveAngle();
		float[] boundPixelOffset = closestBound(sightRange, theta + (float)Math.PI/2, t.getTrackEdge());
		return dist(0, 0, boundPixelOffset[0], boundPixelOffset[1]);
	}

	public float[] closestBound(float visualRange, float angle, PImage bound) {
		Car c = getCar();
		float xOff = 0;
		float yOff = 0;

		for (int i = 0; i < visualRange; i++) {
			if (color(0) != bound.get((int)(c.getX() + xOff),
				              	        (int)(c.getY() + yOff))) {
				return new float[] {xOff, yOff};
			} else {
				xOff += cos(angle);
				yOff += sin(angle);
			}
		}

		return new float[] {xOff, yOff};
	}

	public void displayLineOfSight() {
		Car c = getCar();
		for (int i = -1; i <= 1; i++) {
			float[] closestBound = closestBound(sightRange, c.getMoveAngle() + (float)Math.PI/2 * i, t.getTrackEdge());
			stroke(255);
			line(c.getX(), c.getY(), c.getX() + closestBound[0], c.getY() + closestBound[1]);
		}
	}

	public void drive() {
		/**distance between the car and the wall
		*/
		float d = findDistToWall();
		/**distance to leftWall
		*/
		float dL = findLeftWallDist();
		/**distance to rightWall
		*/
		float dR = findRightWallDist();
		Car c = getCar();

		float a = 0;
		float theta = c.getAngle();

		if (d > 10) {//if there's nothing clear for 10 pixels, go. Might need to up the 10.
			if (dL > dR) {//compensates for drifting to one side of the track
				theta += radians(1);
			} else if (dL > dR) {
				theta -= radians(1);
			}
		} else {
			float[] bound = closestBound(sightRange, theta, t.getTrackEdge());
			int turnDirection = 1;

			if (dL > dR) {//if my default assumption of you need to turn right is wrong, turn left.
				turnDirection = -1;//multiplier to make it turn the other way
			}

			for (int i = 360; i > 0 && (15 > dist(0, 0, bound[0], bound[1]));//the 15 is SUPER important. It was 10 originally and we had a lot of understeer. The i = 360 is to make sure it sweeps all 360 degrees. 
			    i--) {
				theta += radians(1) * turnDirection;
				bound = closestBound(sightRange, theta, t.getTrackEdge());
			}
		}
		//default acceleration speed
		c.setFrontForce(10);
		a = Physics.resolve(c, t);

		if (d < 2) {//emergency bail. If you're not going in the direction you want to, accelerate faster.
			c.setFrontForce(100000);
			a = Physics.resolve(c, t);
		}

		theta %= Math.PI * 2;
		if (a == 0 && c.getVelocity() == 0) {//if both magnitudes are 0 CartesianPolarMath will return NaN when converting between the two because of how acos and asin work.
			c.setAngle(theta);
		} else {
			theta %= 2*Math.PI;
			float[] newV = Physics.addVector(c.getVelocity(), c.getMoveAngle(), a, theta);
			c.setVelocity(newV[0], newV[1]);
			c.setAngle(theta);
		}
	}
}
