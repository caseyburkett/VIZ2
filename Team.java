import processing.core.*;

class Team {
  public PApplet p;
  public int red;
  public int green;
  public int blue;
  public float x;
  public float y;
  public float rad;
  public String team;
  public String runs;
  public String hr;
  public String rbi;
  public String tmcolor;

  Team (){
  }
  
  Team(PApplet p, int red, int green, int blue, float x, float y, float rad, String team,
  String runs, String hr, String rbi, String tmcolor){
   this.p=p; 
   this.red = red;
   this.green = green;
   this.blue = blue;
   this.x = x;
   this.y = y;
   this.rad = rad;
   this.team = team;
   this.runs = runs;
   this.hr = hr;
   this.rbi = rbi;
   this.tmcolor = tmcolor;
  }
  
  void display(){
    p.noStroke();
    p.lights();
    p.pushMatrix();
    p.translate(x,y);
    p.fill(red,green,blue);
    p.sphere(rad);
    p.popMatrix();
  }


//can use something like this example for mouse detection
boolean isHit() {
    if (p.abs(p.mouseX-x) < rad && p.abs(p.mouseY-y) < rad) {
      return true;
    } 
    return false;
  }
  
}