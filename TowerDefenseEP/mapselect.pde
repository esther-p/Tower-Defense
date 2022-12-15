void mapselect() {
  background(creme);

  // flashing text
  texttimer++;
  if (texttimer < 20) {
    fill(green);
    textSize(60);
    text("map select", width/2, 70);
  }
  if (texttimer == 40) texttimer = 0;

  //buttons showing
  textSize(1);
  map1select.show();
  map2select.show();

  //button images
  image(map1, width/4+20, 280, 270, 200);
  image(map2, width/4+width/2-20, 280, 270, 200);
  textSize(40);

  //borders for the picture
  //left button
  stroke(lightneongreen);
  line(95, 180, 95, 380); //top
  line(95, 180, 365, 180); //left
  line(365, 180, 365, 380); //right
  line(365, 380, 95, 380); //bottom
  //right button
  line(480, 180, 480, 380); //top
  line(480, 180, 750, 180); //left
  line(750, 180, 750, 380); //right
  line(750, 380, 480, 380); //bottom

  //button text
  fill(green);
  text("map 1", width/4+20, 405);
  text("map 2", width/4+width/2-20, 405);

  if (map1select.clicked) {
    drawmap = 1;
    nodes = map1nodes;
    mode = PLAY;
  }

  if (map2select.clicked) {
    drawmap = 2;
    nodes = map2nodes;
    mode = PLAY;
  }
}
