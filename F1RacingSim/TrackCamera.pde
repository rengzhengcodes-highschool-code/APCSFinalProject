public class TrackCamera {
  /**
    *@param cars All the cars on the track.
    *@param t The track we're running on.
    *@param x The x coord of the center of the camera view.
    *@param y The y coord of the center of the camera view.
  */
  public void cameraView(ArrayList<Car> cars, Track t, int x, int y) {
    int w = width;//placeholder
    int h = height;//placeholder
    PImage trackArea = t.getTrackCamera(x, y, w, h);
    
    cars = carsOnCam(cars, x, y, w, h);//reassigns reference, not the actual list
    int leftBound = x - w/2;
    int topBound = y - h/2;
    
    for (Car car: cars) {
      car.display(x-leftBound, topBound - y);//I believe this is the correct translation math.
    }
  }
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
