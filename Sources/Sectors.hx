package;
import kha.math.Vector2;

/**
 * ...
 * @author SergSS
 */
class Sectors 
{
	public var Position:Vector2;
	public var Stars:Array<Star>;
	public function new(position:Vector2) 
	{
		Stars = new Array<Star>();
		this.Position = position;
	}
	
}