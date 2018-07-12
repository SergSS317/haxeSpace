package;
import kha.Assets;
import kha.Image;
import kha.graphics4.Graphics;
import kha.math.Vector3;
<<<<<<< HEAD
import kha.Color;
import kha.graphics4.TextureUnit;
=======

>>>>>>> parent of d346ac3... to 3d
/**
 * ...
 * @author ...
 */
class Sprite 
{

<<<<<<< HEAD
	
	//public var position:Vector3 = new Vector3(0, 0, 0);
=======
	public var position:Vector3 = new Vector3(0, 0, 0);
>>>>>>> parent of d346ac3... to 3d
	public var img:Image;
	public function new(_position:Vector3, _image:Image) 
	{
		this.position = _position;
		this.img = _image;
<<<<<<< HEAD
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
=======
		
	}
>>>>>>> parent of d346ac3... to 3d
	
}