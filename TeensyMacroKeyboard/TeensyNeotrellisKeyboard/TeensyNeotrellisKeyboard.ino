#include "Adafruit_NeoTrellis.h"

Adafruit_NeoTrellis trellis;

#define INT_PIN 23

struct KeyData {
  uint8_t noteId;
  uint8_t color[4];
};

struct KeyData KEYS[16] = {
  {
    .noteId = 60,
    .color = {255, 0, 0, 0}
  }
};

TrellisCallback blink(keyEvent evt){
  
  if(evt.bit.EDGE == SEESAW_KEYPAD_EDGE_RISING)
    trellis.pixels.setPixelColor(evt.bit.NUM, Wheel(map(evt.bit.NUM, 0, trellis.pixels.numPixels(), 0, 255))); //on rising
  else if(evt.bit.EDGE == SEESAW_KEYPAD_EDGE_FALLING)
    trellis.pixels.setPixelColor(evt.bit.NUM, 0); //off falling
    
  trellis.pixels.show();
  return 0;
}


void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}
