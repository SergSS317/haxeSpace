package;

import kha.Assets;
import kha.System;
import kha.math.FastVector2;

class Main {
	public static var screen:FastVector2;
  public static function main() {
	  //Assets.;
	  trace("start");
	  screen = new FastVector2(800, 600);
    System.init({ title: "Base", width: Std.int(screen.x), height: Std.int(screen.y) }, init);
  }

  private static function init() {
    var game = new Base();
    System.notifyOnRender(game.render);
  }
}