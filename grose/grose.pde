PImage g;
void setup(){
  size(480,640);
  g = loadImage("g.png");
}

void draw(){
 background(255);
  image(g, 0, 0,g.width/2, g.height/2);
}
