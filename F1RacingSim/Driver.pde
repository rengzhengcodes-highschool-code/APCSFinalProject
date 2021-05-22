public class Driver {
  /**The car the driver drives.
  */
  private Car car;
  /**The name of the driver (this is so we can keep track of them)
  */
  private String name;
  /**How light/heavy people go on the tires.
  */
  private double tireWear;
  /**The reaction time/handling bonus of the driver.
  */
  private double reactionTime;
  /**How consistent is their good performance? How bad are their off days?
  */
  private double consistency;
  /**
    *@param c The car the driver drives.
    *@param aName The name of the driver.
    *@param tW The tear wear coefficient of the driver.
    *@param rT The reaction time of the driver.
    *@param consist The consistency of the driver.
  */
  public Driver(Car c, String aName, double tW, double rT, double consist) {
    car = c;
    name = aName;
    reactionTime = rT;
    consistency = consist;
  }
  /**
    *@postcondition A driver with the stats of a perfect default driver.
  */
  public Driver() {
    c = new Car();
    name = "Default";
    reactionTime = 1;
    consistency = 1;
  }
  
  public Car getCar() {
    return car;
  }
  
  public String getName() {
    return name;
  }
  
  public double getTireWear() {
    return tireWear;
  }
  
  public double getReactionTime() {
    return reactionTime;
  }
  
  public double getConsistency() {
    return consistency;
  }
}
