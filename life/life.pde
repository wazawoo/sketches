
//https://processing.org/tutorials/2darray/

//64x64, 50px each
int GRID_WIDTH = 12;
int GRID_HEIGHT = 12;
float TILE_SIZE = 0;

float danger = 0.9;
Blob[][] life = new Blob[GRID_WIDTH][GRID_HEIGHT];

int backgroundColor = #323232;
//int bg50 = #32323280;
int blobColor = #89F782;

void setup() {
  //must be square for now
  size(500, 500);
  pixelDensity(displayDensity());
  TILE_SIZE = width/float(GRID_WIDTH);  
  background(50);
  frameRate(2);
  
  //set up initial array
  for (int x = 0; x < GRID_WIDTH; x++) {
    for (int y = 0; y < GRID_HEIGHT; y++) {
      life[x][y] = new Blob(x, y, random(1) > danger);
    }
  }
}

void draw() {
  background(50);
  
  for (int x = 0; x < GRID_WIDTH; x++) {
    for (int y = 0; y < GRID_HEIGHT; y++) {
      life[x][y].determineFate();
      life[x][y].display();
    }
  }
  advanceTime();
}

int mod(int a, int b) {
  //% is the remainder operator
  //so it doesnt work quite like a modulo
  return ((a % b) + b) % b;
}

void advanceTime() {
  for (int x = 0; x < GRID_WIDTH; x++) {
    for (int y = 0; y < GRID_HEIGHT; y++) {
      //advance time (we need to draw all before we do this)
      life[x][y].alive = life[x][y].aliveTomorrow;
    }
  }
}

class Blob {
  int x, y;
  boolean alive;
  boolean aliveTomorrow;
  boolean[][] neighbors = {{false, false, false}, 
                           {false, false, false}, 
                           {false, false, false}};
  
  Blob(int _x, int _y, boolean _alive) {
    x = _x;
    y = _y;
    alive = _alive;
    
    //this will get set when we determine fate
    aliveTomorrow = false;
  }
  
  void display() {
    
    
    
    
    
    //ok
    //we need enough info to draw this
    //so this means knowledge of neighbors being alive
    //lets set that when we get neighbors
    //actually, we dont need that
    //we are just accessing array
    //i guess could combine these
    //for now, no
    
    
    //draw needed corners (just draw squares)
    rectMode(CORNER);
    fill(blobColor);
    stroke(blobColor);
    //corners are named as follows
    //1 2
    // x 
    //3 4
    
    //index 1 is the center of the neighbors array
    int me = 1;
    
    if ((!alive && ((neighbors[me-1][me] && neighbors[me][me-1])))
      || (alive && (neighbors[me-1][me-1] ||  neighbors[me-1][me] || neighbors[me][me-1]))) {
      //draw corner 1
      rect(x*TILE_SIZE, y*TILE_SIZE, TILE_SIZE/2, TILE_SIZE/2);
    }
    if ((!alive && ((neighbors[me][me-1] && neighbors[me+1][me])))
      || (alive && (neighbors[me+1][me-1] ||  neighbors[me][me-1] || neighbors[me+1][me]))) {
      //draw corner 2
      rect(x*TILE_SIZE + TILE_SIZE/2, y*TILE_SIZE, TILE_SIZE/2, TILE_SIZE/2);
    }
    if ((!alive && ((neighbors[me][me+1] && neighbors[me-1][me])))
      || (alive && (neighbors[me-1][me+1] ||  neighbors[me][me+1] || neighbors[me-1][me]))) {
      //draw corner 3
      rect(x*TILE_SIZE, y*TILE_SIZE + TILE_SIZE/2, TILE_SIZE/2, TILE_SIZE/2);
    }
    if ((!alive && ((neighbors[me+1][me] && neighbors[me][me+1])))
      || (alive && (neighbors[me+1][me+1] ||  neighbors[me+1][me] || neighbors[me][me+1]))) {
      //draw corner 4
      rect(x*TILE_SIZE + TILE_SIZE/2, y*TILE_SIZE + TILE_SIZE/2, TILE_SIZE/2, TILE_SIZE/2);
    }
    
    //draw circle, either background color or foreground color
    ellipseMode(CORNER);
    noStroke();
    if (alive) {
      fill(blobColor);
    } else {
      fill(backgroundColor);
    }
    circle(x*TILE_SIZE, y*TILE_SIZE, TILE_SIZE);
  }
  
  void determineFate() {
    //what are life conditions??
    //Any live cell with fewer than two live neighbours dies, as if by underpopulation.
    //Any live cell with two or three live neighbours lives on to the next generation.
    //Any live cell with more than three live neighbours dies, as if by overpopulation.
    //Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    int numNeighbors = getNumNeighbors();
    
    if (alive) {
      aliveTomorrow = (numNeighbors == 2) || (numNeighbors == 3);
    } else {
      aliveTomorrow = numNeighbors == 3;
    }
  }
  
  int getNumNeighbors() {
    int numNeighbors = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) {
          continue;
        } else {
          if (life[mod(x+i, GRID_WIDTH)][mod(y+j, GRID_HEIGHT)].alive) {
            numNeighbors++;
            neighbors[1+i][1+j] = true;
          } else {
            neighbors[1+i][1+j] = false;
          }
        }
      }
    }
    return numNeighbors;
  }
}
