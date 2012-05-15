// class representing user-controlled ship
class Ship extends Object {
  
   private boolean[] boostDir = new boolean[4];
   private float ship_accel;
   private float max_speed;
   private float max_accel;
   private float accel_decay;
   
   private String shiptype;
   private String weapon;
   

   // Ship constructor by shiptype 
   Ship(String shiptype, float xpos, float ypos) {
     super(255, xpos, ypos);
     if (shiptype.equals("default")) {
       set_ship_accel(.1);
       set_max_speed(10);
       set_max_accel(2);
       set_accel_decay(.85);
       set_weapon("Bullet");
     }
   }   
   
   // explicit Ship constructor
   Ship(color c, float ship_accel, float max_speed, float max_accel, float accel_decay, float xpos, float ypos, String weapon) {
     super(c,xpos,ypos);
     set_ship_accel(ship_accel);
     set_max_speed(max_speed);
     set_max_accel(max_accel);
     set_accel_decay(accel_decay);
     set_weapon(weapon);
   }
   
   // update the object's physics
   // move its position one step
   public boolean update() {
      
     _update_accel();
     
     _drag();
     
     _update_speed();
     
     _bound();
     
     _move();
     
     return true;
     /*
     println ("xspeed: " + get_xspeed());
     println ("yspeed: " + get_yspeed());
     println ("xaccel: " + get_xspeed());
     println ("yaccel: " + get_yaccel());
     println();
     */
   }
   
   // shoot or unshoot current weapon
   // return an object of the weapon if fired
   public Object shoot() {
     if (get_weapon().equals("Bullet")) {
         return new Bullet(125, get_xpos(), get_ypos(), get_xspeed() * 1.5, get_yspeed() * 1.5, true, 200);
     }
     
     
     return new Bullet(155, get_xpos(), get_ypos(), get_xspeed() * 1.5, get_yspeed() * 1.5, true, 200);
   }
   
   public void unshoot() {
     if (get_weapon().equals("Bullet")) {
       
     }
   }
      
   // move the ship at speed
   private void _move() {
     set_xpos(get_xpos() + get_xspeed());
     set_ypos(get_ypos() + get_yspeed());
   }
   
   // handle button press flags by changing accels
   private void _update_accel() {
     float xaccel_inc = 0;
     float yaccel_inc = 0;
     float ship_accel = get_ship_accel();
     float max_accel = get_max_accel();
     float xaccel = get_xaccel();
     float yaccel = get_yaccel();
     
     // check keys pressed
     if(get_boostDir(2)) {
       xaccel_inc = ship_accel;
     }
     else if (get_boostDir(3)) {
       xaccel_inc = -ship_accel;  
     }
     if(get_boostDir(2) && get_boostDir(3)) {
       xaccel_inc = 0;
     }
     if(get_boostDir(1)) {
       yaccel_inc = ship_accel;
     }
     else if (get_boostDir(0)) {
       yaccel_inc = -ship_accel;  
     }
     if(get_boostDir(0) && get_boostDir(1)) {
       yaccel_inc = 0;
     }
     
        
     if (abs(xaccel + xaccel_inc) <= max_accel) {
       set_xaccel(xaccel + xaccel_inc);
     }
     else {
       if (xaccel == abs(xaccel)) {
         set_xaccel(max_accel);
       }
       else {
         set_xaccel(-max_accel);
       }
     }
     if (abs(yaccel + yaccel_inc) <= max_accel) {
       set_yaccel(yaccel + yaccel_inc);
     }
     else {
       if (yaccel == abs(yaccel)) {
         set_yaccel(max_accel);
       }
       else {
         set_yaccel(-max_accel);
       }
     }
   }
   
   private void _update_speed() {
     float xspeed = get_xspeed();
     float yspeed = get_yspeed();
     float max_speed = get_max_speed();
     
     // set new speeds
     // make sure to bound at max_speed, even if overshot
     if (abs(xspeed) <= max_speed){
       set_xspeed(xspeed + get_xaccel());
     }
     else {
       set_xspeed( xspeed == abs(xspeed) ? max_speed : -max_speed);
     }
     if (abs(yspeed) <= max_speed) {
       set_yspeed(yspeed + get_yaccel());
     }
     else {
       set_yspeed( yspeed == abs(yspeed) ? max_speed : -max_speed);
     }
   }
   
   // bounce off of walls (reverse speed and accel direction)
   private void _bound() {
     float xpos = get_xpos();
     float ypos = get_ypos();
     float xspeed  = get_xspeed();
     float yspeed = get_yspeed();
     
     if ((xpos + xspeed >= width) || (xpos + xspeed <= 0)) {
       set_xspeed(-xspeed);
       set_xaccel( -get_xaccel() );
     }
     if ((ypos + yspeed >= height) || (ypos + yspeed <= 0)) {
       set_yspeed(-yspeed) ;
       set_yaccel( -get_yaccel() );
     }
   }
   
   // drag
   private void _drag() {
     set_xaccel( get_xaccel() * get_accel_decay() );
     set_yaccel( get_yaccel() * get_accel_decay() );
     
    // xaccel = xaccel - xspeed * drag_coef < 0 ? 0 : xaccel - xspeed * drag_coef;
    // yaccel = yaccel - yspeed * drag_coef < 0 ? 0 : yaccel - yspeed * drag_coef;
   }
   
   // accessor methods
   
   public String get_weapon() {
     return weapon;
   }
   
   public String set_weapon(String weapon) {
     return this.weapon = weapon;
   }
   
   public float get_max_speed() {
     return max_speed;
   }   
   
   public float set_max_speed(float max_speed) {
     return this.max_speed = max_speed;
   }
   
   public float get_max_accel() {
     return max_accel;
   }
   
   public float set_max_accel(float max_accel) {
     return this.max_accel = max_accel;
   }
   
   public float get_accel_decay() {
     return accel_decay;
   }
   
   public float set_accel_decay(float accel_decay) {
     return this.accel_decay = accel_decay;
   }
   
   public float get_ship_accel() {
     return ship_accel;
   }
   
   public float set_ship_accel(float ship_accel) {
     return this.ship_accel = ship_accel;
   }
   
   public boolean get_boostDir (int dir) {
     return boostDir[dir];
   }
   
   public boolean set_boostDir (int dir, boolean active) {
     return boostDir[dir] = active;
   }
   
}
