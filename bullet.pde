// basic bullet weapon class, is a projectile, bounces
class Bullet extends Projectile {
  
  // flag for whether damages player
  private boolean friendly;
  // number of frames (renders) the bullet will live before being removed
  private int lifespan;
  
  Bullet(color c, float xpos, float ypos, float xspeed, float yspeed, boolean friendly, int lifespan) {
    super(c, xpos, ypos, xspeed, yspeed); 
    set_friendly(friendly);
    set_lifespan(lifespan);
  }
  
  // returns false when lifespan runs out
  public boolean update() {
    // decrement the lifespan
    if (!_update_lifespan()) {
      return false;
    }
    
    _bound();
    _move();
    
    return true;
  }
  
   public void _draw_self() {
     ellipse(get_xpos(),get_ypos(),7,7);
   }
  
  // move the bullet
  public void _move() {
     set_xpos(get_xpos() + get_xspeed());
     set_ypos(get_ypos() + get_yspeed());
   }
  
  private boolean _update_lifespan() {
    set_lifespan(get_lifespan() - 1);
    if (get_lifespan() == 0) {
      return false;
    }
    return true;
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
  
  // accessor methods
  
  public boolean get_friendly() {
    return friendly;
  }
  
  public boolean set_friendly(boolean friendly) {
    return this.friendly = friendly;
  }
  
  public int get_lifespan() {
    return lifespan;
  }
  
  public int set_lifespan(int lifespan) {
    return this.lifespan = lifespan;
  }
}
