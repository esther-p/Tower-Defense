//Tower Defense Game
//Esther Pang
//Programming 12

// ================ GLOBAL VARIABLES =================
final int INTRO    = 0;
final int MAPSELECT     = 1;
final int PLAY     = 2;
final int BUILD    = 3;
final int GAMEOVER = 4;

boolean towerbought = false;
// if tower is placing tower obtan is true
int mode;

//wave number counter
int number = 0;

int texttimer = 0;
int money;
int lives;
int drawmap;

//Pallette
color white = #ffffff;
color black = #000000;
color neongreen = #8ec100;
color darkgreen = #669856;
color lightneongreen = #e0ff85;
color green = #82B454;
color palegreen = #C4E3A7;
color mapgreen = #C4F789;
color pathyellow = #FFFC98;
color creme = #FEFFDE;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//wise frog dialogue control
boolean wisefrogtalk = true;

//Buttons
Button start;
Button nextWave;
Button buildmode;
Button playMode;
Button buyGunTower;
Button buyAoETower;
Button buysniperTower;
Button map1select;
Button map2select;
Button menu;

//picture
picture sniperpicture;

//Collections of objects
//nodes
Node []nodes;
Node[] map2nodes;
Node[] map1nodes;
//others
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<sniperTower> sniperTowers;
ArrayList<AoE_Ring> AoE_Rings;
ArrayList<hugeBullet> hugeBullets;

//Images and Gifs
Gif introAnimation;
PImage frog;
PImage map;
PImage frogtower;
PImage sniper;
PImage aoe;
PImage map1;
PImage map2;
PImage wisefrog;
PImage textbubble;
PImage castle;
PImage face;

//Fonts
PFont pixelfont;
PFont bubblefont;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(850, 600);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();

  //initalize lives & money
  lives = 5;
  money = 200;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {

  //Load Images & Gifs
  imageMode(CORNER);
  introAnimation = new Gif("introgif/frame_", "_delay-0.08s.gif", 63, 3, 0, 0, 945, 600);
  frog = loadImage("frognew.png");
  map = loadImage("map.png");
  frogtower = loadImage("frogtower.png");
  sniper = loadImage("sniper.png");
  imageMode(CENTER);
  aoe = loadImage("aoe1.png");
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.png");
  wisefrog = loadImage("wisefrog.png");
  textbubble = loadImage("speechbubble.png");
  castle = loadImage("castle.png");

  //Load Fonts
  pixelfont = createFont("pixel.otf", 100);
  bubblefont = createFont("Pathagonia.ttf", 100);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  sniperTowers = new ArrayList<sniperTower>();
  AoE_Rings = new ArrayList<AoE_Ring>();
  hugeBullets = new ArrayList<hugeBullet>();
}


void makeButtons() {
  //INTRO - Start
  start = new Button("start", width/2, 3*height/4, 200, 100, 10, #BDD395, white);
  sniperpicture = new picture("sniper.png", 505, 420, 200, 200);

  //MAPSELECT
  map1select = new Button("", width/4+20, 300, 320, 280, 10, #CBEA9F, #DCF2B5);
  map2select = new Button("", width/4+width/2-20, 300, 320, 280, 10, #CBEA9F, #DCF2B5);

  //PLAY - Next Wave, To Build Mode
  textFont(bubblefont);
  nextWave = new Button("wave", 762, 110, 125, 80, 10, palegreen, white);
  buildmode = new Button ("build", 762, 230, 125, 80, 10, palegreen, white);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  playMode = new Button ("play", 762, 90, 130, 80, 10, palegreen, white);
  buyGunTower = new Button ("gun\n$125", 795, 220, 80, 80, 10, palegreen, white);
  buyAoETower = new Button ("aoe\n$50", 795, 330, 80, 80, 10, palegreen, white);
  buysniperTower = new Button ("sniper\n$150", 795, 440, 80, 80, 10, palegreen, white);

  //GAMEOVER - Reset
  menu = new Button ("menu", 580, 460, 190, 80, 10, green, white);
}

void makeNodes() {
  //Plot the nodes on the map
  map2nodes = new Node [12];
  map2nodes[0] = new Node(100, 300, 0, -1);
  map2nodes[1] = new Node(100, 170, 1, 0);
  map2nodes[2] = new Node(220, 170, 0, 1);
  map2nodes[3] = new Node(220, 400, -1, 0);
  map2nodes[4] = new Node(100, 400, 0, 1);
  map2nodes[5] = new Node(100, 500, 1, 0);
  map2nodes[6] = new Node(340, 500, 0, -1);
  map2nodes[7] = new Node(340, 120, 1, 0);
  map2nodes[8] = new Node(550, 120, 0, 1);
  map2nodes[9] = new Node(550, 420, -1, 0);
  map2nodes[10] = new Node(420, 420, 0, -1);
  map2nodes[11] = new Node(420, 270, 1, 0);

  map1nodes = new Node [10];
  map1nodes[0] = new Node(100, 350, 0, -1);
  map1nodes[1] = new Node(100, 200, 1, 0);
  map1nodes[2] = new Node(300, 200, 0, 1);
  map1nodes[3] = new Node(300, 300, -1, 0);
  map1nodes[4] = new Node(200, 300, 0, -1);
  map1nodes[5] = new Node(200, 100, 1, 0);
  map1nodes[6] = new Node(400, 100, 0, 1);
  map1nodes[7] = new Node(400, 450, 1, 0);
  map1nodes[8] = new Node(550, 450, 0, -1);
  map1nodes[9] = new Node(550, 250, 1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAPSELECT) {
    mapselect();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
