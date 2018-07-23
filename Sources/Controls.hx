package;

import kha.input.KeyCode;
import kha.input.Keyboard;

class Controls {
  public var left: Bool;
  public var right: Bool;
  public var up: Bool;
  public var down: Bool;
  public var shoot: Bool;
  public var zoomup: Bool;
  public var zoomdown: Bool;
  

  public function new() {
	  Keyboard.get().notify(keyDown, keyUp);
	  
  }

  public function keyDown(key: Int) { 
    switch (key) {
    case KeyCode.Left:
		left = true;
    case KeyCode.Right:
		right = true;
    case KeyCode.Up:
		up = true;
    case KeyCode.Down:
		down = true;
	case KeyCode.PageUp:
		zoomup = true;
	case KeyCode.PageDown:
		zoomdown = true;
	case KeyCode.Add:
		zoomup = true;
	case KeyCode.Subtract:
		zoomdown = true;
    default:
      // no-op
    }
  }
  
  public function reset() {
    left = false;
    right = false;
    up = false;
    down = false;
    shoot = false;
  }

  public function keyUp(key: Int) { 
    switch (key) {
    case KeyCode.Left:
      left = false;
    case KeyCode.Right:
      right = false;
    case KeyCode.Up:
      up = false;
    case KeyCode.Down:
      down = false;
	case KeyCode.PageUp:
		zoomup = false;
	case KeyCode.PageDown:
		zoomdown = false;
	case KeyCode.Add:
		zoomup = false;
	case KeyCode.Subtract:
		zoomdown = false;
    default:
      //no-op
    }
	//trace(Camera.zoom);
  }
}