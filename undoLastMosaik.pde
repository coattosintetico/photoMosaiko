PImage undoLastMosaik(PImage imgSrc) {
  /*
    Undo the last mosaik in the records array list and delete it.
  */
  PImage img = imgSrc.get();
  if (records.size() > 0) {
    // Get the last record from the array list
    MosaikRecord lastRecord = records.get(records.size() - 1);

    // Save its variables for easier access
    int x = lastRecord.x;
    int y = lastRecord.y;
    int sx = lastRecord.sx;
    int sy = lastRecord.sy;

    // Save the rectangles in temporary images
    PImage tmp1 = img.get(x,    y-sy/2, sx, sy);
    PImage tmp2 = img.get(x-sx, y-sy/2, sx, sy);

    // Copy the rectangles in their original positions
    img.copy(tmp1, 0, 0, sx, sy, x-sx, y-sy/2, sx, sy);
    img.copy(tmp2, 0, 0, sx, sy, x,    y-sy/2, sx, sy);

    // Remove the last record from the array list
    records.remove(records.size() - 1);
  }
  return img;
}