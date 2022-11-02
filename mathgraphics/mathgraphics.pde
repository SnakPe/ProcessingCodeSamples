import java.util.Scanner;

int t      = 1; 
int a      = int(random(100)); // extra variables/not really needed 
int b      = int(random(100)); // -> also

float x  = 1;                // represents x
float y  = 1;                // represents y

int Switch = 1;              // just for parabolas

float prevX = 1;             // for the red lines
float prevY = 1;

void setup() {
  size(displayWidth,displayHeight); 
  frameRate(9);
  
}

void draw() {
  Switch *= -1;
  
  println(x + "                " + y);
  
  prevX = x;
  prevY = y;
  
  x = width/2  + Switch*15*t;  
  y = height/2 + t*t        ;
  
  if (x > width) {
    x = width;
  }
  if (y > height) {
    y = height;
  }
  
  stroke(255,0,0,100);
  line (prevX,prevY,x,y);
  stroke(0);
  point(x,y);
  
  if (t == 1) {
    strokeWeight(1);
    background(255);
    line(0,height/2,width,height/2);
    line(width/2,0,width/2,height);
    strokeWeight(9);
  }  
  t++;
}
