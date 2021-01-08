PImage pic;
PImage pic2;
void setup() {
  size(928, 523);
  pic = loadImage("Romeo_and_Juliet_bw.jpg");
  pic2 = loadImage("Romeo_and_Juliet_bw.jpg");
  background(0);
  strokeWeight(0);
}

void draw() {
  //image(pic,0,0);
  for (int i = 0; i < 1000; i++) {
    float x = random(width);
    float y = random(height);
    color c = pic.get(int(x), int(y));
    color c2 = pic2.get(int(x), int(y));
    x= (x+ 40)/1.1;
    fill(c);
    //print(c);

    stroke(c);
    if (c == -16777216) {
      rect(x, y, random(0.2, 2), random(0.2, 4));
      rect(x, y, random(0.2, 4), random(0.2, 2));
    }
    //else{
    //  ellipse(x,y,random(5,10),random(5,7));
    //  ellipse(x,y,random(5,7),random(5,10));
    //}
    boolean ranX = getRandomBoolean();
    boolean ranY = getRandomBoolean();

    if (ranX && ranY) {
      line(x, y, x+random(width/20), y+random(height/20));
    } else if (ranX && !ranY) {
      line(x, y, x+random(width/20), y-random(height/20));
    } else if (!ranX && ranY) {
      line(x, y, x-random(width/20), y+random(height/20));
    } else {
      line(x, y, x-random(width/20), y-random(height/20));
    }


    //  fill(c2);
    //  //print(c);

    //  stroke(c2);
    //  if (c2 == -16777216) {
    //    //rect(x,y,random(0.2,2),random(0.2,4));
    //    //rect(x,y,random(0.2,4),random(0.2,2));
    //  } else {
    //    ellipse(x, y, random(3, 7), random(0.3, 1));
    //    //ellipse(x,y,random(5,7),random(5,10));
    //  }
    //  boolean ranX2 = getRandomBoolean();
    //  boolean ranY2 = getRandomBoolean();

    //  if (ranX2 && ranY2) {
    //    line(x, y, x+random(width/20), y+random(height/20));
    //  } else if (ranX && !ranY) {
    //    line(x, y, x+random(width/20), y-random(height/20));
    //  } else if (!ranX && ranY) {
    //    line(x, y, x-random(width/20), y+random(height/20));
    //  } else {
    //    line(x, y, x-random(width/20), y-random(height/20));
    //  }
    //}
  }
  saveFrame("movie/frame-######.png");
}



boolean getRandomBoolean() {
  return Math.random() < 0.5;
}
