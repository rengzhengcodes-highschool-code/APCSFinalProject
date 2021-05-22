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
  //calculate the vector for actuall direction of movement by adding the vectors
  public double[] moveVector() {
    double x1 = frontSpeed * Math.cos((angle*Math.PI)/180);
    double x2 = driftSpeed * Math.cos((driftAngle*Math.PI)/180);
    double y1 = frontSpeed * Math.sin((angle*Math.PI)/180);
    double y2 = driftSpeed * Math.sin((driftAngle*Math.PI)/180);
    double finx = x1+x2;
    double finy = y1+y2;
    double speed = Math.sqrt(finx*finx + finy*finy);
    double finAngle = (180.0/Math.PI)*Math.atan(finy/finx);
    double[] result = new double {speed, finAngle};
    return result;
  }
}
