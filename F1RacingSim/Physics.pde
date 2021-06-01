public static class Physics{
	final static float g = 9.81;
	/**
		*@param car The car being driven.
		*@param track The track being driven on.
		*@return The actual magnitude of the acceleration of the car
	*/
	public static float resolve(Car car, Track track) {
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
	/**The physics of car drift.
		*@param car The car which is being drifted.
		*@param statGrip The static friction coefficient between car and track.
		*@param kenGrip The kinetic friction coefficient between car and track.
		*@postcondition The car velocity vector is modified by the drift.
	*/
	public static void driftSlow(Car car, float statGrip, float kenGrip){
		//float[] oldMoveVector = CartesianPolarMath.polarToCartesian(car.getVelocity(),car.getMoveAngle());
		//float difAngle = car.getAngle() - car.getMoveAngle();
		float[] fakeVector = CartesianPolarMath.polarToCartesian(car.getVelocity(), car.getMoveAngle()-car.getAngle());
		if(Math.abs(fakeVector[1]) <= g*car.getMass()*statGrip){
			fakeVector[1] = 0;
		}else{
			if(fakeVector[1] < 0 && fakeVector[1] <= g*car.getMass()*kenGrip){
				fakeVector[1] += g*car.getMass()*kenGrip;
			}else{
				if(fakeVector[1] > 0 && fakeVector[1] >= g*car.getMass()*kenGrip){
					fakeVector[1] -= g*car.getMass()*kenGrip;
				}else{
					fakeVector[1] = 0;
				}
			}
		}
		float[] fakeV2 = CartesianPolarMath.cartesianToPolar(fakeVector[0], fakeVector[1]);
		//fakeV2[1] += difAngle;
		float[] res = addVector(fakeV2[0], fakeV2[1]+car.getAngle(), car.getVelocity(), car.getMoveAngle());
		car.setVelocity(res[0], res[1]);
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
