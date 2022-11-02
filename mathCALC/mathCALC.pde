// mathgraphics without the variable t so it makes more sense mathwise( is that a word?)

import java.util.Scanner;
float skalierung = 10;           // how far every point is from each other 

int a      = int(random(100)); // extra variables/not really needed 
int b      = int(random(100)); // -> same

float x  = -100*(10./skalierung)-50;                  // represents x
float y  = 0;                  // represents y


float prevX = 0;               // for the red lines
float prevY = 1;

void setup() {
  fullScreen(); 
  frameRate(2147483647);
}

void draw() {
  if (skalierung > 100) {
    println("Skalierung nur bis 100!!") ;
    exit();
  }
  if (x == -100*(10.0/skalierung)-50 && skalierung < 101) {     // for the cross
    strokeWeight(1);
    background(255);
    line(0,height/2,width,height/2); // line for cross
    line(width/2,0,width/2,height);  // same
    strokeWeight(9);
  }
  println(-100*(10/skalierung)) ;
  prevX = x;
  prevY = y;
  
  x++;
  
  
  
  y = sin(x)*100;                                                                                                                             //function f(x)
  
  
  
  y *= -1; // bc y normally goes down in Processing when you increase it (in math it goes up in graphs)
   
  stroke(0);
  point(width/2 + x * skalierung, height/2 + y);                                      // height and width so it start in the middle, * 10 for better visuals
  stroke(255,0,0,50);
  line (width/2 + prevX * skalierung,height/2 + prevY,width/2 + x * skalierung,height/2 + y); // same
   
}
