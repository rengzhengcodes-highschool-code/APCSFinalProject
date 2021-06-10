public static class Physics{
  final static float g = 9.81;
  /**
    *@param car The car being driven.
    *@param track The track being driven on.
    *@return The actual magnitude of the acceleration of the car
  */
  public static float resolve(Car car, Track track) {
    return resolve(car, car.getTire().grip(track.getTrackRelGrip()), car.getTire().kenGrip(track.getTrackRelGrip()));
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
  /**The physics of car drift.
    *@param car The car which is being drifted.
    *@param statGrip The static friction coefficient between car and track.
    *@param kenGrip The kinetic friction coefficient between car and track.
    *@postcondition The car velocity vector is modified by the drift.
  */

  public static float sideMomentum(Car car, float[] momentum){
    float[] comps = CartesianPolarMath.polarToCartesian(momentum[0], momentum[1]-car.getAngle());
    return comps[1];
  }

  public static void driftSlow(Car car, float statGrip, float kenGrip){
    float[] front = frontDrift(car, statGrip, kenGrip);
    float[] back = backDrift(car, statGrip, kenGrip);
    float frontCCwMomentum = sideMomentum(car, front);
    float backCCwMomentum = -sideMomentum(car, back);
    float pivotDist = 0;
    float rotator = 0;
    float turnAngle = 0;
    float[] centerOfMassMove;
    if(backCCwMomentum == 0){
      pivotDist = car.getWheelLength()/2;
    }else{
      if(frontCCwMomentum == 0){
        pivotDist = -car.getWheelLength()/2;
      }else{
        pivotDist = (1 - Math.abs(frontCCwMomentum)/(Math.abs(backCCwMomentum)+Math.abs(frontCCwMomentum))*2) * car.getWheelLength()/2;
      }
    }
    rotator = frontCCwMomentum + backCCwMomentum;
    turnAngle = radians((rotator / (car.getWheelLength() * (float)Math.PI)) * 360);
    centerOfMassMove = addVector(front[0], front[1], back[0], back[1]);
    car.setVelocity(centerOfMassMove[0], centerOfMassMove[1]);
    car.setFrontAngle(car.getAngle() + turnAngle);
  }

  public static float[] frontDrift(Car car, float statGrip, float kenGrip){
    float[] fakeVector = CartesianPolarMath.polarToCartesian(car.getVelocity(), car.getMoveAngle()-car.getFrontAngle());
    if(Math.abs(fakeVector[1]) <= g*car.getMass()*statGrip/2){
      fakeVector[1] = 0;
    }else{
      if(fakeVector[1] < 0 && fakeVector[1] <= g*car.getMass()*kenGrip/2){
        fakeVector[1] += g*car.getMass()*kenGrip/2;
      }else{
        if(fakeVector[1] > 0 && fakeVector[1] >= g*car.getMass()*kenGrip/2){
          fakeVector[1] -= g*car.getMass()*kenGrip/2;
        }else{
          fakeVector[1] = 0;
        }
      }
    }
    float[] fakeV2 = CartesianPolarMath.cartesianToPolar(fakeVector[0], fakeVector[1]);
    float[] res = addVector(fakeV2[0], fakeV2[1]+car.getFrontAngle(), car.getVelocity(), car.getMoveAngle());
    return(res);
  }

  public static float[] backDrift(Car car, float statGrip, float kenGrip){
    float[] fakeVector = CartesianPolarMath.polarToCartesian(car.getVelocity(), car.getMoveAngle()-car.getAngle());
    if(Math.abs(fakeVector[1]) <= g*car.getMass()*statGrip/2){
      fakeVector[1] = 0;
    }else{
      if(fakeVector[1] < 0 && fakeVector[1] <= g*car.getMass()*kenGrip/2){
        fakeVector[1] += g*car.getMass()*kenGrip/2;
      }else{
        if(fakeVector[1] > 0 && fakeVector[1] >= g*car.getMass()*kenGrip/2){
          fakeVector[1] -= g*car.getMass()*kenGrip/2;
        }else{
          fakeVector[1] = 0;
        }
      }
    }
    float[] fakeV2 = CartesianPolarMath.cartesianToPolar(fakeVector[0], fakeVector[1]);
    float[] res = addVector(fakeV2[0], fakeV2[1]+car.getAngle(), car.getVelocity(), car.getMoveAngle());
    return(res);
  }

  /**
    *@param mag1 Magnitude of the first force vector.
    *@param ang1 Angle of the first force vector.
    *@param mag2 Magnitude of the second force vector.
    *@param ang2 Angle of the second force vector.
    *@return The sum of the two force vectors.
  */
  public static float[] addVector(float mag1, float ang1, float mag2, float ang2){
    float[] xy1 = CartesianPolarMath.polarToCartesian(mag1, ang1);
    float[] xy2 = CartesianPolarMath.polarToCartesian(mag2, ang2);
    //adds the component vectors together then returns the polar form.
    return (CartesianPolarMath.cartesianToPolar(xy1[0] + xy2[0], xy1[1] + xy2[1]));
  }
}
