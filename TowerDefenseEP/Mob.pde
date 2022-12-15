//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy, d;
  int hp, hp2;
  int maxhp;
  float speed;
  color fillColor, strokeColor;
  int value;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vy = _vy;
    vx = _vx;
    d = 35;
    hp = 3;
    maxhp = 3;
    speed = 1;
    value = 1;
    fillColor = green;
    strokeColor = green;
  }

  void show() {
    fill(fillColor);
    strokeWeight(1);
    circle(x, y, d);
  }

  void act() {
    x = x + vx*speed;
    y = y + vy*speed;

    //wise frog dialogue
    if (x >= 600) {
      wisefrogtalk = false;
    }

    //nodes
    int i = 0;
    while ( i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 1) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }

    //detecting collisions
    i = 0;
    Bullet myBullet;
    while (i < bullets.size()) {
      myBullet = bullets. get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        myBullet.hp = myBullet.hp -1;
        if (myBullet.hp <= 0) {
          bullets.remove(i);
        }
        hp = hp -1;
        if (hp == 0) {
          money = money+ 10*value;
        }
      }
      i++;
    }
  }

  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(darkgreen);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(lightneongreen);
    rect(x-25, y-(d+10), 50, 20);
    fill(neongreen);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
