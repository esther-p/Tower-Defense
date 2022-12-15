//This function draws the BUILD screen

void build() {
  drawMap();
  animateThings();
  drawBuildInterface();
  handleBuildClicks();
 
 //next wave header
  fill(255);
  text("next wave: "+ (number+1), 762, 20);

  //flashing text
  texttimer++;
  if (texttimer < 20) {
    fill(green);
    textSize(50);
    text("build mode", 337.5, 40);
  }
  if (texttimer == 40) texttimer = 0;
}

void handleBuildClicks() {
  if (playMode.clicked) {
    mode = PLAY;
  }
  //tower buying buttons --> checking for enough money, whether another tower has already been bought, etc.
  if (buyGunTower.clicked && towerbought == false) {
    if (money >= 125) {
      towers.add(new Tower(0, 0, 0, 40));
      money -= 125;
    } else {
      fill(255, 0, 0);
      text("gun\n$125", 795, 220);
    }
  }

  if (buyAoETower.clicked && towerbought == false) {
    if (money >= 50) {
      AoE_Rings.add(new AoE_Ring(0, 0, 0, 50));
      money -= 50;
    } else {
      fill(255, 0, 0);
      text("aoe\n$50", 795, 330);
    }
  }

  if (buysniperTower.clicked && towerbought == false) {
    if (money >= 150) {
      sniperTowers.add(new sniperTower(0, 0, 0, 90));
      money -= 150;
    } else {
      fill(255, 0, 0);
      text("sniper\n$150", 795, 440);
    }
  }
}

void drawBuildInterface() {
  //button area
  strokeWeight(1);
  stroke(green);
  fill(green);
  rectMode(CORNER);
  rect(675, 0, 200, 600);
  rectMode(CENTER);

  //dividers
  strokeWeight(5);
  stroke(darkgreen);
  line(690, 155, 835, 155); // 1
  line(690, 155, 835, 155); //2
  line(690, 505, 835, 505); //3
  
  //images
  image(frogtower, 715, 220, 120, 120); //frog tower
  image(sniper, 720, 425, 120, 120); //dandelion
  image(aoe, 715, 335, 120, 120); // aoe circle

  //lives and money display
  //lives
  fill(255);
  textSize(20);
  text("lives: "+lives, 762.5, 560);

  //money
  text("money: $"+money, 762.5, 525);

  playMode.show();
  buyGunTower.show();
  buyAoETower.show();
  buysniperTower.show();
}
