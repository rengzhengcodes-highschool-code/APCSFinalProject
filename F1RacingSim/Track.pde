public class Track {
  /** The static friction coefficient of the track.
  */
  final private double trackGrip;
  /** The nonstatic friction coefficient of the track.
  */
  final private double trackSlideGrip;
  /** The rate tires degrade in the track.
  */
  final private double tireWear;
  /** The image that represents the track.
  */
  final private PImage track;
  /**
    *@param grip Track static friction coefficient.
    *@param slideGrip Track nonstatic friction coefficient.
    *@param wear Tire wear of the track.
    *@param img The image representing the track.
    *@postcondition All the constants for this track are set.
  */
  public Track (double grip, double slideGrip, double wear, PImage img) {
    trackGrip = grip;
    trackSlideGrip = slideGrip;
    tireWear = wear;
    track = img;
  }
  /**
    *@param x The x-cord of the center of the area of the track you want to focus on.
    *@param y The y-cord of the center of the area of the track you want to focus on.
    *@param w The width we want the view to be.
    *@param h The height we want the view to be.
    *@return A PImage of the area of the track we are at.
  */
  public PImage getTrackCamera(int x, int y, int w, int h) {
    x += w/2;
    y -= h/2;
    
    return track.get(x, y, w, h);
  }
  /**@return The track static friction coefficient.
  */
  public double getTrackGrip() {
    return trackGrip;
  }
  /**@return The track nonstatic friction coefficient.
  */
  public double getTrackSlideGrip() {
    return trackSlideGrip;
  }
  /**@return The current track tire wear.
  */
  public double tireWear() {
    return tireWear;
  }
  /**@return The horizontal length of the track.
  */
  public int trackXLength() {
    return track.width;
  }
  /**@return The vertical length of the track.
  */
  public int trackYLength() {
    return track.height;
  }
}
