float maxy = 0;
float s = 0 ;
    float miny = 111111110;
class Particle{
  int id;
  Boolean right;
  float theta = 0;
  float xpos, ypos, speed, size, hue, offset; 
  Particle (float x, float y, float sp ,float si, float h, Boolean r, float off ) {  
    ypos = y; 
    speed = sp; 
    xpos= x;
    size = si; 
    hue = h;
    right = r;
    offset = off;
    theta = offset;
  } 
  void update() { 
    
    //map(hue,  100.00017,400.0,0,255);
    theta += 0.02;
    //xpos = (int)(xpos + speed * Math.cos(theta)); 
    //ypos = (int)(ypos + speed * Math.sin(theta));
    if(right){
      xpos = q3 - 70 + (float)Math.cos(theta) * 120;
      ypos = height/2 + (float)Math.sin(theta) * 150;
    }else{
      xpos = q1 + 70 + (float)Math.cos(-theta) * 120;
      ypos = height/2 + (float)Math.sin(-theta) * 150;
    }

    if(hue<255){
    hue += 0.8;
    }else{
      hue = 0;
    }
    //System.out.println(ypos);
    hue = map(ypos,400, 100, 0, 165);
    stroke(hue,height ,height);
    fill(hue ,height ,height);
    for(int i = 0; i <10; i++){
      s = s +  0.0002;
      float newX = xpos + sin(-0.1*s) *random(10) ;
      float newY = ypos + cos(-0.3*s) * random(1,40) ;
      //  float newX = xpos + sin(-1*s) *random(2) ;
      //float newY = ypos + cos(-1.5*s) * random(1,4) ;
      ellipse(newX, newY, size/10 ,size/10);
    }
    //ellipse(xpos, ypos, size ,size);
    //System.out.println(speed);
    stroke(map(size,2,50,0,255));
    //line(xpos, ypos, (int)(xpos + (size /2  * Math.cos(theta))), (int)(ypos + (size * Math.sin(theta))/2)); 
  } 
}
