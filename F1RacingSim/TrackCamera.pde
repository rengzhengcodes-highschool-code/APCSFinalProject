public class TrackCamera {
	public void trackCar(Car c) {
		frameRate(secondToFrameRatio/4);//quarters time to better simulate real time. 
		//translates 0,0 to center
		translate(width/2, height/2);
		//translates car to (0, 0) once scale compensation is implemented.
		translate(-c.getX()*scaleFactor, -c.getY()*scaleFactor);
		//scales up images
		scale(scaleFactor);
	}
}
