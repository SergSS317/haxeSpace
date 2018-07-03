package;

import kha.Assets;
import kha.System;

class Main {

  public static function main() {
	  //Assets.;
	  
    System.init({ title: "Base", width: 800, height: 600 }, init);
  }

  private static function init() {
    var game = new Base();
    System.notifyOnRender(game.render);
  }
}