package;
import kha.Assets;
import kha.Image;
import kha.math.Vector3;

/**
 * ...
 * @author ...
 */
class Sprite 
{

	public var position:Vector3 = new Vector3(0, 0, 0);
	public var img:Image;
	public function new(_position:Vector3, _image:Image) 
	{
		this.position = _position;
		this.img = _image;
		
	}
	
}