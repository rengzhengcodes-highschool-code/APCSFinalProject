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
        {1, 0, -1},
        {-1,-1,-1},
      });
    k.apply(source, destination);
    destination.filter(GRAY);
  }
}
