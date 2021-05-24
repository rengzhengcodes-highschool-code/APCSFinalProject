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
  if(keyCode == 39){
    for(Car c : cars){
      c.shiftAngle(0);
      c.setFrontForce(10);
      double acc = Physics.resolve(c, 0.90, 0.68);
      double facingAngle = c.getAngle();
      //System.out.println("" + c.getAngle());
      //System.out.println("" + c.getVelocity());
      double speed = c.getVelocity();
      double moveAngle = c.getMoveAngle();
      double[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
      c.setVelocity(newMoveVector[0],newMoveVector[1]);
      //System.out.println("" + newMoveVector[0]);
      //System.out.println("" + newMoveVector[1]);
      System.out.println("-------");
    }
  }
  if(keyCode == 40){
    for(Car c : cars){
      c.shiftAngle(Math.PI/2);
      c.setFrontForce(10);
      double acc = Physics.resolve(c, 0.90, 0.68);
      double facingAngle = c.getAngle();
      //System.out.println("" + c.getAngle());
      //System.out.println("" + c.getVelocity());
      double speed = c.getVelocity();
      double moveAngle = c.getMoveAngle();
      double[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
      c.setVelocity(newMoveVector[0],newMoveVector[1]);
      //System.out.println("" + newMoveVector[0]);
      System.out.println("-------");
    }
  }
  if(keyCode == 37){
    for(Car c : cars){
      c.shiftAngle(Math.PI);
      c.setFrontForce(10);
      double acc = Physics.resolve(c, 0.90, 0.68);
      double facingAngle = c.getAngle();
      //System.out.println("" + c.getAngle());
      //System.out.println("" + c.getVelocity());
      double speed = c.getVelocity();
      double moveAngle = c.getMoveAngle();
      //System.out.println("Acc:" + acc);
      //System.out.println("facing angle:" + facingAngle);
      double[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
      //System.out.println("" + newMoveVector[0]);
      //System.out.println("" + newMoveVector[1]);
      c.setVelocity(newMoveVector[0],newMoveVector[1]);
      System.out.println("-----");
    }
  }
  if(keyCode == 38){
    for(Car c : cars){
      c.shiftAngle(Math.PI*1.5);
      c.setFrontForce(10);
      double acc = Physics.resolve(c, 0.90, 0.68);
      double facingAngle = c.getAngle();
      //System.out.println("" + c.getAngle());
      //System.out.println("" + c.getVelocity());
      double speed = c.getVelocity();
      double moveAngle = c.getMoveAngle();
      double[] newMoveVector = Physics.addVector(acc, facingAngle, speed, moveAngle);
      c.setVelocity(newMoveVector[0],newMoveVector[1]);
      //System.out.println("" + newMoveVector[0]);
      System.out.println("-------");
    }
  }
}
