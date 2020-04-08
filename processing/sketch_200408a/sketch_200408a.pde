import processing.serial.*;
Serial myPort;
String val;
int index = int(random(0, 4));
String[] answers= {
"Frankly, my dear, I don't give a damn.", 
"Louis, I think this is the beginning of a beautiful friendship.",
"As if!",
"You've got to ask yourself one question: 'Do I feel lucky?' Well, do ya, punk?", 
"What we've got here is failure to communicate."
};
PFont font;
void setup()
{
   
  size(1200,600);
  background(0);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  
} 

void draw()
{
  if (myPort.available()>0)
  {
    val = myPort.readStringUntil('\n');
    println(val);
    drawtext();
  }
 println("standing by");
 delay(70);
 
}

void drawtext(){
  
  font = createFont("f1.ttf", 16,true);
  textFont(font);
  text(answers[index],30, height/2);  
  }
  
