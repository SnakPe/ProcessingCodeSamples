public class PhysObject{
    protected float x, y;
    protected float xVel, yVel;
    private float orgY;
    private float xDrag = 0.5;
    private float yDrag = 0.1; 
    PhysObject(){
        x = 500;
        y = 500;
        xVel = 0;
        yVel = 0;
        orgY = 0;
    }
    void draw(){

        y-= yVel;
        yVel -= yDrag;
        orgY += yVel;
        if(orgY < 0){
            System.out.println("yVel:"+yVel+" orgY:"+orgY+" y:"+ y);
            if(yVel != orgY)y-=yVel;
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
    if(keyPressed){
        switch(key){
            case ' ':
                
                test.yVel = 3;
                break;
        }
        
        switch(keyCode){
            
            case RIGHT:
                test.xVel = 3;
                break;
            case LEFT:
                test.xVel = -3;
                break;
            default:

                break;
        }
    }
    
}
