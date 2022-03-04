//inspired by Alexander Miller: https://www.youtube.com/watch?v=LaarVR1AOvs

var t = 0;

var SPEED_MULTIPLIER = 1;

function x1(t) {
    return sin(t / 10) * 100;
}

function y1(t) {
    return cos(t / 10) * 100;
}

function x2(t) {
    return sin(t / 20) * 100;
}

function y2(t) {
    return cos(t / 20) * 100;
}

function setup() {
    createCanvas(windowWidth, windowHeight)
    background(40)
}

function draw() {
    //draw translucent background so it slowly covers up the past
    noStroke();
    fill(255, 135, 0, 20);
    rect(0, 0, width, height);

    stroke(255);
    strokeWeight(3);
    translate(width / 2, height / 2);
    for (var i = 0; i < SPEED_MULTIPLIER; i++) {
        drawStuff();
    }
}

function drawStuff() {
    //draw a line between the individual points of two parametric functions
    line(x1(t), y1(t), x2(t), y2(t));
    t++;
}