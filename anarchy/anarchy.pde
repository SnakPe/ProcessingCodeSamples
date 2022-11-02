void setup() {
  fullScreen();
  frameRate(1999999999);
}

void draw() {
  background(random(256),random(256),random(256));
  fill(random(256),random(256),random(256));
  stroke(random(256),random(256),random(256));
  rect(random(width),random(height),random(width),random(height));
  rect(random(width),random(height),random(width),random(height));
  rect(random(width),random(height),random(width),random(height));
  rect(random(width),random(height),random(width),random(height)); 
  rect(random(width),random(height),random(width),random(height)); 
  line(random(width),random(height),random(width),random(height));
  line(0,0,mouseX,mouseY);
}
