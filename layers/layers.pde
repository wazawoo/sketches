//Layers
//draw in three separate layers using PGraphics buffers 

PGraphics layer1;
PGraphics layer2;
PGraphics layer3;

int t;

static final int RECT_WIDTH = 50;
static final int TRIANGLE_RADIUS = 50;
static final int CIRCLE_DIAMETER = 100;

float x1(float t) {
  return sin(t / 20) * 100;
}

float x2(float t) {
  return sin(t / 30) * 150;
}

float x3(float t) {
  return sin(t / 40) * 200;
}

void setup() {
  size(500, 500);
  background(50);
  
  layer1 = createGraphics(width, height);
  layer2 = createGraphics(width, height);
  layer3 = createGraphics(width, height);
}

void draw() {
  background(50);
  
  //red square
  layer1.beginDraw();
  layer1.clear();
  layer1.translate(width/2, height/2);
  layer1.noStroke();
  layer1.fill(255, 0, 0);
  layer1.rectMode(CENTER);
  layer1.rect(x1(t), 0, RECT_WIDTH, RECT_WIDTH);
  layer1.endDraw();

  //green triangle
  layer2.beginDraw();
  layer2.clear();
  layer2.translate(width/2, height/2);
  layer2.noStroke();
  layer2.fill(0, 255, 0);
  layer2.triangle(x2(t), -TRIANGLE_RADIUS, x2(t) - sqrt(3)*0.5*TRIANGLE_RADIUS, 0.5*TRIANGLE_RADIUS, x2(t) + sqrt(3)*0.5*TRIANGLE_RADIUS, 0.5*TRIANGLE_RADIUS);
  layer2.endDraw();
  
  //blue circle
  layer3.beginDraw();
  layer3.clear();
  layer3.translate(width/2, height/2);
  layer3.noStroke();
  layer3.fill(0, 0, 255);
  layer3.ellipseMode(CENTER);
  layer3.ellipse(x3(t), 0, CIRCLE_DIAMETER, CIRCLE_DIAMETER);
  layer3.endDraw();
  
  image(layer1, 0, 0);
  image(layer2, 0, 0);
  image(layer3, 0, 0);
  t++;
}
