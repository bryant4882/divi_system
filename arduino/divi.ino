#include <CapacitiveSensor.h>

CapacitiveSensor cs_4_2 = CapacitiveSensor(4,2); // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired
int LEDPin = 13;

void setup() 
{
  Serial.begin(9600);
 cs_4_2.reset_CS_AutoCal();
 cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF); // turn off autocalibrate on channel 1 — just as an example
pinMode(LEDPin, OUTPUT);
}

void loop() 
{

 long start = millis();
 long total1 = cs_4_2.capacitiveSensor(10);
 //Serial.println(total1);
 if (total1 > 300) {
 digitalWrite(LEDPin, HIGH);
 Serial.println(total1);
 delay(100);
 
 }
else
 digitalWrite(LEDPin, LOW);
}
