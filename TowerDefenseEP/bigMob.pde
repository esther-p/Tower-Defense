class bigMob extends Mob {

  bigMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 80;
    maxhp = 20 + number;
    hp = maxhp;
    value = 4;
    speed = 0.5;
    fillColor = darkgreen;
  }
}
