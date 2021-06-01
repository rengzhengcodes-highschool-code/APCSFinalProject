public class TrackCamera {
	public void trackCar(Car c) {
		//translates car to 0, 0
		translate(-c.getX()*scaleFactor, -c.getY()*scaleFactor);
		//translates car to center
		translate(width*(1/scaleFactor), height*(1/scaleFactor));
		scale(scaleFactor);
	}
}
