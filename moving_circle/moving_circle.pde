
int x = int(random(1281)); // X-Position of cirle
int y = int(random(1081)); // Y-Position of cirle
int ranNumbX = 0;          // "random Number X"
int ranNumbY = 0;          // "random Number Y"
int s = 6;               // Speed of circle

void setup() {
  size(1280,1080);
  ellipseMode(CENTER);
  fill(0,255,0,70);
  noStroke();
  smooth();
  frameRate(999999999);
}

void draw() {
  background(255);
  ranNumbX = int(random(-s,s));
  ranNumbY = int(random(-s,s));
  if (x + ranNumbX > 0 && x + ranNumbX < 1281 && y + ranNumbY > 0 && y + ranNumbY < 1080) {    // So the circle will stay in the window
    x = x + ranNumbX;
    y = y + ranNumbY;
  }
  ellipse(x,y,200,200);
}
