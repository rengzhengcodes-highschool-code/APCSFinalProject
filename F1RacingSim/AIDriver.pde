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


	}
}
