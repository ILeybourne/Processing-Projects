Particle[] pList = new Particle[100];
float g = 2;
float q1;
float q3;

void setup(){
   colorMode(HSB,200, height, height );
   frameRate(30);
  size(500, 500);
   q1 = width/2 - width/4;
   q3 = (width/2) + (width/4);
  background(#FFFFFF);
  Boolean right = true;
  for(int i = 0; i <100; i++){
    float offset = 360 * (int)i/2;
    Particle p = new Particle(width/2, height/2, 0.002, 10 , 255, right, offset);
    pList[i] = p;
    right = !right;
  }
}

void draw(){
  background(#FFFFFF);
  for(int i = 0; i < pList.length; i++){
    pList[i].update();
  }
}
