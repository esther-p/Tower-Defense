class mobSpeedy extends Mob {

  mobSpeedy(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 35;
    maxhp = 3;
    hp = 3;
    fillColor = #BDE574;

    //adjust speed for maps
    value = 2;
    if (drawmap == 1) {
      speed = 1.5;
    }

    if (drawmap == 2) {
      speed = 1.5;
    }
  }
}
