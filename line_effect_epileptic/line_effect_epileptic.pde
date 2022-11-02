// line_effect with rect()
float h = 1080;
float w = 1920;

void setup() {
  fullScreen();
  background(0);
  strokeWeight(1);
  frameRate(200);

}

void draw() {
  fill(random(256),random(256),random(256));
  stroke(random(256),random(256),random(256));
  h -= 1;
  w -= 1.777777777777777777777777777777;
  println(width/height);
  rectMode(CENTER);
  rect(width/2,height/2,w,h);
  if (h == -1080) {
    h = 1080;
    w = 1920;
  }
}
