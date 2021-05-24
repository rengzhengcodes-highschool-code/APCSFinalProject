public class Car{
  private float xCor;
  private float yCor;
  private float mass;
  private float topSpeed;
  //angle and magnitude of vector 1:
  //the direction the car is trying to go
  private float angle;
  private float frontForce;
  //angle and magnitude of vector 2:
  //the direction the car is actually moving
  //the velocity in m/s
  private float moveAngle;
  private float velocity;
  private PImage car = loadImage("RaceCar.png");
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
  public Car(float x, float y, float m,
             float tS, float a, float fS,
             float dA, float dS) {
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
  public float getX() {
    return xCor;
  }
  public float getY() {
    return yCor;
  }
  public float getMass() {
    return mass;
  }
  public float getTopSpeed() {
    return topSpeed;
  }
  public float getAngle() {
    return angle;
  }
  public float getFrontForce() {
    return frontForce;
  }
  public float getMoveAngle() {
    return moveAngle;
  }
  public float getVelocity() {
    return velocity;
  }

  public void display(float x, float y){}
  public void display() {
    imageMode(CENTER);
		image(rotatePImage(car, angle), xCor, yCor);
  }

  public PImage rotatePImage(PImage src, float theta) {
    PImage nu = createImage(src.width, src.height, RGB);
    
    for (int x = 0; x < src.width; x++) {
      for (int y = 0; y < src.height; y++) {
        nu.set(x, y, color(0));
      }
    }

    return nu;
  }

  public void setFrontForce(float acc) {
    frontForce = acc;
  }

  public void shiftAngle(double theta) {
    angle = (float)theta;
  }

  public void move() {
    float[] shift = CartesianPolarMath.polarToCartesian(velocity, moveAngle);
    xCor += shift[0];
    yCor += shift[1];
  }

  public void setVelocity(float mag, float theta) {
    velocity = mag;
    moveAngle = theta;
  }
}
