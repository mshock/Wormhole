Ship ship;

void setup() {
  size(800, 800);
  frameRate(35);
  ship = new Ship(255,.1,10,2,.85,width/2,height/2);
}

void draw() {
  background(0);
  ship.update();
  ship.display();
}

void keyPressed() {
 if (key == CODED) {
   switch(keyCode) {
     case UP:
       ship.set_boostDir(0, true);
       break;
     case DOWN:
       ship.set_boostDir(1, true);
       break;
     case RIGHT:
       ship.set_boostDir(2, true);
       break;
     case LEFT:
       ship.set_boostDir(3, true);
       break;
     default:
       return;
   }
 } 
}

void keyReleased() {
  switch(keyCode) {
     case UP:
       ship.set_boostDir(0, false);
       break;
     case DOWN:
       ship.set_boostDir(1, false);
       break;
     case RIGHT:
       ship.set_boostDir(2, false);
       break;
     case LEFT:
       ship.set_boostDir(3, false);
       break;
     default:
       return;
   }
}
