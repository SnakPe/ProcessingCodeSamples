int x = 0;
int y = 0;
int speed = 10; // I wonder what this does dumbass
int won = 0;

void setup() {
  fullScreen();
  rectMode(CENTER);
  textSize(20);
  x = width/2;
  y = height/2;
}

void draw() {
  background(255);
  
  stroke(0,0,0,125);
  strokeWeight(2);
  rect(x,y,100,100);
  
  stroke(0,0,0,255);
  strokeWeight(10);
  ellipse(x,y,50,50);
  point(x,y);         //makes it look E P I C C
  
  if (mouseX > x && mouseX < x + 50 && mouseY - y < 51 && mouseY - y > -51) {    //sets parametres for the area the point should start to move
    x = x - speed;
  }
  if (mouseX < x && mouseX > x - 50 && mouseY - y < 51 && mouseY - y > -51) {
    x = x + speed;
  }                                                                                  
  if (mouseY > y && mouseY < y + 50 && mouseX - x < 51 && mouseX - x > -51) {
    y = y - speed;
  }
  if (mouseY < y && mouseY > y - 50 && mouseX - x < 51 && mouseX - x > -51) {
    y = y + speed;
  }
  if (keyCode == TAB) {    // resets point
    x = width/2;
    y = height/2;
  }
  if (mouseX == x && mouseY == y) {    // sets win condition
    won = 1;
  }
  if (won == 1) {
    fill(0);
    text("HOW?!",width/2,height/4);
    fill(255);
  }
}
