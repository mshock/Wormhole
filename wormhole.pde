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
 keyboard.pressKey(keyCode);

 switch(keyCode) {
   // fire weapon
   case KeyEvent.VK_SPACE:
     objects.add(ship.shoot());
     break;
   // rotate or boost
   case UP:
     ship.boost(true);
     break;
   case DOWN:
     // there is no down boost
     // add extra shield charge or something
     //ship.set_boostDir(Ship.BOOST_DOWN, true);
     break;
   case RIGHT:
     // can't turn both right and left at the same time
     if (keyboard.isPressed(LEFT)) {
       ship.set_rotate_dir(Ship.ROT_NONE, true);
       break;
     }
     ship.set_rotate_dir(Ship.ROT_CLOCKW, true);
     break;
   case LEFT:
     if (keyboard.isPressed(RIGHT)) {
       ship.set_rotate_dir(Ship.ROT_NONE, true);
       break;
     }
     ship.set_rotate_dir(Ship.ROT_CCLOCKW, true);
     break;
   default:
     return;
 }
}

void keyReleased() {
  keyboard.releaseKey(keyCode);
  
  switch(keyCode) {
    case KeyEvent.VK_SPACE:
      ship.unshoot();
      break;
    // stop rotate or boost
     case UP:
       ship.boost(false);
       break;
     case DOWN:
       //ship.set_boostDir(Ship.BOOST_DOWN, false);
       break;
     case RIGHT:
       // if both were pressed, resume rotating in the other direction
       if (keyboard.isPressed(LEFT)) {
         ship.set_rotate_dir(Ship.ROT_CCLOCKW, true);
         break;
       }
       ship.set_rotate_dir(Ship.ROT_CLOCKW, false);
       break;
     case LEFT:
       if (keyboard.isPressed(RIGHT)) {
         ship.set_rotate_dir(Ship.ROT_CLOCKW, true);
         break;
       }
       ship.set_rotate_dir(Ship.ROT_CCLOCKW, false);
       break;
     default:
       return;
  }

}
