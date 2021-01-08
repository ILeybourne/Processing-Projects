Particle[] pList = new Particle[2];
float[][] spaceO = new float[2][3];

void setup(){
  size(500, 500);
  background(#FFFFFF);
  
  for(int i = 0; i < 2; i++){
    float[] ranStats = getRandomStats();
    Particle p  = new Particle(i,ranStats[0],ranStats[1],ranStats[2],ranStats[3],ranStats[4]);
      pList[i] = (p);
    while(checkCollision() != null){
      ranStats = getRandomStats();
       p = new Particle(i,ranStats[0],ranStats[1],ranStats[2],ranStats[3],ranStats[4]);
      pList[i] = (p);
    }
    
    
   
   // Particle p = new Particle(i,ranStats[0],ranStats[1],ranStats[2],ranStats[3],ranStats[4]);
   // pList[i] = (p);
    spaceO[i][0] = ranStats[0];
    spaceO[i][1] = ranStats[1];
    spaceO[i][2] = ranStats[2];
    p.update();
  }
}

float[] getRandomStats(){
   float ranX = round(random(1,500));
    float ranY = round(random(1,500));
    float size = 59;
    float speed = (6 / size ) + 1;
    float ranAngle = random(0,359);
    float[] a = {ranX, ranY, speed, ranAngle , size};
    return a;
}

void draw(){
  //Particle p = new Particle(50,50,50,50,50);
  //Particle p2 = new Particle(50,400,40,360,40);
  //p.update();
  //p2.update();
  background(#FFFFFF);
  for(Particle p : pList){
    if(p !=null){
    int r=  round(random(1));
    float an;
    if(r ==1){
      an = -2 + noise(-19, 24);
    }else{
      an = 2 - random(-23,20);}
    p.angle += an ;
   
    while(checkCollision() != null){
      //System.out.print("yes");
      Particle[] a = checkCollision();
      handleCollision(a[0], a[1]);
    }
    
    p.update();  
    
  }}
}

void genPart(int i){   
  System.out.print("fdfsf");
    float[] ranStats = getRandomStats();
    Particle p  = new Particle(i,ranStats[0],ranStats[1],ranStats[2],ranStats[3],ranStats[4]);
      //pList[i] = (p);
      int counter = 0;
    while(checkCollision() != null && counter < 100){
      ranStats = getRandomStats();
       p = new Particle(i,ranStats[0],ranStats[1],ranStats[2],ranStats[3],ranStats[4]);
      pList[i] = (p);
      System.out.print("stuck in a while");
      System.out.print(i);
      counter++;
    }
    if (counter == 100){
      pList[i] = null;
    }
}

Particle[] checkCollision(){
  for(int i =0; i < pList.length -1  ; i++){
     for(int j = i+1; j < pList.length  ; j++){
       if(pList[i] != null && pList[j] != null){
       float d = dist(pList[i].xpos, pList[i].ypos, pList[j].xpos,pList[j].ypos  );
       
       if (d < pList[i].size){ 
         Particle[] a = {pList[i],pList[j]};
         return a;
       }
       
       if(d < pList[j].size){
         Particle[] a = {pList[j],pList[i]};
         return a;
       }
       
     }
   }
  }
  return null;
}

void handleCollision(Particle p1 , Particle p2){
  System.out.println("handle");
  System.out.println(p1.id + " " + p2.id);
   if (p1.size > p2.size){
            pList[p1.id].size += pList[p2.id].size;
            genPart(p2.id);
          } else { 
            pList[p2.id].size += pList[p1.id].size;
            genPart(p1.id);
          }
}
