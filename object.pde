// abstract class for all objects 
abstract class Object {
  private color c;
  private PVector pos, speed, accel;
  
  Object() {
  }
  
  // Object constructor, sets common values
  Object(color c, float xpos, float ypos) {
    set_color(c);
    pos = new PVector(xpos, ypos);
    speed = new PVector(0, 0);
    accel = new PVector(0, 0);
    
  }
  
  // display method, called by draw loop on all objects
  // sets up canvas for object to draw itself on
  public void display() {
     rectMode(CENTER);
     fill(c);
     _draw_self();
   }
   
   // override in subclass to customize update routines
   public boolean update() {
     return true;
   }
   
   // override in subclass to customize appearance
   public void _draw_self() {
     rect(pos.x,pos.y,10,10);
   }
   
   // accessor methods
   
   public color get_color() {
     return c;
   }
   
   public color set_color(color c) {
     return this.c = c;
   }
   
   public float get_xpos() {
     return pos.x;
   }
   
   public float set_xpos(float xpos) {
     return pos.x = xpos;
   }
   
   public float get_ypos() {
     return pos.y;
   }
   
   public float set_ypos(float ypos) {
     return pos.y = ypos;
   }
   
   public float get_xspeed() {
     return speed.x;
   }
   
   public float set_xspeed(float xspeed) {
     return speed.x = xspeed;
   }
   
   public float get_yspeed() {
     return speed.y;
   }
   
   public float set_yspeed(float yspeed) {
     return speed.y = yspeed;
   }
   
   public float get_yaccel() {
     return accel.y;
   }
   
   public float set_yaccel(float yaccel) {
     return accel.y = yaccel;
   }
   
   public float get_xaccel() {
     return accel.x;
   }
   
   public float set_xaccel(float xaccel) {
     return accel.x = xaccel;
   }
   
   public PVector get_pos_vect() {
     return pos.get();
   }
   
   public void set_pos_vect(PVector pos) {
     this.pos.set(pos);
   }
   
   public Boolean intersect_circle_square(PVector crc, int rad, PVector sqr, int len) {
      float crc_dist_x = abs(crc.x - sqr.x);
      float crc_dist_y = abs(crc.y - sqr.y);
      //println("circle: x " + crc.x + " y " + crc.y);
      //println("square: x " + sqr.x + " x " + sqr.x);
  
      if (crc_dist_x > (len/2 + rad)) {
        //println(1);
        return false; 
      }
        
      if (crc_dist_y > (len/2 + rad)) { 
        //println(2);
        return false; 
      }
  
      if (crc_dist_x <= (len/2)) { 
        //println(3);
        return true; 
      } 
      if (crc_dist_y <= (len/2)) { 
        //println(4);
        return true; 
      }
  
      float corner_dist_sqr = sq(crc_dist_x - len/2) +
                           sq(crc_dist_y - len/2);
  
      return (corner_dist_sqr <= (sq(rad)));
   }
   
}
