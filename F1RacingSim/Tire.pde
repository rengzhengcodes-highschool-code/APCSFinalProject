public class Tire {
	private float maxDist;//in m
	final public String type;
	private float grip;
	private float kenGrip;
	private float distTraveled = 0;
	/**
		*@param type The C number of the tires, based on 2021 Pirelli specs.
		*@postcondition Tires set to the right instance variables for the type.
	*/
	public Tire(int type) {
		switch (type) {
			case 1://ultra soft tires, going off of this thread: https://www.mytutor.co.uk/answers/9684/A-Level/Physics/The-friction-coefficient-of-Formula-1-car-tyres-are-around-1-7-in-dry-weather-Assuming-sufficient-power-from-the-engine-calculate-the-theoretical-best-0-100-km-h-acceleration-time-in-seconds-neglect-downforce-g-9-81m-s-2/. Assuming this is super soft for now as no tire specs are given in the math and it seems high.
				this.type = "Ultra soft";
				grip = 1.7;
				kenGrip = 0.97;//derived from the regular static and nonstatic asphalt on rubber coefficients being 4/7 of each other.
				maxDist = 50000;//https://sportsdud.com/f1-tire-compound-used-in-2021-season/
				//assume maxDist is lowest end of soft range (C1), so 20 laps. 5/2 KM per lap.
				break;
			case 2://super soft
				this.type = "Super soft";
				grip = 1.5;//this is just me breaking up the difference between hards, which were determined arbitrarily, and ultra softs, which were determined via forum post, into even sections since Pirelli tires does not release its F1 tire data publically.
				kenGrip = 0.86;
				maxDist = 62.5;//C2 so 25 laps.
				break;
			case 3://soft
				this.type = "Soft";
				grip = 1.3;
				kenGrip = 0.74;
				maxDist = 75000;//C3 so 30 laps
				break;
			case 4://medium
				this.type = "Medium";
				grip = 1.1;
				kenGrip = 0.63;
				maxDist = 87500;//c4 so 35 laps
				break;
			case 5://hard
				this.type = "Hard";
				grip = 0.9;//Normal tires are 0.2 less hard, this feels right
				kenGrip = 0.51;
				maxDist = 100000;//c5 so 40 laps; lines with Pirelli expected on the Baku track.
				//https://www.thedrive.com/accelerator/40963/why-pirellis-f1-tires-kept-exploding-at-the-azerbaijan-grand-prix
				break;
			default:
				throw new IllegalArgumentException("No tire coresponding to " + type);
		}
	}
	/**
		*@param dT The distance the tire traveled.
		*@postcondition distTraveled increases by dT
	*/
	public void wear(float dT) {
		distTraveled += dT * t.getTireWear();//for now, we assume tires degrade linearly in all conditions. In real life this is also based on driver style and the weather, however those are not simulated here. We're assuming idealized tire wear, which seems to be linear https://www.formula1.com/en/latest/article.explaining-the-new-tyre-performance-graphics-seen-on-tv.21CVJlHg0St8zrzaaVbU4L.html.
	}
	/**
		*@param trackMod The relative grip of the asphalt on the track.
		*@return The grip of the tires at their current moment.
	*/
	public float grip(float trackMod) {
		if (distTraveled < maxDist) {
			float usage = distTraveled / maxDist;//percentage of the tire life left
			return (grip - (usage * 0.2)) * trackMod;//0.2 represents the tire degrading to the next level of compound. Real tires don't do this, but it's a good approximation given that Pirelli (F1 2021's tire manufacturer) does not release its tire data.
		} else {
			return grip - 0.5;//tires degrade heavily outside their lifespan, this represents that.
		}
	}
	/**
		*@param trackMod The relative grip of the asphalt on the track.
		*@return The nonstatic grip of the tires at their current moment.
	*/
	public float kenGrip(float trackMod) {
		if (distTraveled < maxDist) {
			float usage = distTraveled / maxDist;//percentage of the tire life left
			return (kenGrip - (usage * 0.2)) * trackMod;//0.2 represents the tire degrading to the next level of compound. Real tires don't do this, but it's a good approximation given that Pirelli (F1 2021's tire manufacturer) does not release its tire data.
		} else {
			return kenGrip - 0.5 * 4.0/7;//tires degrade heavily outside their lifespan, this represents that. The 4.0/7 is the ratio between regular tires and asphalt's static and nonstatic coefficients of friction, so we're keeping that here.
		}
	}

	public String toString() {
		return "Type: " + type + " | Distance: " + distTraveled + "m | Max Distance: " + maxDist + "m";
	}
}
