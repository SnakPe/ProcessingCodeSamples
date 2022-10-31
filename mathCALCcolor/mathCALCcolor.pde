

import java.util.Scanner;
float scaling = 10;           // how far every point is from each other (also this can easily make the graph look like dogshit if you change it's value, just don't bother :|)

int a      = int(random(100)); // extra variables for testing /not really needed 
int b      = int(random(100)); // -> same

float x  = -100*(10./scaling)-50;                  
float y  = 0;                                         


float prevX = 0;               
float prevY = 1;

int colour = 1;

void setup() {
  fullScreen(); 
  frameRate(2147483647);
  colorMode(HSB);
}

void draw() {
  stroke(colour,255,255);
  colour++;
  if (colour == 255){
    colour = 1;
  }
  
  if (scaling > 100) {
    println("scaling only up to 100!!") ;
    exit();
  }
  if (x == -100*(10.0/scaling)-50 && scaling < 101) {     // for the cross
    strokeWeight(1);
    background(255);
    line(0,height/2,width,height/2); // line for cross
    line(width/2,0,width/2,height);  // same
    strokeWeight(9);
  }
  prevX = x;
  prevY = y;
  
  x++;
  
  
  y = pow(y,x); //function f(x)
  
  
  
  y *= -1; // bc y normally goes down in Processing when you increase it
   
  point(width/2 + x * scaling, height/2 + y* scaling);  // height and width so it starts in the middle, * 10 for better visuals
  line (width/2 + prevX * scaling,height/2 + prevY* scaling,width/2 + x * scaling,height/2 + y* scaling); // same
   
}
