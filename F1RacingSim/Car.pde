public class Car{
  private double xCor;
  private double yCor;
  private double mass;
  private double topSpeed;
  //angle and magnitude of vector 1:
  //the direction the car is trying to go
  private double angle;
  private double frontSpeed;
  //angle and magnitude of vector 2:
  //the direction the car might be drifting
  private double driftAngle;
  private double driftSpeed;

  public Car(double x, double y, double m, double tS, double a, double fS, double dA, double dS){
    xCor = x;
    yCor = y;
    mass = m;
    topSpeed = tS;
    angle = a;
    frontSpeed = fS;
    driftAngle = dA;
    driftSpeed = dS;
  }

  public double getX(){
    return xCor;
  }
  public double getY(){
    return yCor;
  }
  public double getMass(){
    return mass;
  }
  public double getTopSpeed(){
    return topSpeed;
  }
  public double getAngle(){
    return angle;
  }
  public double getFrontSpeed(){
    return frontSpeed;
  }
  public double getDriftAngle(){
    return driftAngle;
  }
  public double getDriftSpeed(){
    return driftSpeed;
  }
}
