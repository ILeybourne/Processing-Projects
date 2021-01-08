int i =180;
class sphere {
  float x,y;
  sphere(float w, float h) {
    x = w;
    y = h;
  }
  void drawFrame() { 
    stroke(255, 0, 255);
    strokeWeight(1);
    smooth();
    noFill();
    lights();
    rotateX(radians(i));
        rotateY(radians(i));
    arc(x, y, 100, 100, -HALF_PI, HALF_PI+4);
    rotateY(QUARTER_PI);
    arc(x, y, 100, 100, -HALF_PI, HALF_PI+4);
    rotateY(QUARTER_PI);
    arc(x, y, 100, 100, -HALF_PI, HALF_PI+4);
    rotateY(QUARTER_PI);
    arc(x, y, 100, 100, -HALF_PI, HALF_PI+4);

    //arc(0, 0, width/5, height/5, -HALF_PI, HALF_PI+4);
    //rotateY(QUARTER_PI);
    //arc(0, 0, width/5, height/5, -HALF_PI, HALF_PI+4);
    //rotateY(QUARTER_PI);
    //arc(0, 0, width/5, height/5, -HALF_PI, HALF_PI+4);
    //rotateY(QUARTER_PI);
    //arc(0, 0, width/5, height/5, -HALF_PI, HALF_PI+4);
    //rotateY(QUARTER_PI);
    //arc(0, 0, 200, 200, -HALF_PI, HALF_PI+0.5);
    //rotateY(QUARTER_PI);
    //arc(0, 0, 200, 200, -HALF_PI, HALF_PI+0.5);
    //rotateY(QUARTER_PI);
    //arc(0, 0, 200, 200, -HALF_PI, HALF_PI+0.5);
    //rotateY(QUARTER_PI);
    //arc(0, 0, 200, 200, -HALF_PI, HALF_PI+0.5);

    //i++;
  }
}
