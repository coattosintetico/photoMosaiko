float stdDev = 300;
float mean = 600;

int minMosaicSize = 100;
int maxMosaicSize = 400;

PImage img;
Effects effects = new Effects();

ArrayList<MosaikRecord> records = new ArrayList<MosaikRecord>();

void setup() {
  size(1200, 1200);
  img = loadImage("face.jpg");
  frameRate(240);
}

void draw() {
  background(0);
  image(img, 0, 0);
}

// Every time the space bar is pressed, execute the swapZones function
void keyPressed() {
  if (key == ' ') {
    img = swapZones(img);
  }
  // Undo the last swap if the 'u' key is pressed
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
  return effects.invertImage(img);
}