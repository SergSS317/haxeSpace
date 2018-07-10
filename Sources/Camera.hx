package;

/**
 * ...
 * @author SergSS
 */

 import kha.System;
 import kha.math.FastMatrix3;
class Camera
{
	var MapSize = 700;
	public var x: Float;
	public var y: Float;
	public static var zoom:Float = 1.0;
	public static var minzoom:Float=0.001;
	public static var maxzoom:Float=1.0;
	public var speed = 100.0;
	
	//public static var ZoomChanged:Bool=false; 
	public static var aX:Float=0;//absolute
	public static var aY:Float=0;
	public static var zoomspeed:Float = 0.000001;
	public static var ScaleFlare:Float = 0.0;
	
	public static var Transform:FastMatrix3;
	public function new(x: Int, y: Int) {
		this.x = x;
		this.y = y;
		maxzoom = 100.0;
		minzoom = 0.0000000007;
		zoomspeed = minzoom;
		zoom = minzoom;
		//ZoomChanged = true;
		TransformUpdate();
	}
	
	public function TransformUpdate()
	{
		Transform = new FastMatrix3(	Camera.zoom, 	0, 				Camera.aX,
												0,				Camera.zoom,	Camera.aY,
												0,				0,				1);
	}
	
	
	
public function update(controls: Controls, deltaTime: Float) {
	//ZoomChanged = false;
    if (controls.left && !controls.right) {
		x += speed * deltaTime/zoom;
		//TransformUpdate();
		//trace(aX);
		//trace(x);
    } else if (controls.right && !controls.left) {
		x -= speed  * deltaTime/zoom;
		//TransformUpdate();
		//trace(aX);
		//trace(x);
    }

    if (controls.up && !controls.down) {
      y += speed  * deltaTime/zoom;
	  //TransformUpdate();
    } else if (controls.down && !controls.up) {
      y -= speed * deltaTime/zoom;
	  //TransformUpdate();
    }
	
    if (controls.zoomup && !controls.zoomdown) {
		//trace('zoom:'+zoom);
		if (zoom < maxzoom){
		zoomspeed = 2*zoom;
		zoom +=  deltaTime * zoomspeed;
		//TransformUpdate();
	//	ZoomChanged = true;
		}
    } else if (controls.zoomdown && !controls.zoomup) {
		if (zoom > minzoom){
		zoomspeed = 2*zoom;
		zoom -=  deltaTime * zoomspeed;
		//TransformUpdate();
	//	ZoomChanged = true;
		}
		//trace('zoom:'+zoom);
    }
	var deltamap = MapSize * zoom*1000000000000000;
	if (x <-deltamap) x =-deltamap;
	if (x > deltamap) x = deltamap;
	if (y <-deltamap) y = -deltamap;
	if (y > deltamap) y = deltamap;
	/*if (ZoomChanged)
	{
		if (zoom < minzoom) zoom = minzoom;//максимальное отдаление
		else if (zoom > maxzoom) zoom = maxzoom;
		//ScaleFlare = 1 / Math.exp(zoom) * 25;
	}*/
/*
		aX = (MapSize*0.01)*x* zoom+800/2;
		aY= (MapSize*0.01)*y* zoom+600/2;*/
		aX = x * zoom+800/2;
		aY = y * zoom + 600 / 2;
		TransformUpdate();
  }
}