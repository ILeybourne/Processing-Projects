int[][] sandpile;
int maxGrain = 8;


void setup() {
  size(801, 801);
  sandpile = new int[width][height];
  sandpile[width/2][height/2] = 242406;
  sandpile[width/2+44][height/2+44] = 30000000;
  sandpile[width/2-44][height/2-44] = 30000000;
  sandpile[width/2-44][height/2+44] = 30000000;  
  sandpile[width/2+44][height/2-44] = 30000000;
}

void topple() {
  int[][] nextpiles = new int[width][height];
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < width; y++) {
      int num = sandpile[x][y];
      if (num < maxGrain) {
        nextpiles[x][y] = sandpile[x][y];
      }
    }
  }

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int num = sandpile[x][y];
      if (num >= maxGrain) {
        if ( x == 0) {
          nextpiles[width -1 ][y]++;
          nextpiles[width -2][y]++;
        } else if ( y == 0) {
          nextpiles[x][height -1]++;
          nextpiles[x][height -2]++;
        } else if ( y == height -1) {
          nextpiles[x][0]++;
          nextpiles[x][1]++;
        } else if ( x == width -1) {
          nextpiles[0][y]++;
          nextpiles[1][y]++;
        } else if ( x == 1) {
          nextpiles[width -1 ][y]++;
          nextpiles[0][y]++;
        } else if (y == 1) {
          nextpiles[x][height -1]++;
          nextpiles[x][0]++;
        } else if ( y == height -2) {
          nextpiles[x][0]++;
          nextpiles[x][height-1]++;
        } else              if (  x == width -2) {
          nextpiles[0][y]++;
          nextpiles[width-1][y]++;
        } else {
        }

        if ( !(x >= width -2 || y >= height -2 || x <= 1  || y <= 1 )) {
          
          if (x>0) 
            nextpiles[x-1][y]++;
          //
          if (x <width-1) 
            nextpiles[x+1][y]++;

          if (y>0) 
            nextpiles[x][y - 1]++;

          if (y<height-1) 
            nextpiles[x][y + 1]++;

          if (x>1) 
            nextpiles[x-2][y]++;

          if (x<width-2) 
            nextpiles[x+2][y]++;

          if (y>1) 
            nextpiles[x][y - 2]++;

          if (y<height-2) 
            nextpiles[x][y + 2]++;
        }
        nextpiles[x][y] += (num) - maxGrain;
      }
    }
  }
  //System.out.println(nextpiles[3][3]);
  System.out.println(nextpiles[width/2][height/2]);
  System.out.println(nextpiles[width/2][height/2+10]);
  //System.out.println(nextpiles[3][height-4]);
  //System.out.println(nextpiles[width-4][height-4]);
  sandpile = nextpiles;
}

void render() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < width; y++) {
      int num = sandpile[x][y];

      color col = color(255);

      if (num == 0 ) {
        col = color(255);
      } else if (num == 1) {
        col = color(255, 25, 0);
      } else if ( num ==2) {
        col = color(100, 100, 10);
      } else if ( num == 3) {
        col = color(255, 255, 0);
      } else if (num == 4) {
        col = color(225, 0, 190);
      } else if ( num ==5) {
        col = color(255, 10, 205);
      } 
      else if ( num == 6) {
        col = color(0, 255, 255);
      } else if (num == 7) {
        col = color(0);
      } 
      pixels[x+y*width] = col;
    }
  }
  updatePixels();
}

void draw() {

  render();
  for (int i = 0; i< 314; i++) {
    topple();
    
  }
    saveFrame("movie8/frame-##########.png");

}
