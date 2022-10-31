float colobr = 0;
float rise = 0;

void setup() {
  size(700,700);
  colorMode(HSB);
  rectMode(CENTER);
  frameRate(9999);
  noStroke();
  background(255);
  smooth();
}

void draw() {
  rise += 0.0005;
  if (key == TAB) {
    background(255);
  }
  if (pmouseX != mouseX || pmouseY != mouseY) {
    println(rise);
    if (colobr > 254) {
      colobr = 0;
    }
    colobr += rise;
    fill(colobr,255,255);
    ellipse(mouseX,mouseY,50,50);
  }
}
