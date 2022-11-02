void setup() {
  fullScreen();
  strokeWeight(3);
  frameRate(999);
  rectMode(CENTER);
}

void draw() {
  if(millis() < 200) {
    background(255);
  }

  line(mouseX-50,mouseY-50,pmouseX-50,pmouseY-50);
  line(mouseX+50,mouseY-50,pmouseX+50,pmouseY-50);
  line(mouseX+50,mouseY+50,pmouseX+50,pmouseY+50);
  line(mouseX-50,mouseY+50,pmouseX-50,pmouseY+50);
}
