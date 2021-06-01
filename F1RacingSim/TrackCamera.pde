public class TrackCamera {
	public void trackCar(Car c) {
		//screen center calibration lines
		line (width/2, 0, width/2, height);
		line(0, height/2, width, height/2);
		//translates 0,0 to center
		translate(width/2, height/2);
		//translates car to (0, 0) once scale compensation is implemented.
		translate(-c.getX()*scaleFactor, -c.getY()*scaleFactor);
		//scales up images
		scale(scaleFactor);
	}
}
