package;

/**
 * ...
 * @author SergSS
 */

 import kha.System;
 
class Camera
{
	var MapSize = 50;
	public var x: Float;
	public var y: Float;
	public static var zoom:Float=50;
	public static var maxzoom:Int;
	public var speed = 10.0;
	public static var ZoomChanged:Bool=false;
	public static var aX:Float=0;//absolute
	public static var aY:Float=0;
	
	public function new(x: Int, y: Int) {
		this.x = x;
		this.y = y;
		zoom = 50;
		maxzoom = 500;
	}
	
	
	
public function update(controls: Controls, deltaTime: Float) {
	ZoomChanged = false;
    if (controls.left && !controls.right) {
		x += speed * deltaTime * 25 / zoom;
		//trace(x);
    } else if (controls.right && !controls.left) {
		x -= speed  * deltaTime * 25 / zoom;
		//trace(x);
    }

    if (controls.up && !controls.down) {
      y += speed  * deltaTime*25/zoom;
    } else if (controls.down && !controls.up) {
      y -= speed * deltaTime*25/zoom;
    }
	
    if (controls.zoomup && !controls.zoomdown) {
		//trace('zoom:'+zoom);
		zoom +=  speed * 10 * deltaTime * 0.8;
		ZoomChanged = true;
    } else if (controls.zoomdown && !controls.zoomup) {
		zoom -=  speed * 10 * deltaTime * 0.8;
		ZoomChanged = true;
		//trace('zoom:'+zoom);
    }
	if (x <-MapSize) x =-MapSize;
	if (x > MapSize) x = MapSize;
	if (y <-MapSize) y = -MapSize;
	if (y > MapSize) y = MapSize;
	if (ZoomChanged)
	{
		if (zoom < 2) zoom = 2;//максимальное отдаление
		else if (zoom > maxzoom) zoom = maxzoom;
	}
		aX = x * zoom+800/2;
		aY= y * zoom+600/2;
	
  }
}