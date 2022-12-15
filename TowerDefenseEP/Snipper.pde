class sniperTower {

  final int PLACING = 0;
  final int PLACED = 1;
  float x, y;
  int cooldown, threshold;
  int sniperMode;

  sniperTower( float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    sniperMode = PLACING;
  }

  void show() {
    stroke(green);
    strokeWeight(4);
    fill(green);

    //build mode placing
    if (sniperMode == PLACED) {
      imageMode(CENTER);
      towerbought = false;
      //square(x, y, 40);
      image(sniper, x, y, 150, 150 );
    } else if (sniperMode == PLACING) {
      towerbought = true;
      image(sniper, mouseX, mouseY, 170, 170);
      if (mousePressed && !(mouseX >=675)) {
        sniperMode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  void act() {
    cooldown++;
    //targeting mobs
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(mobs.get(0).x, mobs.get(0).y, 0, 0, 5));//UP
    }
    stroke(green);
    strokeWeight(cooldown/25);
    line(x, y, mobs.get(0).x, mobs.get(0).y);
  }
}
