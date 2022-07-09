const SIZE = 400;
let points;

function setup() {
  createCanvas(SIZE, SIZE);
  
  points = generatePoints(20);
  
  background(0x0A, 0x0C, 0x0D);
  
  for (var i = 0; i < points.length; i++) {
    points[i].draw()
  }
}

function draw() {
  
  let x = random(SIZE);
  let y = random(SIZE);
  let minDist = Number.MAX_SAFE_INTEGER
  let minIndex = 0
  
  for (var i = 0; i < points.length; i++) {    
    let distance = points[i].distanceFrom(x, y);
    
    if (distance < minDist) {
      minDist = distance;
      minIndex = i;
    }
  }
  
  let p = points[minIndex];
  stroke(p.r, p.g, p.b);
  strokeWeight(10);
  point(x, y);
}

function generatePoints(n) {
  return Array.from({length: n}, () => new Point());
}

class Point {
  constructor() {
    this.x = Math.floor(random(width));
    this.y = Math.floor(random(width));
    this.r = random(0xFF+1);
    this.g = random(0xFF+1);
    this.b = random(0xFF+1);
  }
  
  draw() {
    stroke(this.r, this.g, this.b);
    strokeWeight(10);
    point(this.x, this.y);
  }
  
  distanceFrom(x, y) {
    return sqrt((x - this.x)**2 + (y - this.y)**2)
  }
}
