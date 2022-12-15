//This class represents a tactile button that can be clicked
//to cause something to happen.

class Button {

  //instance variables
  int x, y, w, h, r;  //x, y is the center
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;

  //constructor
  Button(String t, int _x, int _y, int _w, int _h, int _r, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    r = _r;
    highlight = high;
    normal = norm;
    clicked = false;
    text = t;
  }

  Button(PImage pic, int _x, int _y, int _w, int _h, int _r, color norm, color high) {
    this("", _x, _y, _w, _h, _r, norm, high);
    img = pic;
  }

  //Behaviour Functions
  void show() {
    drawBody();
    drawLabel();
    checkForClick();
  }

  void drawBody() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(highlight);
    strokeWeight(4);
    rect(x, y, w, h, r);
  }


  void drawLabel() {
    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    if (img == null) {
      textFont(bubblefont);
      textSize(w/4);
      text(text, x, y);
    } else {
      image(img, x, y, w, h);
    }
  }

  void checkForClick() {
    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked  = true;
    } else {
      clicked = false;
    }
  }
}
