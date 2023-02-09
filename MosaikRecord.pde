import java.util.Random;

class MosaikRecord {

  Random generator;
  
  // The position of the rectangle
  int x, y;
  // The size of the rectangle
  int sx, sy;

  MosaikRecord(int w, int h) {
    // Create a new generator for random numbers
    generator = new Random();

    // Generate a random position on the image using a Gaussian distribution
    x = constrain(round((float) (generator.nextGaussian()) * stdDev + mean), 0, w);
    y = constrain(round((float) (generator.nextGaussian()) * stdDev + mean), 0, h);

    // Generate a random size for the rectangles
    sx = int(random(minMosaicSize, maxMosaicSize));
    sy = int(random(minMosaicSize, maxMosaicSize));

    // Check that the rectangles are inside the image
    if (x-sx < 0) {sx = x;}
    else if (x+sx > w) {sx = w-x;}
    if (y-sy < 0) {sy = y;}
    else if (y+sy > h) {sy = h-y;}
  }
}