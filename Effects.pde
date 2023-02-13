class Effects {
  PImage invert(PImage img) {
    PImage inverted = createImage(img.width, img.height, RGB);
    img.loadPixels();
    inverted.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      inverted.pixels[i] = color(255 - red(img.pixels[i]), 255 - green(img.pixels[i]), 255 - blue(img.pixels[i]));
    }
    inverted.updatePixels();
    return inverted;
  }
  PImage randomInvertImage(PImage img) {
    PImage inverted = createImage(img.width, img.height, RGB);
    img.loadPixels();
    inverted.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      inverted.pixels[i] = color(
        constrain(random(215, 295) - red(img.pixels[i]), 0, 255),
        constrain(random(215, 295) - green(img.pixels[i]), 0, 255),
        constrain(random(215, 295) - blue(img.pixels[i]), 0, 255)
        );
    }
    inverted.updatePixels();
    return inverted;
  }
  PImage invertButNotRed(PImage img) {
    PImage inverted = createImage(img.width, img.height, RGB);
    img.loadPixels();
    inverted.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      inverted.pixels[i] = color(red(img.pixels[i]), 255 - green(img.pixels[i]), 255 - blue(img.pixels[i]));
    }
    inverted.updatePixels();
    return inverted;
  }
  PImage invertButNotGreen(PImage img) {
    PImage inverted = createImage(img.width, img.height, RGB);
    img.loadPixels();
    inverted.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      inverted.pixels[i] = color(255 - red(img.pixels[i]), green(img.pixels[i]), 255 - blue(img.pixels[i]));
    }
    inverted.updatePixels();
    return inverted;
  }
  PImage invertButNotBlue(PImage img) {
    PImage inverted = createImage(img.width, img.height, RGB);
    img.loadPixels();
    inverted.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      inverted.pixels[i] = color(255 - red(img.pixels[i]), 255 - green(img.pixels[i]), blue(img.pixels[i]));
    }
    inverted.updatePixels();
    return inverted;
  }
}