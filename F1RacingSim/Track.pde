public class Track {
  /** The static friction coefficient of the track.
  */
  final public double trackGrip;
  /** The nonstatic friction coefficient of the track.
  */
  final public double trackSlideGrip;
  /** The rate tires degrade in the track.
  */
  final public double tireWear;
  /** The image that represents the track.
  */
  final public PImage track;
  
  public Track (double grip, double slideGrip, double wear, PImage img) {
    trackGrip = grip;
    trackSlideGrip = slideGrip;
    tireWear = wear;
    track = img;
  }
  
  /**
    *@param x The x-cord of the center of the area of the track you want to focus on.
    *@param y The y-cord of the center of the area of the track you want to focus on.
    *@return A PImage of the area of the track we are at.
  */
  public PImage getTrackArea(int x, int y) {
    x += width/2;
    y -= height/2;
    
    return track.get(x, y, width, height);
  }
}
