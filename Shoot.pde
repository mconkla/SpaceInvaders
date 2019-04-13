class Shoot{
  PImage gun;
  public float x;
  public float y;
  public Shoot(float x,float y){
    this.x = x - 25;
    this.y = y -100;
    gun = loadImage("gun.png");
    
  }
  void show(){
    image(gun,x,y,50,50);
    //rect(x,y,10,20);
  }
  void move(){
    this.y += -10;
  }
  
}
