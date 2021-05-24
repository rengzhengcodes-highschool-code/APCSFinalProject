public class Car{
  private double xCor;
  private double yCor;
  private double mass;
  private double topSpeed;
  //angle and magnitude of vector 1:
  //the direction the car is trying to go
  private double angle;
  private double frontForce;
  //angle and magnitude of vector 2:
  //the direction the car is actually moving
  //the velocity in m/s
  private double moveAngle;
  private double velocity;
  /**
    *@param x X coord of the car.
    *@param y Y coord of the car.
    *@param m Mass of the car.
    *@param tS Top speed of the car.
    *@param a Starting angle of the car.
    *@param fS Front force of the car.
    *@param dA moveAngle The starting angle delta.
    *@param dS The starting velocity.
    *@postcondition The instance variables are set.
  */
  public Car(double x, double y, double m, 
             double tS, double a, double fS, 
             double dA, double dS) {
    xCor = x;
    yCor = y;
    mass = m;
    topSpeed = tS;
    angle = a;
    frontForce = fS;
    moveAngle = dA;
    velocity = dS;
  }
  /**The default car constructor.
  */
  public Car() {
    xCor = 200;
    yCor = 200;
    mass = 900;
    topSpeed = 104;
    angle = 0;
    frontForce = 0;
    moveAngle = 0;
    velocity = 0;
  }
  /*Get Methods. Self explanatory*/
  public double getX() {
    return xCor;
  }
  public double getY() {
    return yCor;
  }
  public double getMass() {
    return mass;
  }
  public double getTopSpeed() {
    return topSpeed;
  }
  public double getAngle() {
    return angle;
  }
  public double getFrontForce() {
    return frontForce;
  }
  public double getMoveAngle() {
    return moveAngle;
  }
  public double getVelocity() {
    return velocity;
  }
  
  public void display(double x, double y){}
  public void display() {
    stroke(0);
    fill(255,0,0);
    float x = (float)xCor;
    float y = (float)yCor;
    rect(x, y, 10, 5.0);
  }
  
  public void setFrontForce(double acc) {
    frontForce = acc;
  }
  
  public void shiftAngle(double theta) {
    angle = theta;
  }
  
  public void move() {
    double[] shift = CartesianPolarMath.polarToCartesian(velocity, moveAngle);
    xCor += shift[0];
    yCor += shift[1];
  }
  
  public void setVelocity(double mag, double theta) {
    velocity = mag;
    moveAngle = theta;
  }
}
