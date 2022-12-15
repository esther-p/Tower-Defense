//This function draws the PLAY screen

void play() {
  drawMap();
  animateThings();
  drawPlayInterface();
  handleButtonClicks();

  // gameover screen
  if (lives <= 0) {
    mode = GAMEOVER;
    reset();
  }

  //nodes
  int i = 0;
  while (i< 10) {
    nodes[i].show();
    i++;
  }
}

void drawMap() {
  if (drawmap == 1) {
    background(mapgreen);
    strokeWeight(20);
    stroke(pathyellow);

    //path 1
    line(0, 350, 100, 350); // 1
    line(100, 350, 100, 200); //2
    line(100, 200, 300, 200); //3
    line(300, 200, 300, 300); //4
    line(300, 300, 200, 300);//5
    line(200, 300, 200, 100);//6
    line(200, 100, 400, 100); //7
    line(400, 100, 400, 450); //8
    line(400, 450, 550, 450); //9
    line(550, 450, 550, 250); //10
    line(550, 250, 675, 250); //11
    image(castle, width-170, height/2-70, 350, 200); //castle image
  }
  if (drawmap == 2) {
    background(mapgreen);
    strokeWeight(20);
    stroke(pathyellow);
    //path 2
    line(0, 300, 100, 300); // 1
    line(100, 300, 100, 170); //2
    line(100, 170, 220, 170); //3
    line(220, 170, 220, 400); //4
    line(220, 400, 100, 400);//5
    line(100, 400, 100, 500);//6
    line(100, 500, 340, 500); //7
    line(340, 500, 340, 120); //8
    line(340, 120, 550, 120); //9
    line(550, 120, 550, 420); //10
    line(550, 420, 420, 420); //11
    line(420, 420, 420, 270); //12
    line(420, 270, 800, 270); //13
    image(castle, width-160, height/2-50, 350, 200); //castle image
  }
}

void drawPlayInterface() {
  //button area
  strokeWeight(1);
  stroke(green);
  fill(green);
  rectMode(CORNER);
  rect(675, 0, 200, 600);
  rectMode(CENTER);
  nextWave.show();
  fill(255);
  textFont(bubblefont);
  textSize(30);

  //wave number
  text("wave: "+ (number), 762, 30);
  buildmode.show();

  //lives
  fill(255);
  textSize(23);
  text("lives: "+lives, 762.5, 350);

  //money
  text("money: $"+money, 762.5, 315);

  // dividers
  stroke(darkgreen);
  line(700, 170, 825, 170); // 1 top
  line(700, 290, 825, 290); //2 middle
  line(700, 380, 825, 380); //3 bottom

  //wisefrog
  image(wisefrog, 760, 525, 150, 200);
  //  image(textbubble, 764, 439, 160, 95);

  //wise frog dialogue
  if (number == 0) {
    fill(darkgreen);
    textSize(14);
    image(textbubble, 764, 439, 160, 95);
    text("Hello, my friend. Please\nhelp me save the land", 764, 425);
  }

  if (number == 1) {
    fill(darkgreen);
    textSize(14);
    image(textbubble, 764, 439, 160, 95);
    text("Thank you for agreeing \n to help save the land.", 764, 425);
  }

  if (wisefrogtalk == true && number != 0 && number%2 == 0) {
    fill(darkgreen);
    textSize(14);
    image(textbubble, 764, 439, 160, 95);
    text("You're doing great!\nKeep going!", 764, 425);
  }
  if (wisefrogtalk == true && number != 0 && number%3 == 0) {
    fill(darkgreen);
    textSize(13);
    image(textbubble, 764, 439, 170, 95);
    text("Quick! More mobs are\ncoming to destory the land!", 764, 425);
  }


  if (wisefrogtalk == false) {
    fill(darkgreen);
    textSize(14);
    image(textbubble, 764, 439, 160, 95);
    text("NOOOOO!", 764, 425);
  }
}


void animateThings() {
  int i = 0;
  while ( i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0 ||(mobs.size() == 0)) {
      bullets.remove(i);
    } else {
      i++;
    }
  }

  i = 0;
  while ( i < hugeBullets.size()) {
    hugeBullet myhugeBullet = hugeBullets.get(i);
    myhugeBullet.act();
    myhugeBullet.show();
    if (myhugeBullet.hp <= 0 ||(mobs.size() == 0)) {
      hugeBullets.remove(i);
    } else {
      i++;
    }
  }

  i = 0;
  while (i<mobs.size()) {
    Mob myMob = mobs.get(i);
    mobs.get(i).act();
    mobs.get(i).show();
    myMob. act();
    myMob.show();
    myMob.healthbar();
    if (myMob.x >= 650) {
      lives = lives - 1;
      myMob.hp = 0;
    }
    if (myMob.hp <= 0) {
      mobs.remove(i);
    } else {
      //text(myMob.hp, 30, 100);
      i++;
    }
  }
  i = 0;
  while ( i < AoE_Rings.size()) {
    AoE_Ring myAoE_Ring = AoE_Rings.get(i);
    if (mobs.size() > 0) {
      myAoE_Ring.act();
    }
    myAoE_Ring.show();
    i++;
  }
  i = 0;
  while ( i < towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) {
      myTower.act();
    }
    myTower.show();
    i++;
  }

  i = 0;
  while ( i < sniperTowers.size()) {
    sniperTower mysniperTower = sniperTowers.get(i);
    if (mobs.size() > 0) {
      mysniperTower.act();
    }
    mysniperTower.show();
    i++;
  }
}

void handleButtonClicks() {
  if (nextWave.clicked && mobs.size() == 0) {
    number++;
    addWave();
    wisefrogtalk = true;
  }
  if (buildmode.clicked) {
    if (mobs.size() <= 0)
      mode = BUILD;
  }
}

void addWave() {
  //adding mob types based on waves
  int i = 0;
  while (i < number) {
    if (drawmap == 1) {
      mobs.add(new Mob(0-i*60, 350, 1, 0));
      i++;
    }
    if (drawmap == 2) {
      mobs.add(new Mob(0-i*60, 300, 1, 0));
      i++;
    }
  }
  if (number % 3 == 0) {
    i = 0;
    while (i < number/3) {
      if (drawmap == 1) {
        mobs.add(new bigMob(0-i*100, 350, 1, 0));
        i++;
      }

      if (drawmap == 2) {
        mobs.add(new bigMob(0-i*100, 300, 1, 0));
        i++;
      }
    }
  }

  if (number % 2 == 0) {
    i = 0;
    while (i < number/2) {

      if (drawmap == 1) {
        mobs.add(new mobSpeedy(0-i*70, 350, 1, 0));
        i++;
      }
      if (drawmap == 2) {
        mobs.add(new mobSpeedy(0-i*70, 300, 1, 0));
        i++;
      }
    }
  }
}

void reset () {
  wisefrogtalk = true;
  money = 200;
  lives = 5;

//removing mobs and towers
  int i = 0;
  while ( i < AoE_Rings.size()) {
    AoE_Rings.remove(i);
    print(AoE_Rings.size());
    print(i);
    i++;
  }
  i = 0;
  while ( i < towers.size()) {
    towers.remove(i);
    i++;
  }
  i = 0;
  while ( i < sniperTowers.size()) {
    sniperTowers.remove(i);
    i++;
  }

  i = 0;
  while ( i < mobs.size()) {
    mobs.remove(i);
    i++;
  }
}
