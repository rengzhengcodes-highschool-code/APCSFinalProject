public static class Physics{
  final static double g = 9.81;
  /**
    *@param car The car being driven.
    *@param track The track being driven on.
    *@return The actual magnitude of the acceleration of the car
  */
  public double resolve(Car car, Track track){
    return resolve(car, track.getTrackGrip(), track.getTrackSlideGrip());
  }
  /**
    *@param car The car being driven.
    *@param statGrip The static coefficient of friction.
    *@param kenGrip The nonstatic coefficient of friction.
    *@return The actual magnitude of the acceleration of the car
  */
  public static double resolve(Car car, double statGrip, double kenGrip){
    double acceleration = 0;
    double normalForce = g * car.getMass();
    if(car.getFrontForce() <= normalForce * statGrip){
      acceleration = car.getFrontForce()/car.getMass();
    }else{
      acceleration = (car.getFrontForce() * kenGrip)/car.getMass();
    }
    return acceleration;
  }
  
  public static double[] addVector(double mag1, double ang1, double mag2, double ang2){
    double[] xy1 = CartesianPolarMath.polarToCartesian(mag1, ang1);
    double[] xy2 = CartesianPolarMath.polarToCartesian(mag2, ang2);
    //double[] result = new double[]{xy1[0] + xy2[0], xy1[1] + xy2[1]};
    return (CartesianPolarMath.cartesianToPolar(xy1[0] + xy2[0], xy1[1] + xy2[1]));
  }
}
