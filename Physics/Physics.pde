public class PhysObject{
    protected float x, y;
    protected float xVel, yVel;
    private float orgY; 
    PhysObject(){
        x = 500;
        y = 500;
        xVel = 0;
        yVel = 0;
        orgY = 0;
    }
    void draw(){
        float xDrag = 0.5;
        float yDrag = 0.1;

        y-= yVel;
        yVel -= yDrag;
        orgY += yVel;
        if(orgY < 0){
            yVel = 0;
            orgY = 0;
        }

        x += xVel;
        if(abs(xVel) < xDrag) xVel = 0;
        else if(xVel > 0)xVel -= xDrag;
        else if(xVel < 0)xVel += xDrag;

        rect(x,y,50,50);
    }
}


void setup(){
    fullScreen();   
}

PhysObject test = new PhysObject();
int oldKC;
void draw(){
    background(255);
    test.draw();
    
    switch(key){
        case ' ':
            test.yVel = 3;
            break;
        default:
            key = 0;
            break;
    }
    
    if(oldKC != keyCode)switch(keyCode){
        
        case RIGHT:
            test.xVel = 3;
            break;
        case LEFT:
            test.xVel = -3;
            break;
        default:

            break;
    }
    oldKC = keyCode;
}
