package;

/**
 * ...
 * @author SergSS
 */
class Rect 
{

	public var x:Float = 0;
	public var y:Float = 0;
	public var w:Float = 0;
	public var h:Float = 0;
	public function new(_x:Float,_y:Float,_w:Float,_h:Float) 
	{
		this.x = _x;
		this.y = _y;
		this.w = _w;
		this.h = _h;
		
	}
	
	public function Recalc(_x:Float, _y:Float, _w:Float, _h:Float)
	{
		this.x = _x;
		this.y = _y;
		this.w = _w;
		this.h = _h;
		
	}
	
}