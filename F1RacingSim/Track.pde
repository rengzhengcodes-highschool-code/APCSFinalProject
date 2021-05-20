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
  
  public Track (double grip, double slideGrip, double wear) {
    trackGrip = grip;
    trackSlideGrip = slideGrip;
    tireWear = wear;
  }
  
  
}
