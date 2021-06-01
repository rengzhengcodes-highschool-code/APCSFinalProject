public class PImageProcessor {
	public PImageProcessor() {
	}

	void edgeDetection(PImage source, PImage destination) {
		Kernel k = new Kernel(new float[][] {
				{1, 1, 1},
				{1, 0, -1},
				{-1,-1,-1},
			});
		k.apply(source, destination);
		destination.filter(GRAY);
	}
}
