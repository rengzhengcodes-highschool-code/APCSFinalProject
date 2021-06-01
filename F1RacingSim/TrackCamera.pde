public class TrackCamera {
	/**
		*@param cars All the cars on the track.
		*@param x X coord of the center of the camera.
		*@param y Y coord of the center of the camera.
		*@param w Width of the cameraView.
		*@param h Height o the cameraView.
	*/
	public ArrayList<Car> carsOnCam(ArrayList<Car> cars, int x, int y, int w, int h) {
		ArrayList<Car> carsOnCam = new ArrayList<Car>();
		w /= 2;
		h /= 2;

		for (Car car: cars) {
			if (Math.abs(x - car.getX()) < w &&
					Math.abs(y - car.getY()) < h) {//car is in bounds of the camera check
				carsOnCam.add(car);
			}
		}

		return carsOnCam;
	}
}
