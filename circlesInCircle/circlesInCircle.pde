

void setup() {
    size(500,500);
}

void draw() {
    background(255);
    circle(width/2,height/2,200);
    float circleNum = mouseX/49;
    for(int i = 1; i <= circleNum;i++){
        
        circle(width/2 + 160*sin((PI*2*i/circleNum)+2*PI*height/(mouseY+1)), height/2 + 160*cos((PI*2*i/circleNum)+2*PI*height/(mouseY+1)), 40);
    }
}
