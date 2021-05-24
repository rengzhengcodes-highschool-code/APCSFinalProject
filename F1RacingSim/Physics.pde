public static class Physics{
  final static float g = 9.81;
  /**
    *@param car The car being driven.
    *@param track The track being driven on.
    *@return The actual magnitude of the acceleration of the car
  */
  public float resolve(Car car, Track track){
    return resolve(car, track.getTrackGrip(), track.getTrackSlideGrip());
  }
  /**
    *@param car The car being driven.
    *@param statGrip The static coefficient of friction.
    *@param kenGrip The nonstatic coefficient of friction.
    *@return The actual magnitude of the acceleration of the car
  */
  public static float resolve(Car car, float statGrip, float kenGrip){
    float acceleration = 0;
    float normalForce = g * car.getMass();
    if(car.getFrontForce() <= normalForce * statGrip){
      acceleration = car.getFrontForce()/car.getMass();
    }else{
      acceleration = (car.getFrontForce() * kenGrip)/car.getMass();
    }
    return acceleration;
  }
  /**
    *@mag1 Magnitude of the first force vector.
    *@ang1 Angle of the first force vector.
    *@mag2 Magnitude of the second force vector.
    *@ang2 Angle of the second force vector.
    *@return The sum of the two force vectors.
  */
  public static float[] addVector(float mag1, float ang1, float mag2, float ang2){
    float[] xy1 = CartesianPolarMath.polarToCartesian(mag1, ang1);
    float[] xy2 = CartesianPolarMath.polarToCartesian(mag2, ang2);
    //adds the component vectors together then returns the polar form.
    return (CartesianPolarMath.cartesianToPolar(xy1[0] + xy2[0], xy1[1] + xy2[1]));
  }
}
