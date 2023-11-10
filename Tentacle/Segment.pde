class Segment {
  PVector a = new PVector(0, 0);
  PVector b;
  float length;
  float angle = 0;
  float stroke_width;
  
  Segment(float length, float stroke_width) {
    this.length = length;
    this.stroke_width = map(stroke_width, 0, 10, 10, 4);
    movement();
  } 
  
  Segment(Segment parent, float length, float stroke_width) {
    this.a = parent.b.copy();
    this.length = length;
    this.stroke_width = map(stroke_width, 0, 10, 10, 4);
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
    stroke(51, 48, 128);
    strokeWeight(stroke_width);
    line(a.x, a.y, b.x, b.y);
  }
}
