float x=0, y=0;

void setup() {
  size(1080, 720);
  background(255);
  //x = width/2;
  //y = height;
}

void draw() {
for(int i = 0 ; i <1000; i++){
  stroke(20,255,10);
  strokeWeight(0.5);
  
  float xp = map(x, -5, 5, 0, width);
  float yp = map(y, 0,  10, height, 0);
  point(xp, yp);

  float rand = random(1);
  float nextX = 0;
  float nextY = 0;

  if (rand <= 0.01) {
    nextX =  0 * x + 0    * y;
    nextY =  0 * x + 0.16 * y + 1.6;
  } else if (rand > 0.1 && rand <= 0.86) {
    nextX =  0.85 * x + 0.04 * y;
    nextY = -0.04 * x + 0.85 * y + 1.6;
  } else if (rand > 0.86 && rand <= 0.93) {
    nextX =  0.2 * x + -0.26 * y;
    nextY =  0.23 * x + 0.22 * y + 1.6;
  } else if (rand > 0.93 && rand <= 1) {
    nextX =  -0.13 * x + 0.28 * y;
    nextY =   0.26 * x + 0.24 * y + 0.44;
  }
  x = nextX;
  y = nextY;
  System.out.println(x + " " + y);
}
}
