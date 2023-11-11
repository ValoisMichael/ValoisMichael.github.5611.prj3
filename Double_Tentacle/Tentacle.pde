Segment[] segment = new Segment[5];
Segment[] segment2 = new Segment[2];
PVector base;
int arm_length = 30;
boolean target = true;

void setup() {
  size(600, 600);
  
  // Both branchs of the tentacle initialized
  segment[0] = new Segment(arm_length, true);
  for (int i = 1; i < segment.length; i++) {
    segment[i] = new Segment(arm_length, true);
  }
  segment2[0] = new Segment(arm_length, false);
  for (int i = 1; i < segment2.length; i++) {
    segment2[i] = new Segment(arm_length, false);
  }
  segment[segment.length-3].colour = null;
  segment[segment.length-4].colour = null;
  segment[segment.length-5].colour = null;
  base = new PVector(width/2, height/2);
}

void draw() {
  background(7, 6, 31);
  int total = segment.length;
  int total2 = segment2.length;
  
  // Tentacle 
  Segment end = segment[total - 1];
  Segment end2 = segment2[total2 - 1];
  end.follow(mouseX, mouseY);
  end2.follow(segment[3]);
  end.update();
  
  // Updates each segments position and sets the fixed base
  for (int i = total-2; i >= 0; i--) {
    segment[i].follow(segment[i+1]);
    segment[i].update();
  }
  segment[0].setBase(base);
  for (int i = total2-2; i >= 0; i--) {
    segment2[i].follow(segment2[i+1]);
    segment2[i].update();
  }
  
  // Displays each section of the tentacle
  for (int i = 1; i < total; i++) {
    segment[i].setBase(segment[i-1].b);
  }
  for (int i = 1; i < total2; i++) {
    segment2[i].setBase(segment2[i-1].b);
  }
  for (int i = 0; i < total; i++) {
    segment[i].display();
  }  
  for (int i = 0; i < total2; i++) {
    segment2[i].display();
  }
  
  // Object rendering
  stroke(255);
  ellipse(mouseX, mouseY, 5, 5);
}

void keyPressed() {
  // Handles toggling which arm is reaching to grab
  if (key == '1') {
    segment[segment.length-1].colour = !segment[segment.length-1].colour;
    segment[segment.length-2].colour = !segment[segment.length-2].colour;
    segment2[segment2.length-1].colour = !segment2[segment2.length-1].colour;
    segment2[segment2.length-2].colour = !segment2[segment2.length-2].colour;
    segment2[segment2.length-1].setBase(new PVector(mouseX, mouseY));
    segment2[segment2.length-2].setBase(new PVector(mouseX, mouseY));
  }
}
