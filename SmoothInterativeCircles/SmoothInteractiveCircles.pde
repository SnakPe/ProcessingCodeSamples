class PushableObj{
    int x,y,radius;
    float yVel, xVel;
    float yDrag,xDrag;
    
    PushableObj(){
        radius = 50;
        yDrag = 0.9;
        xDrag = 0.9;
    }

    void draw(){
        rect(x, y, radius, radius);

        if(mouseX > x && mouseX < x+radius){
            xVel = x+radius/2-mouseX;
        }
        if(mouseY > y && mouseY < y+radius){
            yVel = y+radius/2-mouseY;
        }
        y += yVel;
        x += xVel;
        xVel *= xDrag;
        yVel *= yDrag;
    }
}

PushableObj obj = new PushableObj();

void setup(){

}

void draw(){
    obj.draw();
}