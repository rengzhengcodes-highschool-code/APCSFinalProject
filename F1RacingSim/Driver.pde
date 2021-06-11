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
	/**
		*@param c The car the driver drives.
		*@param aName The name of the driver.
		*@param aggro How hard the driver tries to overtake
	*/
	public Driver(Car c, String aName, float aggro) {
		car = c;
		name = aName;
		aggressiveness = aggro;
	}
	/**
		*@postcondition A driver with the stats of a perfect default driver.
	*/
	public Driver() {
		this(new Car(), "Default" + ais.size(), rng.nextFloat() * 3);
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
	/*Set methods. Self explanatory.*/
	public void setCar(Car c) {
		car = c;
	}
}
