//This function draws the GAMEOVER screen.

void gameOver() {
  background(palegreen);
  fill(green);

  //gameover header
  textSize(80);
  text("Gameover", width/2, 70);

  //wise frog
  image(textbubble, 540, 260, 320, 220);
  image(wisefrog, 310, 370, 320, 390);
  fill(darkgreen);
  textSize(25);
  text("thank you for helping me\n save the forest agaisnt\n"+number+"  waves of mobs", 540, 220);

  menu.show();
  if (menu.clicked) {
    mode = INTRO;
    number = 0;
    reset();
    int i = 0;
    i = 0;
    while ( i < mobs.size()) {
      mobs.remove(i);
      i++;
    }
  }
}
