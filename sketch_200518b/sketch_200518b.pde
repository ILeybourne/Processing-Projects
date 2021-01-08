float px, py, r, degree;
float minWeight = 2;
float maxWeight = 2;
float currWeight;
float spacing = maxWeight+2;
float goldenRatio = ((sqrt(5) + 1 ) / 2);
int iter = 0, imgNum = (int)random(4);
boolean smallChaos = false;
PImage img;

void setup() {
  img = loadImage("659901_poster_l.jpg");
  size(500, 500);
  background(#FFFFFF);
  px = width/2; py = height/2;
}

void draw() {
  img = loadImage("659901_poster_l.jpg");
  for(int i = 34; i > 0; --i){ // for more speed
    degree = (iter * goldenRatio) * 360;
    r = sqrt(iter++) * spacing;
    calcPointPos(width/2, height/2, r, (degree % 360));

    color pix = img.get((int)px, (int)py);
    currWeight = map(brightness(pix), 255, 0, minWeight, maxWeight);
    strokeWeight(currWeight);
    color c = img.get(round(px), round(py));
    stroke(c); // stroke(pix);
    point(px, py);

    if (px <= 0 || px >= width || py <= 0 || py >= height ) { 
    //image(img,0 ,0);
    noLoop(); }
  }
}

void calcPointPos(float x, float y, float r, float graden) {
  px = x + cos(radians(graden))*(r/2);
  py = y + sin(radians(graden))*(r/2);
    if(smallChaos){
    px = x + random(maxWeight)+ cos(radians(graden))*(r/2);
    py = y + random(maxWeight)+ sin(radians(graden))*(r/2);
  }
}

void mousePressed(){
  if (mouseButton == LEFT){
      ++imgNum;
      imgNum %= 4;
      img = loadImage("659901_poster_l.jpg");
    }
  frameCount = iter = 0;
  background(#FF69B4    );
  loop();  redraw();
}
