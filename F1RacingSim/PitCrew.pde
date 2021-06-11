public class PitCrew {
	private float errorRate;
	private int speed;//in frames, 20 frames = 1 second
	private int framesElapsed = 0;

	public PitCrew() {
		errorRate = 0.05;
		speed = 2 * 20;
	}

	public int whichTire(Car c) {
		return c.getTire().getType();
	}

	public boolean timeElapsed() {
		if (framesElapsed < speed) {
			framesElapsed++;
			return false;
		} else if (errorRate > rng.nextFloat()) {
			framesElapsed -= rng.nextInt(speed);
			return false;
		} else {
			framesElapsed = 0;
			return true;
		}
	}
}
