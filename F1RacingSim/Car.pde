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

  public Car(double x, double y, double m, double tS, double a, double fS, double dA, double dS){
    xCor = x;
    yCor = y;
    mass = m;
    topSpeed = tS;
    angle = a;
    frontForce = fS;
    moveAngle = dA;
    velocity = dS;
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
  public double getFrontForce(){
    return frontForce;
  }
  public double getMoveAngle(){
    return moveAngle;
  }
  public double getVelocity(){
    return velocity;
  }
  public void display(double x, double y){}
  //antiquated code
  ////calculate the vector for actuall direction of movement by adding the vectors
  //public double[] moveVector(){
  //  double x1 = frontForce * Math.cos((angle*Math.PI)/180);
  //  double x2 = driftForce * Math.cos((driftAngle*Math.PI)/180);
  //  double y1 = frontForce * Math.sin((angle*Math.PI)/180);
  //  double y2 = driftForce * Math.sin((driftAngle*Math.PI)/180);
  //  double finx = x1+x2;
  //  double finy = y1+y2;
  //  double speed = Math.sqrt(finx*finx + finy*finy);
  //  double finAngle = (180.0/Math.PI)*Math.atan(finy/finx);
  //  return result;
  //}
}
