class Segment {
  PVector a = new PVector(0, 0);
  PVector b;
  float length;
  float angle = 0;
  Boolean colour;
  
  Segment(float length, Boolean colour) {
    this.length = length;
    this.colour = colour;
    movement();
  } 

  void movement() {
    float dx = length * cos(angle);
    float dy = length * sin(angle);
    b = new PVector(a.x+dx, a.y+dy);
  }
  
  void update() {
    movement();
  }
  
  void follow(Segment child) {
    float targetX = child.a.x;
    float targetY = child.a.y;
    follow(targetX, targetY);
  }
  
  void setBase(PVector postition) {
    a = postition.copy();
    movement();
  }

  void follow(float tx, float ty) {
    PVector target = new PVector(tx, ty);
    PVector direction = PVector.sub(target, a);
    angle = direction.heading();
    
    direction.setMag(length);
    direction.mult(-1);
    
    a = PVector.add(target, direction);
  }
  
  void display() {
    if (colour == null) {
      stroke(0, 150, 0);
    } else if (colour == false){
      stroke(0, 0, 150);
    } else {
      stroke(150, 0, 0);
    }
    strokeWeight(10);
    line(a.x, a.y, b.x, b.y);
  }
}
