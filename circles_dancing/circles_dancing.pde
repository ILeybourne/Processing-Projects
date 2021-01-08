void setup() {
  size(800, 800);
  background(255);
  colorMode(HSB, 100);
  stroke(100);
}
float l =1, m =1;
Boolean lTrue = false;
float d=0;
float n = pow((1.618/10 + PI )/1.333*7.2,-1.4);

void draw() {
  background(255,0,200);
  translate(width/2, height/2);
  rotate(0+d);
  //stroke(255);
  strokeWeight(0.01);

  noFill();
  beginShape(POLYGON);

  for (float i =0; i< 2*TWO_PI; i += TWO_PI/(361*4)) {
    float k = i * d;
    float r = 350 * sin(n*k) * l * m;
    float x = r * cos(k)*cos(k);
    float y = r * sin(k)*cos(k);

    x+=width/2;
    y+=height/2;

    int c;
    if ((width/2) == (int)(x) && height/2 == (int)(y)) {
      c =100;
    }

    float dis = sqrt(pow(abs((width/2) - (int)(x)), 2) + pow(abs((height/2) - (int)(y)), 2));
    c = (int)map(dis, 0, sqrt(pow(abs((width/2) - (0)), 2) + pow(abs((height/2) - (0)), 2)), 0, 125);
    x-=width/2;
    y-=height/2;

    curveVertex(x, y);
    //stroke(c, 100, 100);
    stroke(0);
  }
  d+= PI/100;
  //if(d>10){
  //  d -=0.0;
  //}
  //n+=0.0000001;
  if(d > 30){
    lTrue = true;
  }
  if (lTrue){
    l -= 0.005;
    n+=0.00003;
  }
  if(l < 0){
    l = 0;
    noLoop();
   delay(50000); 
  }
  if (d> 52){
    m -= 0.025;
  }
  if(m<=0){
    noLoop();
  }
  System.out.println(d);
    System.out.println(l);
    System.out.println(m);
  endShape();
  
  saveFrame("movie/frame-######.png");
}
