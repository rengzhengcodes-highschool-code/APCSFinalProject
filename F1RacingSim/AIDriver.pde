public class AIDriver extends Driver {
	private float sightRange = 50;
	private final boolean DEBUG = false;

	public float findDistToWall() {
		return getCar().distanceToBounds(sightRange);
	}

	public void displayLineOfSight() {
		Car c = getCar();
		float[] closestBound = c.closestBound(sightRange, t.getTrackEdge());
		stroke(255);
		line(c.getX(), c.getY(), c.getX() + closestBound[0], c.getY() + closestBound[1]);
	}
}
