

void setup() {
    fullScreen();
}

void draw() {
    background(255);
    circle(width/2,height/2,200);
    float circleNum = mouseX/49;
    for(int i = 1; i <= circleNum;i++){
        //the position of all the small circles relative to each other is calculated by 2PI*i / number of circles
        //the additional rotation of the circles is calculated by 
        circle(width/2 + 100*sin((PI*2*i/circleNum)+2*PI*mouseY/(height)), height/2 + 100*cos((PI*2*i/circleNum)+2*PI*mouseY/height), 40);
    }
}
