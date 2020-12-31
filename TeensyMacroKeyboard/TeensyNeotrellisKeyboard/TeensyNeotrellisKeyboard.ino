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
  },
  {
    .noteId = 61,
    .color = {255, 0, 0, 0}
  },
  {
    .noteId = 62,
    .color = {255, 0, 0, 0}
  },
  {
    .noteId = 63,
    .color = {255, 0, 0, 0}
  },
  {
    .noteId = 64,
    .color = {0, 255, 0, 0}
  },
  {
    .noteId = 65,
    .color = {0, 255, 0, 0}
  },
  {
    .noteId = 66,
    .color = {0, 255, 0, 0}
  },
  {
    .noteId = 67,
    .color = {0, 255, 0, 0}
  },
  {
    .noteId = 68,
    .color = {128, 128, 0, 0}
  },
  {
    .noteId = 69,
    .color = {128, 128, 0, 0}
  },
  {
    .noteId = 70,
    .color = {128, 128, 0, 0}
  },
  {
    .noteId = 71,
    .color = {128, 128, 0, 0}
  },
  {
    .noteId = 72,
    .color = {128, 0, 128, 0}
  },
  {
    .noteId = 73,
    .color = {128, 0, 128, 0}
  },
  {
    .noteId = 74,
    .color = {128, 0, 128, 0}
  },
  {
    .noteId = 75,
    .color = {128, 0, 128, 0}
  },
};

Encoder myEnc(5, 6);

const int CHANNEL = 1;

TrellisCallback event(keyEvent event) {
  struct KeyData *key = &KEYS[event.bit.NUM];
  
  if(event.bit.EDGE == SEESAW_KEYPAD_EDGE_RISING) {
    usbMIDI.sendNoteOn(key->noteId, 99, CHANNEL);
    trellis.pixels.setPixelColor(event.bit.NUM, trellis.pixels.Color(key->color[0], key->color[1], key->color[2]));
  } else if(event.bit.EDGE == SEESAW_KEYPAD_EDGE_FALLING) {
    usbMIDI.sendNoteOff(key->noteId, 99, CHANNEL);
    trellis.pixels.setPixelColor(event.bit.NUM, 0); //off falling
  }
    
  trellis.pixels.show();
  
  return 0;
}


void setup() {
Serial.begin(115200);
  //while(!Serial);

  pinMode(INT_PIN, INPUT);
  
  if(!trellis.begin()){
    Serial.println("could not start trellis");
    while(1);
  }
  else{
    Serial.println("trellis started");
  }

  //activate all keys and set callbacks
  for(int i=0; i<NEO_TRELLIS_NUM_KEYS; i++){
    trellis.activateKey(i, SEESAW_KEYPAD_EDGE_RISING);
    trellis.activateKey(i, SEESAW_KEYPAD_EDGE_FALLING);
    trellis.registerCallback(i, event);
  }

  //do a little animation to show we're on
  for(uint16_t i=0; i<trellis.pixels.numPixels(); i++) {
    struct KeyData *key = &KEYS[i];
    trellis.pixels.setPixelColor(i, trellis.pixels.Color(key->color[0], key->color[1], key->color[2]));
    trellis.pixels.show();
    delay(50);
  }
  for(uint16_t i=0; i<trellis.pixels.numPixels(); i++) {
    trellis.pixels.setPixelColor(i, 0x000000);
    trellis.pixels.show();
    delay(50);
  }

}

void loop() {
  if(!digitalRead(INT_PIN)){
    trellis.read(false);
  }
}
