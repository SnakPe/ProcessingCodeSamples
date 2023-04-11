
int x = int(random(1281)); // X-Position of cirle
int y = int(random(1081)); // Y-Position of cirle
int ranNumbX = 0;          // "random Number X"
int ranNumbY = 0;          // "random Number Y"
int s = 12;               // Speed of circle

float colobr = 0; 
float rise = 0.05;

void setup() {
  size(1280,1080);
  ellipseMode(CENTER);

  smooth();
  frameRate(999999999);
  background(255);
  colorMode(HSB);
}

void draw() {
    if (colobr > 254) {
      colobr = 0;
    }
    colobr += rise;
  fill(colobr,255,255,5);
  ranNumbX = int(random(-s,s));
  ranNumbY = int(random(-s,s));
  if (x + ranNumbX > 0 && x + ranNumbX < 1281 && y + ranNumbY > 0 && y + ranNumbY < 1080) {
    x = x + ranNumbX;
    y = y + ranNumbY;
  }
  ellipse(x,y,250,250);
}
