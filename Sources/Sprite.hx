package;
import kha.Assets;
import kha.math.Vector2;
//import kha.Image;
import kha.math.Vector3;
import kha.Color;
/**
 * ...
 * @author ...
 */
 //import Entity;
class Sprite extends Entity 
{
	public override function new( _position:Vector3, _size:Vector3, _uvs:Array<Float>=null) 
	{
		this.Position = _position;
		this.color = Color.White;
		Base.AllSprites.push(this);
		super(_position, this.color, _size, _uvs);
		super.update();
	}
}