abstract class PushableObj{
    float x,y;
    float yVel, xVel;
    final float yDrag,xDrag;
    static final float diameter = 100;

    PushableObj(int x, int y){
        this.x = x;
        this.y = y;
        yDrag = 0.95;
        xDrag = 0.95;
    }
    abstract void draw();
    void updatePosition(){
        y += yVel;
        x += xVel;
        xVel *= xDrag;
        yVel *= yDrag;
    }
}

class PushableBlock extends PushableObj{
    PushableBlock(int x, int y){
        super(x,y);
    }
    void draw(){
        if(mouseX > x-diameter/2 && mouseX < x+diameter/2 && mouseY > y-diameter/2 && mouseY < y+diameter/2){
            //xVel = (1/(x+diameter/2-mouseX)*diameter/2)/2;
            xVel = (abs(x-mouseX) > 3) ? (1/(x-mouseX))*(diameter/4) : 0;
            //yVel = (1/(y+diameter/2-mouseY)*diameter/2)/2;
            //yVel = (1/(mouseY-(y+diameter)))*25;
            yVel = (abs(y-mouseY) > 3) ? (1/(y-mouseY))*(diameter/4) : 0;
        }
        rect(x, y, diameter, diameter);
        updatePosition();
    }
}


class PushableCircle extends PushableObj{
    float radius;
    PushableCircle(int x, int y){
        super(x,y);
        radius = diameter/4;
    }
    protected boolean touchesCircle(){
        float distanceVectorX = mouseX-x;
        float distanceVectorY = mouseY-y;
        boolean result = sqrt(sq(distanceVectorX)+sq(distanceVectorY)) <= radius;
        return result;
    }
    void draw(){
        circle(x, y, diameter/2);
        if(touchesCircle()){
            float distanceVectorX = x-mouseX;
            float distanceVectorY = y-mouseY;
            xVel = distanceVectorX/2;
            yVel = distanceVectorY/2;
        }
        updatePosition();
    }
}

class PushableCircleFollowing extends PushableCircle{
    PushableCircleFollowing(int x, int y){
        super(x,y);
        
    }
    void draw(){
        circle(x, y, diameter/2);
        if(touchesCircle()){
            float distanceVectorX = mouseX-x;
            float distanceVectorY = mouseY-y;
            xVel = distanceVectorX;
            yVel = distanceVectorY;
        }
        updatePosition();
    }
    
}
class BouncingCircle extends PushableCircle{
    BouncingCircle(int x,int y){
        super(x,y);
    }
    void draw(){
        circle(x, y, diameter/2);
        if(touchesCircle()){
            float distanceVectorX = x-mouseX;
            float distanceVectorY = y-mouseY;
            xVel = distanceVectorX/2;
            yVel = distanceVectorY/2; 
        }
        if(x-radius < 0 || x+radius > width)xVel *= -1;
        if(y-radius < 0 || y+radius > height)yVel *= -1;
        updatePosition();
    }
}

PushableObj[] objects;
int selection = 0;
boolean onSelection = false;

void setup(){
    rectMode(CENTER);
    smooth();
    size(700,700);
    //fullScreen();
    objects = new PushableObj[0];
}

void draw(){
    background(255);
    drawUI();
    for(PushableObj obj : objects)obj.draw();
}

void drawUI(){
    rectMode(CORNER);
    rect(width-70,30,50,200);
    //Hover highlighting
    if(mouseX>width-70 && mouseX<width-20 && mouseY>30 && mouseY < 230){
        onSelection = true;
        noStroke();
        fill(175);
        //highlight square
        if(mouseY<80){
            rect(width-69,31,49,49);
            if(mousePressed)selection = 0;
        }
        //highlight circle
        else if(mouseY<130){
            rect(width-69,80,49,50);
            if(mousePressed)selection = 1;
        }
        //highlight following circle
        else if(mouseY<180){
            rect(width-69,130,49,50);
            if(mousePressed)selection = 2;
        }
        //highlight bouncing circle
        else if(mouseY<230){
            rect(width-69,180,49,50);
            if(mousePressed)selection = 3;
        }
    }
    else if(onSelection)onSelection=false;
    //selection highlighting
    noStroke();
    fill(50,255,0);
    rect(width-69,31+50*selection-(selection == 0 ? 0 : 1),49,50);

    //icons
    stroke(0);
    fill(255);
    rect(width-60,40,30,30);
    circle(width-45, 105, 30);
    circle(width-45, 155, 30);
    fill(0);
    text("f",width-45,155);
    fill(255);
    circle(width-45, 205, 30);
    fill(0);
    text("b",width-45,205);
    fill(255);
    rectMode(CENTER);
}

void mousePressed() {
    if(!onSelection){
        switch (selection) {
            case 0 :
                objects = (PushableObj[])append(objects,new PushableBlock(mouseX,mouseY));
            break;
            case 1 :
                objects = (PushableObj[])append(objects,new PushableCircle(mouseX,mouseY));
            break;
            case 2 :
                objects = (PushableObj[])append(objects,new PushableCircleFollowing(mouseX,mouseY));
            break;
            case 3 :
                objects = (PushableObj[])append(objects,new BouncingCircle(mouseX,mouseY));
            break;
        }
    }   
}