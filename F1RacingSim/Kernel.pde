public class Kernel {
	float[][]kernel;
	/**Constructor takes the kernel that will be applied to the image
		*@param init The 2D float array representing the kernel values to be initialized.
	*/
	public Kernel(float[][]init) {
		kernel = init.clone();
	}
	/**If part of the kernel is off of the image, return black. Otherwise calculate the convolution of r/g/b separately, and return that color
		*@param img The source image the kernel is being applied to.
		*@param x The x coordinate of the convolution.
		*@param y The y coordinate of the convolution.
		*@return The color result of the convolution.
	*/
	color calcNewColor(PImage img, int x, int y) {
		//Hint: start by always returning black.
		//This will let you test your apply method right away!
		if (x < kernel.length / 2 || y < kernel[0].length / 2
				|| x >= img.width - kernel.length / 2 || y >= img.height - kernel.length / 2) {//bounds check; use >= for the second set of checks and < for the first set because coords are 0-indexed.
			return color(0);//returns black if off edge
		} else {
			int xOffset = -(kernel.length / 2);
			int yOffset = -(kernel[0].length / 2);
			float rTotal = 0;
			float gTotal = 0;
			float bTotal = 0;

			for (float[] row: kernel) {
				for (float weight: row) {//columns now
					color c = img.get(x + xOffset, y + yOffset);
					rTotal += red(c) * weight;//multiplies color value by the weight in kernel
					gTotal += green(c) * weight;
					bTotal += blue(c) * weight;
					xOffset++;
				}
				xOffset = -(kernel.length / 2);
				yOffset++;
			}

			//System.out.println(rTotal + " " + gTotal + " " + bTotal);
			return color(Math.abs(rTotal), Math.abs(gTotal), Math.abs(bTotal));
		}
	}
	/**
		*@precondition Assume the destination is the same dimensions as the source.
		*@postcondition Destination is the result of convolution applied to source.
		*@param source The source image fed to the convolution.
		*@param destination The destination of the convolution results.
	*/
	void apply(PImage source, PImage destination) {
		for (int x = 0; x < source.width; x++) {
			for (int y = 0; y < source.height; y++) {
				destination.set(x, y, calcNewColor(source, x, y));
			}
		}
	}
}
