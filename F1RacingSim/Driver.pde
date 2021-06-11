public class Driver {
	/**The car the driver drives.
	*/
	private Car car;
	/**The name of the driver (this is so we can keep track of them)
	*/
	private String name;
	/**How light/heavy people go on the tires.
	*/
	private float aggressiveness;
	private float smoothness;//lower is better, multiplier to tire wear
	/**
		*@param c The car the driver drives.
		*@param aName The name of the driver.
		*@param aggro How hard the driver tries to overtake
		*@param smooth How smooth a driver is on their tires.
	*/
	public Driver(Car c, String aName, float aggro, float smooth) {
		car = c;
		name = aName;
		aggressiveness = aggro;
		smoothness = smooth;
	}
	/**
		*@postcondition A driver with the stats of a perfect default driver.
	*/
	public Driver() {
		this(new Car(), "Default" + ais.size(), rng.nextFloat() * 3, 0.8 + rng.nextFloat() * 0.2);
	}

	public Driver(float aggro) {
		this(new Car(), "Default" + ais.size(), aggro, 0.8 + rng.nextFloat() * 0.2);
	}

	/*Get Methods. Self explanatory*/
	public Car getCar() {
		return car;
	}

	public String getName() {
		return name;
	}

	public float getAggressiveness() {
		return aggressiveness;
	}

	public float getSmoothness() {
		return smoothness;
	}
	/*Set methods. Self explanatory.*/
	public void setCar(Car c) {
		car = c;
	}
}
