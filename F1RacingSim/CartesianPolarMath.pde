public class CartesianPolarMath {
  //It always assumes 0-180 degrees is down and positive y is down.
  
  /**
    *@param r Radius/magnitude of the vector.
    *@param theta Angle of the vector.
    *@returns A double array where double[0] is the x coord and double[1] is the y coord.
  */
  public static double[] polarToCartesian(double r, double theta) {
    double[] coords = new double[2];
    coords[0] = r * acos(theta);
    coords[1] = r * asin(theta);
    return coords;
  }
  
  public static double[] cartesianToPolar(double x, double y) {
  }
}
