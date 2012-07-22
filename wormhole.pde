/*
Wormhole
*/

import processing.opengl.*;

// arena
Arena arena;

// player ship
Ship ship;
// all other objects to render
ArrayList objects = new ArrayList();

void setup() {
  size(800, 800, OPENGL);
  arena = new Arena();
  ship = new Ship(Ship.SHIP_BASIC, width/2, height/2);
}

void draw() {
  background(0);
  
  ship.update();  
  
  arena.render();
  
  ship.display();
  
  draw_renderables();
}

// render all various objects
void draw_renderables() {
  for(int i = objects.size() - 1; i >= 0; i--) {
    Object render_me = (Object) objects.get(i);
    // update returns false to indicate the object needs to be removed
    if (!render_me.update()) {
      objects.remove(i);
    } 
    render_me.display();
  }
}


// handle user input
void keyPressed() {
  // fire weapon
  if (key == ' ') {
    objects.add(ship.shoot());
  }
 else if (key == CODED) {
   switch(keyCode) {
     // directional accel
     case UP:
       ship.set_boostDir(Ship.BOOST_UP, true);
       break;
     case DOWN:
       ship.set_boostDir(Ship.BOOST_DOWN, true);
       break;
     case RIGHT:
       ship.set_boostDir(Ship.BOOST_RIGHT, true);
       break;
     case LEFT:
       ship.set_boostDir(Ship.BOOST_LEFT, true);
       break;
     default:
       return;
   }
 } 
}

void keyReleased() {
  // unfire weapon
  if (key == ' ') {
    ship.unshoot();
  }
  else if (key == CODED) {
    switch(keyCode) {
      // stop directional accel
       case UP:
         ship.set_boostDir(Ship.BOOST_UP, false);
         break;
       case DOWN:
         ship.set_boostDir(Ship.BOOST_DOWN, false);
         break;
       case RIGHT:
         ship.set_boostDir(Ship.BOOST_RIGHT, false);
         break;
       case LEFT:
         ship.set_boostDir(Ship.BOOST_LEFT, false);
         break;
       default:
         return;
    }
  }
}
