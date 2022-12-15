//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {
  float x, y, vx, vy, d;
  int hp;

  Bullet(float _x, float _y, float _vx, float _vy, float _d) {
    x = _x;
    y = _y;
    vy = _vy;
    vx = _vx;
    d = _d;
    hp = 1 ;
  }

  void show() {
    stroke(0);
    fill(0);
    strokeWeight(2);
    circle(x, y, d);
  }

  void act() {
    x = x + vx;
    y = y +vy;
    if (x < 0 || x > width || y< 0 || y > height) {
      hp = 0;
    }
  }
}

class hugeBullet extends Bullet {
  int timer, hp;

  hugeBullet(float x, float y) {
    super(x, y, 0, 0, 150);
    timer = 30;
    hp = 1;
  }
  void show() {
    noStroke();
    fill(green, 100);
    strokeWeight(2);
    circle(x, y, d);
  }

  void act() {
    timer = timer - 1;
    if (timer <= 0) {
      int i  = 0;
      Bullet myBullet = bullets.get(i);
      myBullet.hp = 0;
      timer = 30;
    }
  }
}
