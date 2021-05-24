public static class Physics{
  //the result is the actual magnitude of the acceleration of the car:
  public double resolve(Car car, Track track){
    double acceleration = 0;
    double normalForce = 9.8 * car.getMass();
    if(car.getFrontForce() <= normalForce * track.getTrackGrip()){
      acceleration = car.getMass()/car.getFrontForce();
    }else{
      acceleration = car.getMass()/(car.getFrontForce() * track.getTrackSlideGrip());
    }
    return acceleration;
  }
  
  public static double resolve(Car car, double statGrip, double kenGrip){
    double acceleration = 0;
    double normalForce = 9.8 * car.getMass();
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
