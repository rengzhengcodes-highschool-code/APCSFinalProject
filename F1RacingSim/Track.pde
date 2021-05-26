public class Track {
	/** The static friction coefficient of the track.
	*/
	final private float trackGrip;
	/** The nonstatic friction coefficient of the track.
	*/
	final private float trackSlideGrip;
	/** The rate tires degrade in the track.
	*/
	final private float tireWear;
	/** The image that represents the track.
	*/
	final private PImage track;
	final private PImage trackEdge;
	/**
		*@param grip Track static friction coefficient.
		*@param slideGrip Track nonstatic friction coefficient.
		*@param wear Tire wear of the track.
		*@param img The image representing the track.
		*@postcondition All the constants for this track are set.
	*/
	public Track (float grip, float slideGrip, float wear, PImage img) {
		trackGrip = grip;
		trackSlideGrip = slideGrip;
		tireWear = wear;
		track = img;
		track.resize(width, height);
		trackEdge = track.copy();
		
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

	public void display() {
		imageMode(CORNER);
		image(track, 0, 0);
	}

	/*Get Statements. Self explanatory*/

	/**@return The track static friction coefficient.
	*/
	public float getTrackGrip() {
		return trackGrip;
	}
	/**@return The track nonstatic friction coefficient.
	*/
	public float getTrackSlideGrip() {
		return trackSlideGrip;
	}
	/**@return The current track tire wear.
	*/
	public float tireWear() {
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
