/*
Sketch to scramble an image by cutting random squares (mosaiks) and swapping
them. The image can be restored afterwards, because the mosaiks' positions are
being kept.

The mosaiks get modified by the applyEffect function.

Controls:
- SPACEBAR: swap two mosaiks
- u: undo the last change
*/

float stdDev = 300;
float mean = 600;

int minMosaicSize = 50;
int maxMosaicSize = 400;

PImage img;
Effects effects = new Effects();

// The mosaiks are going to be stored in an arraylist to be rebuilt later
// The class MosaikRecord holds the information about the mosaik (position,
// size, etc)
ArrayList<MosaikRecord> records = new ArrayList<MosaikRecord>();

void setup() {
  size(1200, 1200); // the image must be pre-resized to match the canvas size
  img = loadImage("face.jpg");
  frameRate(240); // don't cap the framerate at 60
}

void draw() {
  background(0);
  image(img, 0, 0);
}

void keyPressed() {
  if (key == ' ') {
    img = swapZones(img);
  }
  if (key == 'u') {
    img = undoLastMosaik(img);
  }
}

PImage applyEffect(PImage img) {
  /*
    This function controls which effect is applied to the rectangles that are
    being swapped. It's called inside the swapZones function, when the
    rectangles are being "extracted" and then swapped.

    If no effect is desired, simply return the img parameter.
  */
  float choice = random(1);
  if (choice < 0.33) {
    return effects.invertButNotRed(img);
  } else if (choice < 0.66) {
    return effects.invertButNotGreen(img);
  } else {
    return effects.invertButNotBlue(img);
  }
}