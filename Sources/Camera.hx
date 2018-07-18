package;

/**
 * ...
 * @author SergSS
 */

 import kha.System;
 import kha.math.Vector3;
 import kha.math.FastMatrix3;
 
 import kha.math.FastMatrix4;
 import kha.math.FastVector3;
class Camera
{
	var MapSize = 330000000000;
	public static var Position:Vector3;
	public static var ZoomKoef:Float;
	public static var Matrix:FastMatrix4;
	
	
	public static var x: Float;
	public static var y: Float;
	public static var zoom:Float = 1.0;
	public static var minzoom:Float=0.001;
	public static var maxzoom:Float=1.0;
	public var speed = 1.0;
	
	//public static var ZoomChanged:Bool=false; 
	public static var aX:Float=0;//absolute
	public static var aY:Float=0;
	public static var zoomspeed:Float = 1;
	//public static var zoomspeed:Float = 0.000001;
	public static var ScaleFlare:Float = 0.0;
	
	
	public static var Transform:FastMatrix3;
	public function new(_x: Int, _y: Int) {
		x = _x;
		y = _y;
		maxzoom = 10000000.0;
		minzoom = 0.1;
		//zoomspeed = minzoom;
		//zoom = minzoom;
		zoomspeed = 1;
		zoom = 10000;
		//ZoomChanged = true;
		TransformUpdate();
	}
	public static var projection:FastMatrix4;
	public static var view:FastMatrix4;
	public function TransformUpdate()
	{

		//Transform = new FastMatrix3(	Camera.zoom, 	0, 				Camera.aX,
		//										0,				Camera.zoom,	Camera.aY,
		//										0,				0,				1);

		// Projection matrix: 45° Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
		projection = FastMatrix4.perspectiveProjection(45.0, 4.0 / 3.0, minzoom-0.01, maxzoom-1);
		// Or, for an ortho camera
		//var projection = FastMatrix4.orthogonalProjection(-10.0, 10.0, -10.0, 10.0, 0.0, 100.0); // In world coordinates
		
		// Camera matrix
		view = FastMatrix4.lookAt(new FastVector3(x, y, zoom), // Camera is at (4, 3, 3), in World Space
								  new FastVector3(x, y, 0), // and looks at the origin
								  new FastVector3(0, 1, 0) // Head is up (set to (0, -1, 0) to look upside-down)
		);
		
		Matrix = FastMatrix4.identity();
		Matrix = Matrix.multmat(projection);
		Matrix = Matrix.multmat(view);
		Matrix = Matrix.multmat(FastMatrix4.identity());
		trace("cam:"+x);
		
		
		//trace("x="+x+"   y="+y+"   zoom="+zoom);
		//trace('2222222222');
	}

		
	
	//var deltamap = MapSize * zoom;//*1000000000000000;
public function update(controls: Controls, deltaTime: Float) {
	//ZoomChanged = false;
    if (controls.left && !controls.right) {
		
		x -= speed * deltaTime*zoom;// /zoom
		//TransformUpdate();
		//trace(aX);
		//trace(x);
    } else if (controls.right && !controls.left) {
		x += speed  * deltaTime*zoom;
		//TransformUpdate();
		//trace(aX);
		//trace(x);
    }

    if (controls.up && !controls.down) {
      y += speed  * deltaTime*zoom;
	  //TransformUpdate();
    } else if (controls.down && !controls.up) {
      y -= speed * deltaTime*zoom;
	  //TransformUpdate();
    }
	
    if (controls.zoomup && !controls.zoomdown) {
		//trace('zoom:'+zoom);
		if (zoom > minzoom){
		zoomspeed = 2*zoom;
		zoom -=  deltaTime * zoomspeed;
		//TransformUpdate();
	//	ZoomChanged = true;
		}
    } else if (controls.zoomdown && !controls.zoomup) {
		if (zoom < maxzoom){
		zoomspeed = 2*zoom;
		zoom +=  deltaTime * zoomspeed;
		//TransformUpdate();
	//	ZoomChanged = true;
		}
		//trace('zoom:'+zoom);
    }
	if (zoom < minzoom) zoom = minzoom;
	ZoomKoef = zoom / maxzoom;

		TransformUpdate();
  }
}