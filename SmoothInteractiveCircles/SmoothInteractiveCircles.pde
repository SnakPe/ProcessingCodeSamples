class PushableObj{
    float x,y;
    float yVel, xVel;
    float yDrag,xDrag;
    static final float radius = 50;

    PushableObj(int x, int y){
        this.x = x;
        this.y = y;
        yDrag = 0.95;
        xDrag = 0.95;
    }

    void draw(){
        rect(x, y, radius, radius);

        if(mouseX > x-radius/2 && mouseX < x+radius/2 && mouseY > y-radius/2 && mouseY < y+radius/2){
            //xVel = (1/(x+radius/2-mouseX)*radius/2)/2;
            xVel = (abs(x-mouseX) > 3) ? (1/(x-mouseX))*(radius/4) : 0;
            //yVel = (1/(y+radius/2-mouseY)*radius/2)/2;
            //yVel = (1/(mouseY-(y+radius)))*25;
            yVel = (abs(y-mouseY) > 3) ? (1/(y-mouseY))*(radius/4) : 0;
        }
        y += yVel;
        x += xVel;
        xVel *= xDrag;
        yVel *= yDrag;
    }
}

PushableObj[] objects;

void setup(){
    rectMode(CENTER);
    size(700,700);
    objects = new PushableObj[0];
}

void draw(){
    background(255);
    for(PushableObj obj : objects)obj.draw();
}

void mousePressed() {
    objects = (PushableObj[])append(objects, new PushableObj(mouseX,mouseY));
}