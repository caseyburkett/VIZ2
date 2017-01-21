import processing.core.*;

class Banner{
  public PApplet p;
  String s = "Filler";
  //alpha = 0 is stansparent alpha = 150 is a good reading opacity
  int alpha = 0;
  float x;
  float y;
  
  Banner(PApplet p, float x, float y){
    this.p = p;
    this.x = x;
    this.y = y;
  }
  
  
  void display(){
    p.fill(100, alpha);
    p.textSize(30);
    p.text(s,x,y);
  } 
  
  void setBanner(String x){
    s=x;
  }
 
  void hideBanner(){
    alpha = 0;
  }
  
  void showBanner(){
    alpha = 150; 
  }
  
}