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
	
	public static var onMouseButtonDown:Array<Int->Void>;
	public static var onMouseButtonUp:Array<Int->Void>;
	public static var onMouseWheel:Void->Void;

	public function new() 
	{
		onMouseButtonDown = new Array<Int->Void>();
		onMouseButtonUp = new Array<Int->Void>();
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, _onMouseWheel);
	}
	
	
	public function onMouseDown(button:Int, x:Int, y:Int):Void 
	{

		if (button == 0){
			btnLeft = true;
			if (onMouseButtonDown != null) 
			{
				for(i in 0...onMouseButtonDown.length) onMouseButtonDown[i](0);
			}
		}
		if (button == 1){
			btnRight = true;
			if (onMouseButtonDown != null)
			{
				for(i in 0...onMouseButtonDown.length) onMouseButtonDown[i](1);
			}
		}
		if (button == 2){
			btnMiddle = true;
			if (onMouseButtonDown != null)
			{
				for(i in 0...onMouseButtonDown.length) onMouseButtonDown[i](2);
			}
		}
	}
	
	public function onMouseUp(button:Int, x:Int, y:Int):Void 
	{
		if (button == 0){
			btnLeft = false;
			if (onMouseButtonUp != null)
			{
				for(i in 0...onMouseButtonUp.length) onMouseButtonUp[i](0);
			}
		}
		if (button == 1){
			btnRight = false;
			if (onMouseButtonUp != null)
			{
				for(i in 0...onMouseButtonUp.length) onMouseButtonUp[i](1);
			}
		}
		if (button == 2){
			btnMiddle = false;
			if (onMouseButtonUp != null)
			{
				for(i in 0...onMouseButtonUp.length) onMouseButtonUp[i](2);
			}
		}
	}
	
	public function onMouseMove(_x:Int, _y:Int, _cx:Int, _cy:Int):Void {
		if (_x > 0)
		{
			x = _x;
		}
		if (_y > 0){
			y = _y;
		}
	}
	
	
	function _onMouseWheel(_z:Int):Void 
	{
		z += _z; 
		if (onMouseWheel != null) onMouseWheel();
	}
	
}