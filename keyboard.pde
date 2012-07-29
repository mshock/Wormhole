// class for keeping track of keyboard events and states

class Keyboard {
  private HashMap keysPressed;
  
  Keyboard() {
    keysPressed = new HashMap();
  }
  
  void pressKey(int pressed) {
    keysPressed.put(pressed, true);
  }
  
  void releaseKey(int released) {
    keysPressed.put(released, false);
  }
  
  Boolean isPressed(int button) {
    if (! keysPressed.containsKey(button)) {
      return false;
    }
    return (Boolean) keysPressed.get(button);
  }
  
}
