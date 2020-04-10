
//inspired by Alexander Miller: https://www.youtube.com/watch?v=LaarVR1AOvs

float t;

static final int SPEED_MULTIPLIER = 1;

float x1(float t) {
  return sin(t / 10) * 100;
}

float y1(float t) {
  return cos(t / 10) * 100;
}

float x2(float t) {
  return sin(t / 20) * 100;
}

float y2(float t) {
  return cos(t / 20) * 100;
}


void setup() {
  size(500, 500);
  background(40);
}

void draw() {
  //draw translucent background so it slowly covers up the past
  noStroke();
  fill(255, 135, 0, 20);
  rect(0, 0, width, height);
  
  stroke(255);
  strokeWeight(3);
  translate(width/2, height/2);
  for (int i = 0; i < SPEED_MULTIPLIER; i++) {
    drawStuff();
  }
}

void drawStuff() {
  //draw a line between the individual points of two parametric functions
  line(x1(t), y1(t), x2(t), y2(t));
  t++;
}
