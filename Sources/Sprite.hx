package;
import kha.Assets;
import kha.Image;
import kha.graphics4.Graphics;
import kha.math.Vector3;
import kha.Color;
import kha.graphics4.TextureUnit;
/**
 * ...
 * @author ...
 */
 //import Entity;
class Sprite extends Entity 
{

	
	//public var position:Vector3 = new Vector3(0, 0, 0);
	public var img:Image;
	public override function new( _image:Image, _position:Vector3, _size:Vector3) 
	{
		this.Position = _position;
		this.img = _image;
		this.color = Color.White;
		//this.Size = _size;
		//Base.AllSprites.push(this);
		//Core.AllSprites.push(this);
		super(_position, this.color, _size);
		//trace("Sprite:"+_image);
		image = _image;
		//textureID = pipeline.getTextureUnit();
		textureID = Base.set3d.pipeline.getTextureUnit("Light9");
		//super.update();
	}
	
	
	/*public override function render(g:Graphics)
	{
		super.render(g);
	}*/
	/*public override function update()
	{
		super.update();
	}*/
	
	

}