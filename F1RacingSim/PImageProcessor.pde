public class PImageProcessor {
	public PImageProcessor() {
	}

	void edgeDetection(PImage source, PImage destination) {
		Kernel k = new Kernel(new float[][] {
				{-1/8.,-1/8.,-1/8.},
				{-1/8., 1,-1/8.},
				{-1/8.,-1/8.,-1/8.},
			});
		k.apply(source, destination);
		destination.filter(GRAY);
	}
}
