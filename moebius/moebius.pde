/** a 3D rotating moebius-Strip my 
<a href="http://www.local-guru.net/blog">guru</a>
*/

void setup() {
  size(550,400,P3D);
  colorMode(HSB, 100);
}

float a = 0;
void draw() {
  background(0,0,100);
  lights();
  noStroke();
  fill(0,100,100);
  float r = 150;
  translate( width/2, height/2 , -100);
  a += 0.01;
  //rotateY( a );
  rotateX( a );
  rotateZ( a );
  beginShape( QUAD_STRIP );
  for ( int i =0; i < 360; i++) {
    float x = cos( radians( i * 5.0)) * 30;   
    float z = sin( radians( i * 5.0)) * 30;

    float xa = ( r + x ) * cos( radians( i * 10.0 ));
    float ya = ( r + x ) * sin( radians( i * 10.0 ));

    float xb = ( r - x ) * cos( radians( i * 10.0 ));
    float yb = ( r - x ) * sin( radians( i * 10.0 ));

    float hue = parseFloat(i)/360 * 100;
    print(hue + "  ");
    fill(hue,100,100);
    vertex( xa, ya, z );
    vertex( xb, yb,-z );
  }
  endShape(CLOSE);
  saveFrame("movie/frame-######.png");
}
