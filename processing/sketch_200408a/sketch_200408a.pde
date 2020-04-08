import processing.serial.*;
Serial myPort;
String val;
int index = int(random(0, 5));
String[] answers= {
  "Frankly, my dear, I don't give a damn.", 
  "Louis, I think this is the beginning of a beautiful friendship.", 
  "As if!", 
  "You've got to ask yourself one question: 'Do I feel lucky?' Well, do ya, punk?", 
  "What we've got here is failure to communicate.", 
  "I see dead people."
};
PFont font;
void setup()
{

  size(1200, 600);
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
    delay(2000);
    drawtext();
  }
  println("standing by");
  delay(70);
}

void drawtext() {

  font = createFont("American Typewriter Regular.ttf", 24, true);
  textFont(font);
  //delay(2000);
  text(answers[index], 300, height/2);
}
