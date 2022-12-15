class picture {
  PImage img;
  float x, y, w, h;

  picture(String p, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    img = loadImage(p);
  }

  void show() {
    image(img, x, y, w, h);
  }
}
