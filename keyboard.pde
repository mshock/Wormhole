// class for keeping track of keyboard events and states

class Keyboard {
  // hash to track key events
  // because I don't actually know how many there are or their range
  private HashMap keysPressed;
  
  Keyboard() {
    keysPressed  = new HashMap();
  }
  
  void pressKey(int pressed) {
    keysPressed.put(pressed, true);
  }
  
  void releaseKey(int released) {
    keysPressed.put(released, false);
  }
  
  Boolean isPressed(int button) {
    // avoid NullPointer by first checking existence
    if (! keysPressed.containsKey(button)) {
      return false;
    }
    return (Boolean) keysPressed.get(button);
  }
  
}
