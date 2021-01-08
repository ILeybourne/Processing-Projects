//int i = 0;
sphere s1, s2, s3, s4, s5, s6, s7,  s8, s9, s10, s11;

void setup() {
  size(400, 400, P3D);
  background(255);
  stroke(255, 0, 255);
  strokeWeight(3);
  smooth();
  s1 = new sphere(0, 0);
  s2 = new sphere(0, 100/2);
  s3 = new sphere(0, -100/2);
  s4 = new sphere((50*(97/56))/2, 100/4);
  s5 = new sphere((-50*(97/56))/2, 100/4);
  s6 = new sphere((50*(97/56))/2, -100/4);
  s7 = new sphere((-50*(97/56))/2, -100/4);
  s8 = new sphere( 100/4, (50*(97/56))/2);
  s9 = new sphere( 100/4, -(50*(97/56))/2);
  s10 = new sphere( -100/4, (50*(97/56))/2);
  s11 = new sphere( -100/4, -(50*(97/56))/2);
  //s5 = new sphere((50*(97/56))/2,100/4);
  //s5 = new sphere((100*(97/56))/2,100/2);
  //s5 = new sphere(0,-100/2);

  //s3 = new sphere(1,-50);
}


void draw() {
  translate(width/2, height/2);
  background(255);
  s1.drawFrame();
  //translate(100/2, 100/2);
  s2.drawFrame();
  //translate(-100, -100);
  s3.drawFrame();
  s4.drawFrame();//botleft
  s5.drawFrame();//botright
  s6.drawFrame();//topleft
  s7.drawFrame();//topright
  //  s8.drawFrame();
  //s9.drawFrame();
  //s10.drawFrame();
  //s11.drawFrame();
  print(i + " ");
  i++;
  //saveFrame("movie/frame-######.png");
  if (i == 360+180)
    noLoop();
}
