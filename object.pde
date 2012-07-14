// abstract class for all objects 
abstract class Object {
  private color c;
  private float xpos;
  private float ypos;
  private float xspeed = 0;
  private float yspeed = 0;
  private float xaccel = 0;
  private float yaccel = 0;  
  
  Object() {
  }
  
  // Object constructor, sets common values
  Object(color c, float xpos, float ypos) {
    set_color(c);
    set_xpos(xpos);
    set_ypos(ypos);
  }
  
    // display method, called by draw loop on all objects
  // sets up canvas for object to draw itself on
  public void display(PGraphics pg) {
     pg.rectMode(CENTER);
     pg.fill(c);
     _draw_self(pg);
   }
   
   // override in subclass to customize update routines
   public boolean update() {
     return true;
   }
   
   // override in subclass to customize appearance
   public void _draw_self(PGraphics pg) {
     pg.rect(get_xpos(),get_ypos(),10,10);
   }
   
   // accessor methods
   
   public color get_color() {
     return c;
   }
   
   public color set_color(color c) {
     return this.c = c;
   }
   
   public float get_xpos() {
     return xpos;
   }
   
   public float set_xpos(float xpos) {
     return this.xpos = xpos;
   }
   
   public float get_ypos() {
     return ypos;
   }
   
   public float set_ypos(float ypos) {
     return this.ypos = ypos;
   }
   
   public float get_xspeed() {
     return xspeed;
   }
   
   public float set_xspeed(float xspeed) {
     return this.xspeed = xspeed;
   }
   
   public float get_yspeed() {
     return yspeed;
   }
   
   public float set_yspeed(float yspeed) {
     return this.yspeed = yspeed;
   }
   
   public float get_yaccel() {
     return yaccel;
   }
   
   public float set_yaccel(float yaccel) {
     return this.yaccel = yaccel;
   }
   
   public float get_xaccel() {
     return xaccel;
   }
   
   public float set_xaccel(float xaccel) {
     return this.xaccel = xaccel;
   }
   
}
