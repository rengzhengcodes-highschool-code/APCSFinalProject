public class TrackCamera {
  /**
    *@param t The track we're running on.
    *@param x The x coord of the center of the camera view.
    *@param y The y coord of the center of the camera view.
  */
  public static void cameraView(Track t, int x, int y) {
  }
  /**
    *@param x X coord of the center of the camera.
    *@param y Y coord of the center of the camera.
  */
  public static ArrayList<Car> carsOnCam(ArrayList<Car> cars, int x, int y) {
    ArrayList<Car> carsOnCam = new ArrayList<Car>();
    
    for (Car car: cars) {
      if (/*car on screen*/) {
        carsOnCam.add(car);
      }
    }
    
    return carsOnCam;
  }
}
