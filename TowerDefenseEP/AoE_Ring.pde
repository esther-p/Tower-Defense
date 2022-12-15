//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.
//extends from bullet

class AoE_Ring {

  final int PLACING = 0;
  final int PLACED = 1;
  float x, y;
  int cooldown, threshold;
  int AoE_RingMode;
  int timer;

  AoE_Ring( float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    AoE_RingMode = PLACING;
    timer = 3;
  }

  void show() {
    stroke(green);
    strokeWeight(4);
    fill(green);

    //build mode tower placing
    if (AoE_RingMode == PLACED) {
      square(x, y, 50);
      image(aoe, x+2, y+3, 200, 200);
      towerbought = false;
    } else if (AoE_RingMode == PLACING) {
      fill(green, 100);
      towerbought = true;
      noStroke();
      circle(mouseX, mouseY, 150);
      fill(green, 100);
      image(aoe, mouseX+2, mouseY+3, 200, 200);

      if (mousePressed && !(mouseX >=675)) {
        AoE_RingMode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  void act() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
    
      //timer for aoe
      timer = timer - 1;
      println(timer);
      if (timer == 0) {
        bullets.add(new hugeBullet(x, y));
        timer = 3;
      }
    }
  }
}
