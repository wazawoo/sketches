
//inspired by Alexander Miller: https://www.youtube.com/watch?v=LaarVR1AOvs


//need to make this adjustable
//fields with inputs
//lets just allow adding of two sine funcs
//choose:
//for all four:
//f1, f2, a1, a2
//sin/cos for first and second (choose either or none)
//line color
//background color
//this would be such a fun tool
//maybe port it to p5 and host it. (too much proc power?? idk)
//what about github hosting

//make a design first


float t;

static final int SPEED_MULTIPLIER = 1;

float x1(float t) {
  return sin(t / 10) * 100 + cos(t / 40) * 100;
}

float y1(float t) {
  return cos(t / 10) * 100;
}

float x2(float t) {
  return sin(t / 20) * 100;
}

float y2(float t) {
  return cos(t / 20) * 100 + sin(t / 40) * 100;
}


void setup() {
  size(500, 500);
  background(40);
}

void draw() {
  //draw translucent background so it slowly covers up the past
  noStroke();
  fill(42, 156, 152, 20);
  rect(0, 0, width, height);
  
  stroke(25);
  strokeWeight(3);
  translate(width/2, height/2);
  for (int i = 0; i < SPEED_MULTIPLIER; i++) {
    drawStuff();
  }
  
  //need to figure out when it loops
  saveFrame();
}

void drawStuff() {
  //draw a line between the individual points of two parametric functions
  line(x1(t), y1(t), x2(t), y2(t));
  t++;
}
