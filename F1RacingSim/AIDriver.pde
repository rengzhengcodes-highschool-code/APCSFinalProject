public class AIDriver extends Driver {
	private float sightRange = 250;
	private final boolean DEBUG = false;

	public float findDistToWall(Track t) {
		Car c = super.getCar();
		//get car movement vector
		float theta = c.getMoveAngle();
		float v = c.getVelocity();
		//get car center
		float x = c.getX();
		float y = c.getY();
		//offsets per loop
		float xOff = cos(theta);
		float yOff = sin(theta);

		if (DEBUG) {
			line(x, y, sightRange * xOff, sightRange * yOff); //draws expected line fo sight.
		}
		for (int i = 0; i < sightRange; i++) {//looks at the next 250 pixels
			if (t.getTrackEdge().get(Math.round(x), Math.round(y)) == color(0)) {
				return dist(c.getX(), c.getY(), x, y);
			} else {
				x += xOff;
				y += yOff;
			}
		}

		return sightRange;
	}
}
