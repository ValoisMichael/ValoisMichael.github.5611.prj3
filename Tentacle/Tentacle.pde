Segment[] segment = new Segment[8];
PVector base;
int arm_length = 30;

void setup() {
  size(600, 600);
  
  // Tentacle initialization
  segment[0] = new Segment(arm_length, 0);
  for (int i = 1; i < segment.length; i++) {
    segment[i] = new Segment(segment[i-1],arm_length, i);
  }
  base = new PVector(width/2, height/2);
}

void draw() {
  background(7, 6, 31);
  int total = segment.length;
  
  // Tentacle 
  Segment end = segment[total - 1];
  end.follow(mouseX, mouseY);
  end.update();
  
  // Updates each segments position and sets the fixed base
  for (int i = total-2; i >= 0; i--) {
    segment[i].follow(segment[i+1]);
    segment[i].update();
  }
  segment[0].setBase(base);
  
  // Displays each section of the tentacle
  for (int i = 1; i < total; i++) {
    segment[i].setBase(segment[i-1].b);
  }
  for (int i = 0; i < total; i++) {
    segment[i].display();
  }  
  
  // Object rendering
  stroke(255);
  ellipse(mouseX, mouseY, 5, 5);
}
