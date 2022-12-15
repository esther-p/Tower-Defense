//This function draws the INTRO screen.

void intro() {
  //background
  imageMode(CORNER);
  introAnimation.show();
  start.show();
  
  //text and image
  textSize(80);
  fill(lightneongreen);
  text("Forest Defense", width/2, 270);
  image(frog, 500, 310, 500, 500);

  if (start.clicked) {
    mode = MAPSELECT;
    imageMode(CENTER);
  }
}
