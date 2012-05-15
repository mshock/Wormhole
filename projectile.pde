// abstract class for projectiles
// to be extended by all projectile weapons
abstract class Projectile extends Object {
  
  Projectile(color c, float xpos, float ypos, float xspeed, float yspeed) {
    super(c,xpos,ypos);
    set_xspeed(xspeed);
    set_yspeed(yspeed);
  }
}
