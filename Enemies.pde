class Enemies{
  
  PImage enemy;
  float random = width * (1/(random(10)+1));
  float x = random;
  float y = -100;
  public float breite = 100;
  public float hoehe = 100;
  public Enemies(){
    enemy = loadImage("Enemy.png");
    
  }
  
  void show(){
    image(enemy,this.x,this.y,breite,hoehe);
    //rect(this.x,this.y,breite,hoehe);
    
  }
  
  void move(float Speed){
    this.y += Speed;
  }
  
  
  
}
