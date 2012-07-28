/*
Wormhole
*/

import processing.opengl.*;

// keyboard tracking
Keyboard keyboard;

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
  keyboard = new Keyboard();
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
  keyboard.pressKey(key);
  
  // fire weapon
  if (key == ' ') {
    objects.add(ship.shoot());
  }
 else if (key == CODED) {
   switch(keyCode) {
     // rotate or boost
     case UP:
       ship.boost(true);
       break;
     case DOWN:
       // there is no down boost
       //ship.set_boostDir(Ship.BOOST_DOWN, true);
       break;
     case RIGHT:
       ship.set_rotate_dir(Ship.ROT_CLOCKW, true);
       break;
     case LEFT:
       ship.set_rotate_dir(Ship.ROT_CCLOCKW, true);
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
      // stop rotate or boost
       case UP:
         ship.boost(false);
         break;
       case DOWN:
         //ship.set_boostDir(Ship.BOOST_DOWN, false);
         break;
       case RIGHT:
         ship.set_rotate_dir(Ship.ROT_CLOCKW, false);
         break;
       case LEFT:
         ship.set_rotate_dir(Ship.ROT_CCLOCKW, false);
         break;
       default:
         return;
    }
  }
}
