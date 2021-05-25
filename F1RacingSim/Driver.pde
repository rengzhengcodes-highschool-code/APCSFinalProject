public class Driver {
	/**The car the driver drives.
	*/
	private Car car;
	/**The name of the driver (this is so we can keep track of them)
	*/
	private String name;
	/**How light/heavy people go on the tires.
	*/
	private float tireWear;
	/**The reaction time/handling bonus of the driver.
	*/
	private float reactionTime;
	/**How consistent is their good performance? How bad are their off days?
	*/
	private float consistency;
	/**
		*@param c The car the driver drives.
		*@param aName The name of the driver.
		*@param tW The tear wear coefficient of the driver.
		*@param rT The reaction time of the driver.
		*@param consist The consistency of the driver.
	*/
	public Driver(Car c, String aName, float tW, float rT, float consist) {
		car = c;
		name = aName;
		reactionTime = rT;
		consistency = consist;
	}
	/**
		*@postcondition A driver with the stats of a perfect default driver.
	*/
	public Driver() {
		car = new Car();
		name = "Default";
		reactionTime = 1;
		consistency = 1;
	}
	/*Get Methods. Self explanatory*/
	public Car getCar() {
		return car;
	}

	public String getName() {
		return name;
	}

	public float getTireWear() {
		return tireWear;
	}

	public float getReactionTime() {
		return reactionTime;
	}

	public float getConsistency() {
		return consistency;
	}
}
