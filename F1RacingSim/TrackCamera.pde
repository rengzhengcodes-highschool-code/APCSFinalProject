public class TrackCamera {
	public void trackCar(Car c) {
		//translates car to 0, 0
		translate(-c.getX(), -c.getY());
		//translates car to center
		translate(width/2, height/2);
	}
}
