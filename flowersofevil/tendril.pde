
class Tendril {
  float wide, cpx1, cpy1, cpx2, cpy2, xpos, ypos, xTheta, yTheta, angle, scale, frame = 0, xOffset, yOffset;
  Tendril(float w, float ang, float sf, float x, float y ) {
    wide= w;
    cpx1= 0;
    cpy1= 0;
    cpx2= 0;
    cpy2= 0;
    xpos= 0;
    ypos= 0;
    xTheta= random(1, 360);
    yTheta= random(1, 360);
    angle = ang;
    scale = sf;
    xOffset = x;
    yOffset = y;
  }

  void getLocations() {
    float[] center = {xCenter, yCenter};
    float hw = wide/2;
    float beforeHalf =random(0, xCenter);
    float afterHalf = random(xCenter, width);

    //float[] v1 = {v1x, v1y};
    //float[] v2 = {v2x, v2y};
    //float[] v3 = {v3x, v3y};
    //float[] v4 = {v4x, v4y};
    float xOffset = noise(xTheta*20) * cos(xTheta*20) * 2;
    float yOffset = noise(yTheta*20) * sin(yTheta  * 2) * 2;
    cpx1 = xCenter + (( 100 *   sin(xTheta *8))) ;
    cpy1 = yCenter/2*3 + (noise(xTheta)  * 10* cos(2*xTheta+3)) * 25 - yOffset  + 100; 
    cpx2 = width - cpx1 - (60 * noise(xTheta))/2;
    cpy2 = height - (cpy1 - (yCenter/2*3 ));//60 * noise(yTheta);
    xpos = xCenter - xOffset /10;
    ypos = height -10- noise(yTheta) * 20;
  }

  void drawFrame() { 
    getLocations();
    pushMatrix();

    float radAngle = (angle ) * (float)(Math.PI/180);
    translate(xCenter, yCenter);
    translate(xOffset - xCenter, yOffset - yCenter);
    rotate(radAngle);
    scale(scale);
    translate(-xCenter, -yCenter);

    //fill(255, 0, 0);
    //ellipse(cpx1, cpy1, 5, 5);
    //fill(0, 0, 255);
    //ellipse(cpx2, cpy2, 5, 5);

    float hw = wide/2;
    fill(0);
    stroke(255);

    //vertex(xCenter-20, yCenter); // first point
    //bezierVertex(25, height, width/4 * 3, yCenter, xCenter, height);
    //bezierVertex( width/4 * 3, yCenter, 25+ 20, height- 20, xCenter+20, yCenter);
    beginShape();
    vertex(xCenter-hw/2, (yCenter - hw/2) ); // first point
    bezierVertex(cpx1, cpy1, cpx2, cpy2, xpos, ypos);
    bezierVertex( cpx2, cpy2, cpx1 + hw, cpy1- hw, xCenter + hw, (yCenter - hw) );
    endShape();
    popMatrix();

    stroke(0);
    xTheta += 0.002;
    yTheta += 0.0004;
    frame++;
    angle += noise(xTheta)*sin(xTheta) / 200;
  }
}
