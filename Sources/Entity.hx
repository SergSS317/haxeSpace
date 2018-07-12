package;
import kha.Color;
import kha.math.Vector3;

import kha.Assets;

/**
 * ...
 * @author SergSS
 */
class Entity extends Drawning
{
	public var Position:Vector3;
	public var Size:Vector3;
	public var color:Color;
	//public var vertices:Array<Float>;
	//public var uvs:Array<Float>;
	//public var colors:Array<Float>;
		
	public override function new(_position:Vector3, _color:Color, _size:Vector3) 
	{
		vertices = new Array<Float>();
		uvs = new Array<Float>();
		colors = new Array<Float>();
		Position = _position;
		color = _color;
		this.Size = _size;
		super();
		Recalc();
		//Base.drawning.AddEntity(this);

	}
	
	
	function Recalc()
	{
		
		//trace("En upd");
		vertices = new Array<Float>();
		uvs = new Array<Float>();
		colors = new Array<Float>();
		
		vertices.push( (-1.0*Size.x + Position.x)); vertices.push( (-1.0 * Size.y + Position.y)); vertices.push(0.0);
		vertices.push( (-1.0*Size.x + Position.x)); vertices.push( ( 1.0 * Size.y + Position.y)); vertices.push(0.0);
		vertices.push( ( 1.0*Size.x + Position.x)); vertices.push( ( 1.0 * Size.y + Position.y)); vertices.push(0.0);
		vertices.push( (-1.0*Size.x + Position.x)); vertices.push( (-1.0 * Size.y + Position.y)); vertices.push(0.0);
		vertices.push( ( 1.0*Size.x + Position.x)); vertices.push( (-1.0 * Size.y + Position.y)); vertices.push(0.0);
		vertices.push( ( 1.0*Size.x + Position.x)); vertices.push( ( 1.0 * Size.y + Position.y)); vertices.push(0.0);
		
		uvs.push(0.0); uvs.push(0.0);
		uvs.push(0.0); uvs.push(1.0);
		uvs.push(1.0); uvs.push(1.0);
		uvs.push(0.0); uvs.push(0.0);
		uvs.push(1.0); uvs.push(0.0);
		uvs.push(1.0); uvs.push(1.0);
		
		colors.push(1.0 * color.R); colors.push(1.0 * color.G); colors.push(1.0 * color.B); colors.push(1.0 * color.A);
		colors.push(1.0 * color.R); colors.push(1.0 * color.G); colors.push(1.0 * color.B); colors.push(1.0 * color.A);
		colors.push(1.0 * color.R); colors.push(1.0 * color.G); colors.push(1.0 * color.B); colors.push(1.0 * color.A);
		colors.push(1.0 * color.R); colors.push(1.0 * color.G); colors.push(1.0 * color.B); colors.push(1.0 * color.A);
		colors.push(1.0 * color.R); colors.push(1.0 * color.G); colors.push(1.0 * color.B); colors.push(1.0 * color.A);
		colors.push(1.0 * color.R); colors.push(1.0 * color.G); colors.push(1.0 * color.B); colors.push(1.0 * color.A);
		super.CreateVertexBuffer();
		super.CreateIndexBuffer();
		//textureID = pipeline.getTextureUnit("Light9");
		// Texture
		//image = Assets.images.Light9;
		//super.vertices = vertices;
		//super.
	}
	
}