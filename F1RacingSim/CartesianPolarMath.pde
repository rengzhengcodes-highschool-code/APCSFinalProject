public class CartesianPolarMath {
  //It always assumes 0-180 degrees is down and positive y is down.
  //It assumes top left is (0, 0) for displacement.
  //It assumes the polar center is centered on (0, 0) for displacement.
  /**
    *@param r Radius/magnitude of the vector.
    *@param theta Angle of the vector.
    *@returns A double array where double[0] is the x coord and double[1] is the y coord.
  */
  public double[] polarToCartesian(double r, double theta) {
    double[] coords = new double[2];
    coords[0] = r * Math.acos(theta);
    coords[1] = r * Math.asin(theta);
    return coords;
  }
  /**
    *@param x X vector magnitude.
    *@param y Y vector magnitude.
    *@returns double[] where double[0] is the magnitude and double[1] is the angle.
  */
  public double[] cartesianToPolar(double x, double y) {
    double[] coords = new double[2];
    coords[0] = Math.atan(y/x);
    coords[2] = Math.sqrt(x*x + y*y);
    //coords[1] = dist(0, 0, x, y);//dist is just pythagorean theorem, which is also what you use for vectors
    return coords;
  }
}
