// when you use no fill() command make strokeWeight(3 or higher)
void setup() {
fullScreen();
smooth();
strokeWeight(3);
}

float s_lineX1    = 0    ;
float s_lineY1    = 0    ;
float s_lineX2    = 0    ;
float s_lineY2    = 0    ;
float w_lineUp    = 1920 ;
float h_lineUp    = 0    ;
float h_lineLeft  = 1080 ;
float w_lineLeft  = 0    ;

float e_lineX1    = 1920 ;
float e_lineY1    = 1080 ;
float e_lineX2    = 1920 ;
float e_lineY2    = 1080 ;
float w_lineDown  = 0    ;
float h_lineDown  = 1080 ;
float h_lineRight = 0    ;
float w_lineRight = 1920 ;

int   blackWhite  = 0;
int   r = 0;
int   g = 0;
int   b = 0;
void draw() {
  if (s_lineY1 > height/2) { // makes lines coloured
    stroke(random(256),random(256),random(256));
  }
  if (s_lineY1 > 1079) { // repeats
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    
    stroke(r,g,b
    );
    s_lineX1    = 0    ;
    s_lineY1    = 0    ;
    s_lineX2    = 0    ;
    s_lineY2    = 0    ;
    w_lineUp    = 1920 ;
    h_lineUp    = 0    ;
    h_lineLeft  = 1080 ;
    w_lineLeft  = 0    ;
    
    e_lineX1    = 1920 ;
    e_lineY1    = 1080 ;
    e_lineX2    = 1920 ;
    e_lineY2    = 1080 ;
    w_lineDown  = 0    ;
    h_lineDown  = 1080 ;
    h_lineRight = 0    ;
    w_lineRight = 1920 ;
  }
    s_lineX1 += 1.777777777777778 ;
    s_lineY1 += 1;
    s_lineX2 += 1.777777777777778 ;
    s_lineY2 += 1;
    w_lineUp -= 1.777777777777778; 
    h_lineUp  += 1 ;
    h_lineLeft -= 1 ;
    w_lineLeft += 1.777777777777778 ;
    
    e_lineX1 -= 1.777777777777778 ;
    e_lineY1 -= 1;
    e_lineX2 -= 1.777777777777778 ;
    e_lineY2 -= 1;
    w_lineDown += 1.777777777777778; 
    h_lineDown  -= 1 ;
    h_lineRight += 1 ;
    w_lineRight -= 1.777777777777778 ;
    
    line(s_lineX1,s_lineY1,w_lineUp,h_lineUp);
    strokeWeight(3);
    line(s_lineX2,s_lineY2,w_lineLeft,h_lineLeft);
    strokeWeight(1);
    line(e_lineX1,e_lineY1,w_lineDown,h_lineDown);
    strokeWeight(3);
    line(e_lineX2,e_lineY2,w_lineRight,h_lineRight);
}
