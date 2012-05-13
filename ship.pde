class Ship {
   color c;
   float xpos;
   float ypos;
   float xspeed = 0;
   float yspeed = 0;
   float xaccel = 0;
   float yaccel = 0;
   
   boolean[] boostDir = new boolean[4];
   
   float ship_accel;
   
   float max_speed;
   float max_accel;
   
   float accel_decay;
   
   Ship(color c, float ship_accel, float max_speed, float max_accel, float accel_decay, float xpos, float ypos) {
     this.c = c;
     this.ship_accel = ship_accel;
     this.max_speed = max_speed;
     this.max_accel = max_accel;
     this.accel_decay = accel_decay;
     this.xpos = xpos;
     this.ypos = ypos;
     
   }
   
   void display() {
     rectMode(CENTER);
     fill(c);
     rect(xpos,ypos,10,10);
   }
   
   void boost(int direction, boolean active) {
     boostDir[direction] = active;
   }
   
   void fly() {
     
     _update_accel();
     
     _drag();
     
     _update_speed();
     
     _bound();
     
     // move the ship at speed
     xpos += xspeed;
     ypos += yspeed;
     
     
     println("xaccel: " + xaccel);
     println("yaccel: " + yaccel);
     println("xspeed: " + xspeed);
     println("yspeed: " + yspeed);
     println();
   }
   
   
   // handle button press flags by changing accels
   void _update_accel() {
     float xaccel_inc = 0;
     float yaccel_inc = 0;
     
     // check keys pressed
     if(boostDir[2]) {
       xaccel_inc = ship_accel;
     }
     else if (boostDir[3]) {
       xaccel_inc = -ship_accel;  
     }
     if(boostDir[2] && boostDir[3]) {
       xaccel_inc = 0;
     }
     if(boostDir[1]) {
       yaccel_inc = ship_accel;
     }
     else if (boostDir[0]) {
       yaccel_inc = -ship_accel;  
     }
     if(boostDir[0] && boostDir[1]) {
       yaccel_inc = 0;
     }
     
        
     if (abs(xaccel + xaccel_inc) <= max_accel) {
       xaccel += xaccel_inc;
     }
     else {
       if (xaccel == abs(xaccel)) {
         xaccel = max_accel;
       }
       else {
         xaccel = -max_accel;
       }
     }
     if (abs(yaccel + yaccel_inc) <= max_accel) {
       yaccel += yaccel_inc;
     }
     else {
       if (yaccel == abs(yaccel)) {
         yaccel = max_accel;
       }
       else {
         yaccel = -max_accel;
       }
     }
   }
   
   void _update_speed() {
     // set new speeds
     // make sure to bound at max_speed, even if overshot
     if (abs(xspeed) <= max_speed){
       xspeed += xaccel;
     }
     else {
       xspeed = xspeed == abs(xspeed) ? max_speed : -max_speed;
     }
     if (abs(yspeed) <= max_speed) {
       yspeed += yaccel;
     }
     else {
       yspeed = yspeed == abs(yspeed) ? max_speed : -max_speed;
     }
   }
   
   // bounce off of walls (reverse speed and accel direction)
   void _bound() {
     if ((xpos + xspeed >= width) || (xpos + xspeed <= 0)) {
       xspeed = -xspeed;
       xaccel = -xaccel;
       println ("toggled x");  
     }
     if (ypos + yspeed >= height || (ypos + yspeed <= 0)) {
       yspeed = -yspeed;
       yaccel = -yaccel;
       println ("toggled y");
     }
   }
   
   // drag
   void _drag() {
     xaccel *= accel_decay;
     yaccel *= accel_decay;
    // xaccel = xaccel - xspeed * drag_coef < 0 ? 0 : xaccel - xspeed * drag_coef;
    // yaccel = yaccel - yspeed * drag_coef < 0 ? 0 : yaccel - yspeed * drag_coef;
   }
}
