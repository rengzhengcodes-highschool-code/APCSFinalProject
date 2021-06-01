public class TrackCamera {
	public void trackCar(Car c) {
		translate(-width/2 - c.getX(), -height/2 - c.getY());
		scale(3);
	}
}
