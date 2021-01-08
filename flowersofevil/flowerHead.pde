

class Flower {
  Tendril[] t ;
  int tCount;
  float xCenter, yCenter, xTheta = 0, yTheta =0 ;
  float stemWidth =20;
  Flower(int tend, float x, float y) {
    t = new Tendril[tend];
    tCount = tend;
    xCenter = x;
    yCenter = y;
    buildTendrils();
  }

  void buildTendrils() {
    for (int i = 0; i< tCount; i++) {
      float randWidth, randHeight, randAngle;
      randWidth = random(10, 15) *4;
      randAngle = (360/ PI)* i +35; //multiple of irrational angle
      randHeight =   random(0.7, 1.2) /2;

      t[i] = new Tendril(randWidth, randAngle, randHeight, xCenter, yCenter);
    }
  }

  void render() {
    float xDis = sin(xTheta) * 50;

    float yDis = cos(yTheta*2.3) * 4;
    float saveCenterX= xCenter;
    float saveCenterY= yCenter;

    xCenter += xDis/4;
    yCenter += yDis;

    float  cpx1 = saveCenterX + xDis;//((   sin(xTheta /80)))  + 20;
    float cpy1 = saveCenterY/2 + yDis + 100 ;//(noise(xTheta)  * 10* cos(2*xTheta+3)) * 2  + 100; 
    float cpx2 = width - cpx1 - (60 * noise(xTheta))/2;
    float cpy2 = saveCenterY/2 - yDis *1.2;

    ////Body
    stroke(255);
    fill(0, 0, 0);
    ellipse(xCenter, yCenter, circleSize+2, circleSize+2);
    stroke(0);

    //Animate tends
    for (int i = 0; i< tCount; i++) {
      t[i].xOffset = xCenter;
      t[i].yOffset = yCenter;
      t[i].drawFrame();
      if (i >= tCount/20 * 19) {
        float rad = map(i, tCount/20 *19, tCount, circleSize, 200);
        float rad2 = map(i, tCount/20 *19, tCount, circleSize, circleSize/1.4 +(circleSize -circleSize/1.4)/2);
        //System.out.println(rad);
        float c = map(i, tCount/2, tCount, 255, 1);
        fill(c);
        stroke(c);
        ellipse(xCenter, yCenter, rad, rad/1.1);
        arc(xCenter, yCenter, rad, rad, PI, TWO_PI);
        arc(xCenter, yCenter, rad, rad2, 0, PI);
      }

      if (i == tCount/2) {
                
        //Leaf
        beginShape();
        
        float cpx11 = xCenter;
        float cpy11 = height/4*3 ;
        float cpx22 = xCenter + 40;
        float cpy22 = height/4*3  ;
        
         strokeWeight(1.5);
        stroke(255);
        vertex(xCenter + 30, height/4*3); // first point
        bezierVertex(cpx11 + 40, cpy11 + 40, cpx22 ,  cpy22- 20, xCenter + 40 +100, height/4*3 - 60);
        //vertex(xCenter + 40 +100, yCenter/4*3 - 60);
        bezierVertex(cpx11 + 40 +100 -20  , height/4*3 -20, cpx22,  cpy22 + 20 , xCenter + 30, height/4*3);
        endShape();
        
        //Stem
        fill(0, 0, 0);
        beginShape();
        strokeWeight(2);
        stroke(255);
        vertex(xCenter-stemWidth/2, yCenter); // first point
        bezierVertex(cpx1 + xDis, cpy1 + yDis, cpx2 + xDis, cpy2, saveCenterX +40, height);
        vertex(saveCenterX +40 + stemWidth, height);
        bezierVertex( cpx2 + xDis, cpy2 + yDis, cpx1 + xDis + 20, cpy1 + yDis - 20, xCenter+stemWidth/2, yCenter);
        endShape();
        strokeWeight(1);

        //Head whiteline
        stroke(255);
        noFill();
        ellipse(xCenter, yCenter, circleSize+2, circleSize+2);
        stroke(0);
        fill(255);
      }
    }



    //eye white
    fill(255);
    float eyeY= yCenter;
    //ellipse(xCenter, eyeY, circleSize/1.4, circleSize/1.5);
    arc(xCenter, eyeY, circleSize/1.4, circleSize/1.5, 0, PI);

    //Pupil
    stroke(0);
    fill(170);
    //ellipse(xCenter, eyeY +20, circleSize/2.2, circleSize/2.2);
    drawGradient(xCenter, eyeY +15);

    //Iris
    stroke(0);
    fill(0);
    //ellipse(xCenter, eyeY +15, circleSize/4.5, circleSize/4.6);
    arc(xCenter, eyeY +15, circleSize/4.5, circleSize/4.6, 0, PI);

    //EyeLid
    fill(0);
    beginShape();
    float x = xCenter-circleSize/1.4/2;
    vertex(x - 20, eyeY -2 ); // first point
    bezierVertex(x + 30, yCenter + 30, x + circleSize/1.4 - 30, yCenter + 30, x + circleSize/1.4 + 20, eyeY - 2);
    endShape();
    //arc(xCenter, eyeY, circleSize/1.4, circleSize/1.5, PI, TWO_PI);

    xTheta += 0.02;
    yTheta += 0.02;
    xCenter= saveCenterX;
    yCenter = saveCenterY;
  }

  void drawGradient(float x, float y) {
    float di = circleSize/2.2;
    float c;
    for (float d = di; d > 0; d-=1) {
      if (d > di - 3) {
        c = 0;
      } else { 
        c = map(d, circleSize/2.2, 0, 10, 130);
      }
      //System.out.println(c);
      noStroke();
      fill(c);
      //ellipse(x, y, d, d);
      arc(x, y, d, d, 0, PI);
    }
  }
}
