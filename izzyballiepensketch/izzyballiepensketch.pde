PImage pic;
int maxDots = 3000;
int dotCount;
float dotsX[];
float dotsY[];
float x = width/2;
float y = height/2;

void setup() {
  size(480, 640);
  pic = loadImage("izzybwbaillie copy.png");
  //pic2 = loadImage("Romeo_and_Juliet_bw.jpg");
  background(255);
  strokeWeight(0.001);
  dotCount = 0;
  dotsX = new float[maxDots];
  dotsY = new float[maxDots];
  makeDots();
  smooth();
  noFill();
  stroke(0);
}

void draw() {
  //for (int j = 0; j< 100; j++) {
  background(255);

  makeDots();
    noFill();
  beginShape();
  curveVertex(dotsX[0], dotsY[0]);
  for (int i =0; i < maxDots; i++) {
    curveVertex(dotsX[i], dotsY[i]);
  }
  curveVertex(dotsX[maxDots-1], dotsY[maxDots-1]);
  endShape();

  //}
  saveFrame("movie2/frame-##########.png");
  //noLoop();
}



boolean getRandomBoolean() {
  return Math.random() < 0.5;
}

int getRandomDotNumber() {
  return (int) random(maxDots);
}

void makeDots() {
  print("ll");
  dotCount = 0;
  dotsX = new float[maxDots];
  dotsY = new float[maxDots];
  while (dotCount < maxDots) {
    //for (int i = 0; i < 1000; i++) {
    Boolean xBool = getRandomBoolean();
    Boolean yBool = getRandomBoolean();
    if (xBool) {
      x = x + random(5);
    } else {
      x = x - random(5);
    }
    if (yBool) {
      y = y + random(5);
    } else {
      y = y - random(5);
    }
    if (x<0 || x > width) {
      x = width/2;
    }
    if (y<0 || y > height) {
      y = height/2;
    }
    print(x + "  ");

    color c = pic.get(int(x), int(y));

    //fill(c);
    stroke(c);

    if (c == -16777216) {
      //ellipse(x, y, random(0.2, 2), random(0.2, 4));
      dotsX[dotCount] = x;
      dotsY[dotCount] = y;
      dotCount++;
    }
  }
}
