public static class CartesianPolarMath {
  //It always assumes 0-180 degrees is down and positive y is down.
  //It assumes top left is (0, 0) for displacement.
  //It assumes the polar center is centered on (0, 0) for displacement.
  /**
    *@param r Radius/magnitude of the vector.
    *@param theta Angle of the vector.
    *@returns A float array where float[0] is the x coord and float[1] is the y coord.
  */
  public static float[] polarToCartesian(float r, float theta) {
    float[] coords = new float[2];
    coords[0] = r * Math.cos(theta);
    coords[1] = r * Math.sin(theta);
    return coords;
  }
  /**
    *@param x X vector magnitude.
    *@param y Y vector magnitude.
    *@returns float[] where float[0] is the magnitude and float[1] is the angle.
  */
  public static float[] cartesianToPolar(float x, float y) {
    float[] coords = new float[2];
    coords[0] = Math.sqrt(x*x + y*y);
    if(y < 0){
      coords[1] = -Math.acos(x/coords[0]);
    }else{
      coords[1] = Math.acos(x/coords[0]);
    }
    return coords;
  }
}
