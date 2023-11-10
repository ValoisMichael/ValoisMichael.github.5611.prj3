Segment[] segment = new Segment[3];
Segment[] segment2 = new Segment[3];
PVector base;
PVector base2;
int arm_length = 30;
float start = 300;
float start2 = 300;

void setup() {
  size(600, 600);
  
  // Right Arm initialization
  segment[0] = new Segment(arm_length, -45, 90, 0);
  for (int i = 1; i < segment.length; i++) {
    segment[i] = new Segment(segment[i-1],arm_length, -30-(i*60), 90, i);
  }
  base = new PVector(start-200, start2+35);
  
  // Left Arm initialization
  segment2[0] = new Segment(arm_length, -90, 45, 0);
  for (int i = 1; i < segment2.length; i++) {
    segment2[i] = new Segment(segment2[i-1],arm_length, -90, 30+(i*60), i);
  }
  base2 = new PVector(start-200, start2-35);
} 

void draw() {
  background(25);
  
  // Connecting body line
  stroke(255);
  strokeWeight(10);
  line(start-200, start2-35,start-200, start2+35);
  
  int total = segment.length;
  
  // ------------------------- // Right Arm rendering // ------------------------- //
  Segment end = segment[total - 1];
  end.follow(mouseX, mouseY);
  end.update();
  
  // Updates positions and sets fixed point
  for (int i = total-2; i >= 0; i--) {
    segment[i].follow(segment[i+1]);
    segment[i].update();
  }
  segment[0].setBase(base);
  
  // Displays Right Arm
  for (int i = 1; i < total; i++) {
    segment[i].setBase(segment[i-1].b);
  }
  for (int i = 0; i < total; i++) {
    segment[i].display();
  }
  
  // ------------------------- // Left Arm rendering // ------------------------- //
  Segment end2 = segment2[total - 1];
  end2.follow(mouseX, mouseY);
  end2.update();
  
  // Updates positions and sets fixed point
  for (int i = total-2; i >= 0; i--) {
    segment2[i].follow(segment2[i+1]);
    segment2[i].update();
  }
  segment2[0].setBase(base2);
  
  // Displays Left Arm
  for (int i = 1; i < total; i++) {
    segment2[i].setBase(segment2[i-1].b);
  }
  for (int i = 0; i < total; i++) {
    segment2[i].display();
  }
  
  // Draws Skeleton's Head
  stroke(200);
  strokeWeight(5);
  ellipse(start-210, start2, 50, 50);
  
  // Object rendering
  stroke(255, 0, 0);
  ellipse(mouseX, mouseY, 7, 7);
}

// Updates Skeleton's X and Y position
void keyPressed() {
  // Up
  if (key == 'w') {
    if (start > 0) {
      start2 -= 2;
      base = new PVector(start-200, start2+35);
      base2 = new PVector(start-200, start2-35);
    }
  }
  // Down
  if (key == 's') {
    if (start < height) {
      start2 += 2;
      base = new PVector(start-200, start2+35);
      base2 = new PVector(start-200, start2-35);
    }
  }
  // Left
  if (key == 'a') {
    if (start > 0) {
      start -= 2;
      base = new PVector(start-200, start2+35);
      base2 = new PVector(start-200, start2-35);
    }
  }
  // Right
  if (key == 'd') {
    if (start < width) {
      start += 2;
      base = new PVector(start-200, start2+35);
      base2 = new PVector(start-200, start2-35);
    }
  }
}
