ArrayList<Car> cars;
void setup(){
  size(1000, 800);
  cars = new ArrayList<Car>();
  cars.add(new Car());
}

void draw(){
  background(200);
  for(Car c : cars){
    c.move();
    c.display();
    //System.out.println("X: " + c.getX());
    //System.out.println("Y: " + c.getY());
  }
  fill(0);
  textSize(20);
  text("FPS: "+frameRate,0,20);
}

void keyPressed(){
  //System.out.println("" + keyCode);
  if(keyCode == 32){
    for(Car c : cars){
      c.shiftAngle(0);
      c.setFrontForce(10);
      double acc = Physics.resolve(c, 0.90, 0.68);
      double facingAngle = c.getAngle();
      //System.out.println("" + c.getAngle());
      System.out.println("" + c.getVelocity());
      double speed = c.getVelocity();
      double moveAngle = c.getMoveAngle();
      double[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
      c.setVelocity(newMoveVector[0],newMoveVector[1]);
      //System.out.println("" + newMoveVector[0]);
    }
  }
  if(keyCode == 40){
    for(Car c : cars){
      c.shiftAngle(0);
      c.setFrontForce(-10);
      double acc = Physics.resolve(c, 0.90, 0.68);
      double facingAngle = c.getAngle();
      //System.out.println("" + c.getAngle());
      System.out.println("" + c.getVelocity());
      double speed = c.getVelocity();
      double moveAngle = c.getMoveAngle();
      double[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
      c.setVelocity(newMoveVector[0],newMoveVector[1]);
      //System.out.println("" + newMoveVector[0]);
    }
  }
}
