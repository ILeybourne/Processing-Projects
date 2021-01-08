float xCenter;
float yCenter;
Flower flower;
float circleSize = 300;
Tendril t;
PImage eyes;

void setup() {
  //frameRate(4);
  size(864, 1080);
  xCenter = width/2;
  yCenter = height/2;
  background(255);
  eyes = loadImage("eyes.jpg");

  flower = new Flower(250, xCenter , yCenter -100);
  //float randWidth, randHeight, randAngle;
  //randWidth = random(10, 15) *3;
  //randAngle = 0;
  //randHeight =   random(0.7, 1.2) /2;
  //t = new Tendril(randWidth, randAngle, randHeight, xCenter, yCenter -100);
}


void draw() {
  background(255);
  image(eyes, -100, 0,(height /eyes.height) *eyes.width, height);

  flower.render();
  //t.drawFrame();
  saveFrame("movie/frame-######.png");
}
