package;
import kha.input.Mouse;
/**
 * ...
 * @author ...
 */
class MouseControl 
{
	public static var x:Int = 0;
	public static var y:Int = 0;
	public static var z:Int = 0;

	public static var btnLeft:Bool = false;
	public static var btnRight:Bool = false;
	public static var btnMiddle:Bool = false;
	//public static var btnClick:Bool = false;

	public function new() 
	{
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, onMouseWheel);
	}
	
	
	public function onMouseDown(button:Int, x:Int, y:Int):Void 
	{

		if (button == 0){
			btnLeft = true;
		}
		if (button == 1){
			btnRight = true;
		}
		if (button == 2){
			btnMiddle = true;
		}
	}
	
	public function onMouseUp(button:Int, x:Int, y:Int):Void 
	{
		if (button == 0){
			btnLeft = false;
		}
		if (button == 1){
			btnRight = false;
		}
		if (button == 2){
			btnMiddle = false;
		}
	}
	
	public function onMouseMove(_x:Int, _y:Int, _cx:Int, _cy:Int):Void {
		if (_x > 0){
			x = _x;
		}
		if (_y > 0){
			y = _y;
		}
		//trace('(' + x + ', ' + y + ', ' + z+') -> '+btn+'');
	}
	
	
	public function onMouseWheel(_z:Int):Void { z += _z; }
	
}