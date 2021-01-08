void setup() {
  size(400, 720);
  background(255);
  colorMode(HSB, 100);
  //stroke(100);
}
float l =1, m =1;
Boolean lTrue = false;
float d=0;
float n = ((1.618 + PI )/1.333*7.2 + random(-1.4));

void draw() {
  background(255,0,255);
  translate(width/2, height/2 - 100);
  //rotate(0+d);
  //stroke(255);
  strokeWeight(0.01);

  noFill();
  beginShape(POLYGON);

  for (float i =0; i< 2*TWO_PI; i += TWO_PI/(361*4)) {
    float k = i * d;
    float r = d * sin(n*k) ;
    float x = r * 1/cos(k) *l;
    float y = r * 1/sin(k) * l;

    x+=width/2;
    y+=height/2 -100;

    int c;
    //if ((width/2) == (int)(x) && height/2 == (int)(y)) {
    //  c =100;
    //}

    float dis = sqrt(pow(abs((width/2) - (int)(x)), 2) + pow(abs((height/2) - (int)(y)), 2));
    c = (int)map(dis, 0, sqrt(pow(abs((width/2) - (0)), 2) + pow(abs((height/2) - (0)), 2)), 0, 90);
    x-=width/2;
    y-=height/2 -100;

    curveVertex(x, y);
    //stroke(c, 100, 100);
    
    //stroke(0,0,0,c);
  }
  d+= random(2)/10;
  if(d>100){
    l-=0.005;
  }
  if(l<0)
    noLoop();
  n+= 0.01;
  System.out.println(d);
    System.out.println(l);
    System.out.println(m);
  endShape();
}
