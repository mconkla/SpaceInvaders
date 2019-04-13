class Spieler{
  PImage player;
  public float x;
  public float y;
  public float Speed = 10;
  public float breite = 100;
  public float hoehe = 100;
  ArrayList<Shoot> ShootObjects = new ArrayList<Shoot>();
  ArrayList<Enemies> EnemyObjects = new ArrayList<Enemies>();
  void Spieler(){
    
    
  }
  
  void show(float x,float y){
    this.x = x-breite/2;
    this.y = y-hoehe/2;
    fill(255);
    player = loadImage("Ship.png");
    image(player,this.x,this.y,breite,hoehe);
    //rect(this.x,this.y,breite,hoehe);
  }
  
  void makeShoot(){
    ShootObjects.add(new Shoot(this.x + breite/2,this.y + hoehe/2));
    
  }
  void makeEnemy(){
    EnemyObjects.add(new Enemies());
  }
  void shootMove(){
    for (int i = ShootObjects.size()-1; i >= 0; i--){
      ShootObjects.get(i).show();
      ShootObjects.get(i).move();
      if(ShootObjects.get(i).y < 0){
        ShootObjects.remove(i);
      }
    }
  }
  void enemyMove(){
    for (int i = EnemyObjects.size()-1; i >= 0; i--){
      EnemyObjects.get(i).show();
      EnemyObjects.get(i).move(Speed);
      if(EnemyObjects.get(i).y > height){
        EnemyObjects.remove(i);
      }
  }
  }
  

}
