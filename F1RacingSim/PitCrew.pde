public class PitCrew {
	private float errorRate;
	private int speed;//in frames, 20 frames = 1 second
	private int framesElapsed = 0;

	public PitCrew() {
		errorRate = 0.1;
		speed = 2 * 20;
	}

	public boolean changeTire(Car c) {
		if (timeElapsed())  {
			c.changeTire(new Tire(c.getTire().getType()));
			return true;
		} else {
			return false;
		}
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
