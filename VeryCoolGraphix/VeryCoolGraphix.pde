import g4p_controls.*;

int x, y;

int moveXPos = 0;
int moveYPos = 0;//with these 2 integers, you can move the picture of the pattern along the x- and y-axis
float size = 1; //to zoom in/out !USING ANY NUMBER THATS SMALLER THAN 1 CAN MAKE THIS CODE TAKE SUPER LONG TO RUN! dont do it (using numbers bigger than 1 has the opposite effect)

float formula; // used to change pattern

GSlider colorSlider;
String sliderStatus;

GTextField formulaInput;
String textFieldStatus;

float pixelCount; // amount of pixels that need to be "painted"
float  colorRange = 0; // used to decide how every point is coloured

void setup() {
  
  frameRate(2147483647);
  smooth();
  fullScreen();
  background(255);
  rectMode(CENTER);

  try{
    strokeWeight(size);
  }catch(IllegalArgumentException e){
    print(e.getMessage());
  }

  pixelCount = width*height/(size*size);

  formulaInput = new GTextField(this,0,height-50,300,50);
  formulaInput.setText("x+1+x");

  colorSlider = new GSlider(this, width-300, height-50, 300, 50, 20);
  colorSlider.setShowValue(true);
  colorSlider.setOpaque(true);
}

public void handleTextEvents(GEditableTextControl textcontrol, GEvent event){
  textFieldStatus = event.toString();
}

public void handleSliderEvents(GValueControl slider, GEvent event) {
  sliderStatus = event.toString();
}
private static int stringToInt(){
  String input = formulaInput.getText();
  String[] chars = input.split("");
  input = "";
  for(String ch : chars){
    if(!(ch.equals("(") || ch.equals(")"))){
      input
    }
  }

  return 
}


private void updateFormula(){
  
  
  // int i = 0;
  // while(i < tex)
  // int parsedFormula = 0
  formula = formulaInput.getValueF(); // use this to create new very cool and  E  P  I  C  graphicxxxxs ---> formula equal to y²
}

void draw() {
 
  if (sliderStatus == null || sliderStatus.equals("RELEASED")) {
    for(x = width;x > 0; x--){
      for(y = height;y > 0;y--){
        this.updateFormula(); 
        if (formula > colorRange) colorRange = formula; // instead of using the highest value of the formula, it can also be helpful to just experiment
      }
    }
    while (x*y != pixelCount) {
      this.updateFormula();  

      colorMode(HSB, (colorSlider.getValueF()*colorRange), 100, 100);
      
      
      stroke(formula % (colorSlider.getValueF()*colorRange), 100, 100);
      fill(2);
      rect(x*size-moveXPos, y*size-moveYPos,size,size);

      x++;
      if (x > width/size) {
        y++;
        x = 0;
      }
    }
   sliderStatus = "";
  }
}
