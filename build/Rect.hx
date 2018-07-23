package;

/**
 * ...
 * @author ...
 */
class Rect 
{
	public var x:Float;
	public var y:Float;
	public var w:Float;
	public var h:Float;
	
	public function new(_x:Float, _y:Float, _w:Float, _h:Float) 
	{
		this.x = _x;
		this.y = _y;
		this.w = _w;
		this.h = _h;
	}

	public function Recalc (_x:Float, _y:Float, _w:Float, _h:Float) 
	{
		this.x = _x;
		this.y = _y;
		this.w = _w;
		this.h = _h;
	}
}