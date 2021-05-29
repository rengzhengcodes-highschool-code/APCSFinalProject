public class PImageProcessor {
	public PImageProcessor() {
	}
	/** Uses kernel to form a grayscale edge detection border.
		*@param source The source for the edge detection.
		*@param destination Where we put the results of running source through edge detection.
		*@postcondition destination has an image of the edges in source.
	*/
	void edgeDetection(PImage source, PImage destination) {
		Kernel k = new Kernel(new float[][] {
				{1, 1, 1},
				{-3, 0, 3},
				{-1,-1,-1},
			});
		destination.filter(GRAY);
		k.apply(source, destination);
		for (int x = 0; x < destination.width; x++) {
			for (int y = 0; y < destination.height; y++) {
				if (color(0) != destination.get(x, y)) destination.set(x, y, color(255));
			}
		}
	}
}
