PImage swapZones(PImage imgSrc) {
  /*
    A function that takes a random position from the image and swaps two
    sections adjacent to it.

    The new modified image is returned.
  */
  PImage img = imgSrc.get();
  int w = img.width;
  int h = img.height;

  MosaikRecord r = new MosaikRecord(w, h);
  records.add(r);

  // Save the squares in temporary images
  PImage tmp1 = img.get(r.x-r.sx, r.y-r.sy/2, r.sx, r.sy);
  PImage tmp2 = img.get(r.x,      r.y-r.sy/2, r.sx, r.sy);

  // Copy the squares in the new positions
  img.copy(tmp1, 0, 0, r.sx, r.sy, r.x,      r.y-r.sy/2, r.sx, r.sy);
  img.copy(tmp2, 0, 0, r.sx, r.sy, r.x-r.sx, r.y-r.sy/2, r.sx, r.sy);

  return img;
}
