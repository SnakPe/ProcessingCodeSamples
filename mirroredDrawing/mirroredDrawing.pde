int prevX,prevY;
float[][] linesWithBorders = new float[1][4];
void setup(){
  fullScreen();
  frameRate(99999999);
  smooth();
}
private void addLineWithBorder(float x1,float y1,float x2,float y2){
    float[][] temp = new float[linesWithBorders.length+1][4];
    for(int i = 0; i < linesWithBorders.length;i++){ //<>//
      temp[i][0] = linesWithBorders[i][0];
      temp[i][1] = linesWithBorders[i][1];
      temp[i][2] = linesWithBorders[i][2];
      temp[i][3] = linesWithBorders[i][3];
    }
      temp[temp.length-1][0] = x1;
      temp[temp.length-1][1] = y1;
      temp[temp.length-1][2] = x2;
      temp[temp.length-1][3] = y2;
      linesWithBorders = temp;
}
private void drawLinesWithBorder(){
  stroke(0);
  strokeWeight(15);
  for(int i = 0; i < linesWithBorders.length;i++){
    line(linesWithBorders[i][0],linesWithBorders[i][1],linesWithBorders[i][2],linesWithBorders[i][3]);
  }
  stroke(255);
  strokeWeight(10);
  for(int i = 0; i < linesWithBorders.length;i++){
    line(linesWithBorders[i][0],linesWithBorders[i][1],linesWithBorders[i][2],linesWithBorders[i][3]);
  }
}
void draw() {
    background(255);
  if(mousePressed){
    stroke(255,0,0);
    strokeWeight(1);
    line(0,height/2,width,height/2);
    line(width/2,0,width/2,height);
    addLineWithBorder(mouseX,mouseY,prevX,prevY);
    addLineWithBorder(width-mouseX,mouseY,width-prevX,prevY);
    addLineWithBorder(mouseX,height-mouseY,prevX,height-prevY);
    addLineWithBorder(width-mouseX,height-mouseY,width-prevX,height-prevY);
  }
  prevX = mouseX;
  prevY = mouseY;
  this.drawLinesWithBorder();
}
