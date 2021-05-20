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
  
  
}
