public class Track {
	/** The static friction coefficient of the track.
	*/
	final private float trackGripMod;
	final private float tireWear;
	/** The image that represents the track.
	*/
	final private PImage track;
	/** The image that represents the track edge.
	*/
	final private PImage trackEdge;
	/**
		*@param tGP The track grip coefficient, relative to what the FIA considers "standard". Based off creater interpretation of each deviation from normal being 0.1.
		*@param wear Tire wear of the track.
		*@param display The image that will be displayed as the track.
		*@param edgeImage The image that has already been edgeDetected.
		*@postcondition All the constants for this track are set.
	*/
	public Track (float tGrip, float wear, PImage display, PImage edgeImage) {
		trackGripMod = tGrip;
		tireWear = wear;
		track = display;
		track.resize(width, height);
		trackEdge = edgeImage.copy();
		trackEdge.resize(width, height);
	}
	public void display() {
		imageMode(CORNER);
		image(track, 0, 0);
	}
	public void displayEdge() {
		imageMode(CORNER);
		image(trackEdge, 0, 0);
	}

	/*Get Statements. Self explanatory*/

	/**@return The track's relative grip'.
	*/
	public float getTrackRelGrip() {
		return trackGripMod;
	}
	/**@return The current track tire wear.
	*/
	public float getTireWear() {
		return tireWear;
	}
	/**@return The track mask that is used for the edge detection in the AI.
	*/
	public PImage getTrackEdge() {
		return trackEdge;
	}

	public String toString() {
		return "Track Stats > Grip Mod: " + trackGripMod + " | Wear Mod: " + tireWear;
	}
}
