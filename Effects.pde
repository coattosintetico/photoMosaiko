class Effects {
  PImage invertImage(PImage img) {
    PImage inverted = createImage(img.width, img.height, RGB);
    img.loadPixels();
    inverted.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      inverted.pixels[i] = color(255 - red(img.pixels[i]), 255 - green(img.pixels[i]), 255 - blue(img.pixels[i]));
    }
    inverted.updatePixels();
    return inverted;
  }
}