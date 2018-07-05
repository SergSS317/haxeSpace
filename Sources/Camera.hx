package;

/**
 * ...
 * @author SergSS
 */

 import kha.System;
 
class Camera
{
	var MapSize = 700;
	public var x: Float;
	public var y: Float;
	public static var zoom:Float = 1.0;
	public static var minzoom:Float=0.001;
	public static var maxzoom:Float=1.0;
	public var speed = 100.0;
	public static var ZoomChanged:Bool=false;
	public static var aX:Float=0;//absolute
	public static var aY:Float=0;
	
	public static var ScaleFlare:Float = 0.0;
	
	public function new(x: Int, y: Int) {
		this.x = x;
		this.y = y;
		maxzoom = 20.0;
		minzoom = 0.0000000007;
		zoom = minzoom;
		ZoomChanged = true;
	}
	
	
	
public function update(controls: Controls, deltaTime: Float) {
	ZoomChanged = false;
    if (controls.left && !controls.right) {
		x += speed * deltaTime;
		//trace(aX);
		//trace(x);
    } else if (controls.right && !controls.left) {
		x -= speed  * deltaTime;
		//trace(aX);
		//trace(x);
    }

    if (controls.up && !controls.down) {
      y += speed  * deltaTime;
    } else if (controls.down && !controls.up) {
      y -= speed * deltaTime;
    }
	
    if (controls.zoomup && !controls.zoomdown) {
		//trace('zoom:'+zoom);
		zoom +=  speed * minzoom * deltaTime * 0.1;
		ZoomChanged = true;
    } else if (controls.zoomdown && !controls.zoomup) {
		zoom -=  speed * minzoom * deltaTime * 0.1;
		ZoomChanged = true;
		//trace('zoom:'+zoom);
    }
	if (x <-MapSize) x =-MapSize;
	if (x > MapSize) x = MapSize;
	if (y <-MapSize) y = -MapSize;
	if (y > MapSize) y = MapSize;
	if (ZoomChanged)
	{
		if (zoom < minzoom) zoom = minzoom;//максимальное отдаление
		else if (zoom > maxzoom) zoom = maxzoom;
		//ScaleFlare = 1 / Math.exp(zoom) * 25;
	}

		aX = (MapSize*0.01)*x* zoom+800/2;
		aY= (MapSize*0.01)*y* zoom+600/2;
  }
}