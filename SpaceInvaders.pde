  Spieler meinSpieler = new Spieler();
PImage xplode;
PImage background,background2;

public boolean dead,button = false;
float fill = 0;
float fillB = 0;
float change = 1;
int score = 0;
    float rectX = width/2;
    float rectY = height/2;
    float rectW = 120;
    float rectH = 50;
float moveY = -1600;
float moveY2 = -3000;
void setup(){
  
  size(800,800);
  //colorMode(55);
  xplode = loadImage("xplode.png");
  background = loadImage("background.png");
  //background2 = loadImage("background.png");
  
}

void draw(){
  frameRate(60);
  background(fill,0,0);
  //image(background,0,moveY,800,2400);
  //image(background2,0,moveY,800,2400);
  if(moveY == 800){
    moveY = -2200;
  }
  //if(moveY2 == 800){
   // moveY2 = -3000;
  //}
  moveY += 1;
  //moveY2 += 1;
  
  if(!dead){
    fill(255);
    textSize(20);
    text(score,width/2,20);
    fill(0);
  updateEnemies();
  updatePlayer();
  meinSpieler.show(mouseX,mouseY);
  
  if(frameCount % 10 == 0){
    meinSpieler.makeShoot();
  }
  if(frameCount % 37/change == 0){
    meinSpieler.makeEnemy();
    
  }
  if(frameCount % 1000 == 0){
    change += 1;
    meinSpieler.Speed += 2;
  }
  
  
  meinSpieler.enemyMove();
  meinSpieler.shootMove();
  }
  else{
    
    fill = 255;
    //button
    textSize(25);
    fill(255);
    rect(rectX,rectY,rectW,rectH);
    fill(fillB);
    text("RESTART",rectX +8,rectY + 35);
    updateButton(mouseX,mouseY);
    
  }
  
  
}

void updateEnemies(){
 
  for(int j = meinSpieler.EnemyObjects.size()-1 ; j >= 0;j--){
    for(int i = meinSpieler.ShootObjects.size()-1; i >= 0; i--){
      if(meinSpieler.ShootObjects.size() != i && meinSpieler.EnemyObjects.size() != j && meinSpieler.ShootObjects.get(i).y <= meinSpieler.EnemyObjects.get(j).y + meinSpieler.EnemyObjects.get(j).hoehe && 
      meinSpieler.ShootObjects.get(i).x > meinSpieler.EnemyObjects.get(j).x &&
      meinSpieler.ShootObjects.get(i).x < meinSpieler.EnemyObjects.get(j).x + meinSpieler.EnemyObjects.get(j).breite){
      float safex =meinSpieler.EnemyObjects.get(j).x;
      float safey =meinSpieler.EnemyObjects.get(j).y;
 
      meinSpieler.ShootObjects.remove(i);
      meinSpieler.EnemyObjects.remove(j);
      image(xplode,safex,safey,100,100);
      score += 1;
        }
    }
  }
}
void updatePlayer(){
  for(int j = meinSpieler.EnemyObjects.size()-1 ; j >= 0;j--){
    if(meinSpieler.EnemyObjects.size() != j && meinSpieler.y <= meinSpieler.EnemyObjects.get(j).y + meinSpieler.EnemyObjects.get(j).hoehe && 
    meinSpieler.y + meinSpieler.hoehe >= meinSpieler.EnemyObjects.get(j).y && (
    meinSpieler.x >= meinSpieler.EnemyObjects.get(j).x &&
    meinSpieler.x <= meinSpieler.EnemyObjects.get(j).x + meinSpieler.EnemyObjects.get(j).breite || 
    meinSpieler.x + meinSpieler.breite <= meinSpieler.EnemyObjects.get(j).x + meinSpieler.EnemyObjects.get(j).breite &&
    meinSpieler.x + meinSpieler.breite >= meinSpieler.EnemyObjects.get(j).x
    )
    ){
        dead = true;
        
      }
  }
}
void updateButton(float x, float y){
  if(dead == true && x >= rectX && x <= rectX + rectW && y >= rectY && y <= rectY + rectH){
    fillB = 100;
    button = true;
  }
  else {
    button = false;
    fillB = 0;
  }
}
void mousePressed(){
  if(button){
    for(int i =meinSpieler.EnemyObjects.size()-1; i >= 0 ; i--){
      meinSpieler.EnemyObjects.remove(i);
    }
    score = 0;
    fill = 0;
    button = false;
    dead = false;
  }
}
