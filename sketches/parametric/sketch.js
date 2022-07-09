//inspired by Alexander Miller: https://www.youtube.com/watch?v=LaarVR1AOvs

//try out tapping interaction!!
//or, do that with the next one
//could slowly change center to tap location
//could also slow down and reverse direction when center changes

var t = 0;

var SPEED_MULTIPLIER = 1;

function x1(t, w, h) {
    return sin(t / 10) * (w/4);
}

function y1(t, w, h) {
    return cos(t / 10) * (w/4);
}

function x2(t, w, h) {
    return sin(t / 20) * (w/4);
}

function y2(t, w, h) {
    return cos(t / 20) * (w/4);
}

function setup() {
    createCanvas(windowWidth, windowHeight)
    background(40)
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function draw() {
    //draw translucent background so it slowly covers up the past
    noStroke();
    fill(255, 135, 0, 20);
    rect(0, 0, width, height);

    stroke(255);
    strokeWeight(0.01*width);
    translate(width / 2, height / 2);
    for (var i = 0; i < SPEED_MULTIPLIER; i++) {
        drawStuff(width, height);
    }
}

function drawStuff(w, h) {
    //draw a line between the individual points of two parametric functions
    line(
      x1(t, w, h),
      y1(t, w, h),
      x2(t, w, h),
      y2(t, w, h)
    );
    t++;
}
