public class PImageProcessor {
	Kernel k;

	public PImageProcessor(float[][] kernel) {
		this.k = new Kernel(kernel);
	}

	public PImageProcessor() {
		k = new Kernel(new float[][] {
					{0, 0, 0},
					{0, 1, 0},
					{0, 0, 0},
				}
			);
	}

	public PImage rotate(PImage src, float theta) {
		int radiusFromCenterToCorner = Math.round(dist(0, 0, src.width / 2, src.height / 2));

		PImage nu = createImage(radiusFromCenterToCorner * 2 + 2,
														radiusFromCenterToCorner * 2 + 2, ARGB);//the plus twos are for diagonal compensation.
		//compensation values for translating middle of image array to 0, 0.
		int xComp = src.width / 2;
		int yComp = src.height / 2;

		for (int x = -xComp; x < src.width / 2; x++) {//sets origin as middle of src
			for (int y = -yComp; y < src.height / 2; y++) {//sets origin as middle of src
				//calculates based on relation to
				float nuX = x * cos(theta) + y * -sin(theta);
				float nuY = x * sin(theta) + y * cos(theta);
				//translates the nu X and Y values to the nu center.
				nuX += nu.width / 2;
				nuY += nu.height / 2;

				for (int xOff = -1; xOff <= 1; xOff++) {
					for (int yOff = -1; yOff <= 1; yOff++) {
						nu.set((int)nuX + xOff, (int)nuY + yOff, src.get(x + xComp, y + yComp));//undoes compensation for the for loop.
					}
				}
			}
		}

		return nu;
	}
}
