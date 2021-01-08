int caWidth = 100;
int[][][] ca = new int[caWidth][caWidth][caWidth];

void setup(){
   colorMode(HSB,200, height, height );
   frameRate(30);
  size(500, 500 ,P3D);
  background(0);
  lights();

  for (int i = 0; i < caWidth; i++){
    for (int j = 0; j < caWidth; j++){
      for (int k = 0; k < caWidth; k++){
        if(k ==caWidth/2 && j == caWidth/2  && i == caWidth/2 ){
                  ca[i][j][k] = 1;
        }else{
          ca[i][j][k] = 0;
        }
      }
    }
  }
}

void draw(){
   for (int i = 0; i < caWidth; i++){
    for (int j = 0; j < caWidth; j++){
      for (int k = 0; k < caWidth; k++){
        pushMatrix();
        translate(width/2, height/2, 0);
        noStroke();
        box(100);
        popMatrix();
      }
    }
   }
}
