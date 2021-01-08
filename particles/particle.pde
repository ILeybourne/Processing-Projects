class Particle{
  int id;
  float xpos, ypos, speed, angle, size; 
  Particle (int iD,float x, float y, float sp, float a ,float si) {  
    id = iD;
    ypos = y; 
    speed = sp; 
    xpos= x;
    angle = a;
    size = si; 
  } 
  void update() { 
    double radians = (Math.PI / 180) * (angle); 
    xpos = (int)(xpos + speed * Math.cos(radians)); 
    ypos = (int)(ypos + speed * Math.sin(radians));
    //ypos += speed; 
    if (ypos > height) { 
      ypos = 0; 
    } 
    if (ypos <0 ) { 
      ypos = height; 
    } 
    if (xpos > width) { 
      xpos = 0; 
    } 
    if (xpos < 0) { 
      xpos = width; 
    } 
    fill(map(size,2,50,255,0));
    ellipse(xpos, ypos, size ,size);
    //System.out.println(speed);
    stroke(map(size,2,50,0,255));
    if(map(size,2,50,0,255)> 125 && map(size,2,50,0,255)< 135){
      stroke(0);
    }
    line(xpos, ypos, (int)(xpos + (size /2  * Math.cos(radians))), (int)(ypos + (size * Math.sin(radians))/2)); 
  } 
}
