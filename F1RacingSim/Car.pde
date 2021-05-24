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
  
  public Car(){
    xCor = 200;
    yCor = 200;
    mass = 900;
    topSpeed = 104;
    angle = 0;
    frontForce = 0;
    moveAngle = 0;
    velocity = 0;
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
  //calculate the vector for actuall direction of movement by adding the vectors
  //public double[] moveVector() {
  //  double x1 = frontSpeed * Math.cos((angle*Math.PI)/180);
  //  double x2 = driftSpeed * Math.cos((driftAngle*Math.PI)/180);
  //  double y1 = frontSpeed * Math.sin((angle*Math.PI)/180);
  //  double y2 = driftSpeed * Math.sin((driftAngle*Math.PI)/180);
  //  double finx = x1+x2;
  //  double finy = y1+y2;
  //  double speed = Math.sqrt(finx*finx + finy*finy);
  //  double finAngle = (180.0/Math.PI)*Math.atan(finy/finx);
  //  double[] result = new double {speed, finAngle};
  //  return result;
  //}
  public void display(double x, double y){}
  public void display(){
    stroke(0);
    fill(255,0,0);
    float x = (float)xCor;
    float y = (float)yCor;
    rotate((float)angle);
    rect(x, y, 10, 5.0);
  }
  
  public void setFrontForce(double acc){
    frontForce = acc;
  }
  
  public void shiftAngle(double theta){
    angle = theta;
  }
  
  public void move(){
    double[] shift = CartesianPolarMath.polarToCartesian(velocity, moveAngle);
    xCor += shift[0];
    yCor += shift[1];
  }
  
  public void setVelocity(double mag, double theta){
    velocity = mag;
    moveAngle = theta;
  }
}
