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
	public static var ZoomKoef:Float;
	public static var Matrix:FastMatrix4;
	
	public var x: Float;
	public var y: Float;
	public var zoom:Float;
	public var minzoom:Float;
	public var maxzoom:Float;
	public var speed = 1.0;
	
	static var startZoom:Float;
	
	var oldZm:Float;
	var oldXm:Float;
	var oldYm:Float;
	var Xm:Float;
	var Ym:Float;
	
	public static var Transform:FastMatrix3;
	public function new(_x: Int, _y: Int) {
		x = _x;
		y = _y;
		maxzoom = 500000.0;
		minzoom = 5;
		zoom = 10000;
		startZoom = 1000;
		TransformUpdate();
	}
	public static var projection:FastMatrix4;
	public static var view:FastMatrix4;
	public function TransformUpdate()
	{
		// Projection matrix: 45° Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
		projection = FastMatrix4.perspectiveProjection(45.0, 4.0 / 3.0, minzoom-0.01, maxzoom*1.1);
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
	}

	public function update(controls: Controls, deltaTime: Float) 
	{
		if (controls.left && !controls.right) {
			x -= speed * deltaTime*zoom;// /zoom
		} else if (controls.right && !controls.left) {
			x += speed  * deltaTime*zoom;
		}
		
		if (controls.up && !controls.down) {
			y += speed  * deltaTime*zoom;
		} else if (controls.down && !controls.up) {
			y -= speed * deltaTime*zoom;
		}
		
		if (MouseControl.btnLeft)
		{
			Xm = MouseControl.x;
			Ym = MouseControl.y;
			if (oldXm == 0 && oldYm == 0 ) { oldXm = Xm; oldYm = Ym; }
			x += speed/30  * deltaTime * zoom * (oldXm - Xm);
			y -= speed/30  * deltaTime * zoom * (oldYm - Ym);
			oldXm = Xm;	oldYm = Ym;
		}
		if (!MouseControl.btnLeft) { oldXm = 0; oldYm = 0; }
		
		startZoom += deltaTime *(MouseControl.z-oldZm)* startZoom;
		if (controls.zoomup && !controls.zoomdown) 
		{
				startZoom -=  deltaTime * startZoom;
		} else if (controls.zoomdown && !controls.zoomup) {
				startZoom +=  deltaTime * startZoom;

		}
		
		oldZm = MouseControl.z;
		if (startZoom < 1) startZoom = 1;
		zoom = Math.pow(startZoom,2);
		
		if (zoom < minzoom) { zoom = minzoom; startZoom = Math.sqrt(minzoom); }
		if (zoom > maxzoom) { zoom = maxzoom; startZoom = Math.sqrt(maxzoom); }
		
		ZoomKoef = zoom / maxzoom;
		TransformUpdate();
	}

}