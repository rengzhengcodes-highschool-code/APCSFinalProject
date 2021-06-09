public class Tire {
	private float maxDist;//in km
	final public String type;
	private float grip;
	private float kenGrip;
	private float distTraveled = 0;

	public Tire(int type) {
		if (type == 1) {//super soft tires, going off of this thread: https://www.mytutor.co.uk/answers/9684/A-Level/Physics/The-friction-coefficient-of-Formula-1-car-tyres-are-around-1-7-in-dry-weather-Assuming-sufficient-power-from-the-engine-calculate-the-theoretical-best-0-100-km-h-acceleration-time-in-seconds-neglect-downforce-g-9-81m-s-2/. Assuming this is super soft for now as no tire specs are given in the math and it seems high.
			this.type = "Super soft";
			grip = 1.7;
			kenGrip = 0.97;//derived from the regular static and nonstatic asphalt on rubber coefficients being 4/7 of each other.
			maxDist = 50.00;//https://sportsdud.com/f1-tire-compound-used-in-2021-season/
		} else if (type ==2) {

		}
	}
}
