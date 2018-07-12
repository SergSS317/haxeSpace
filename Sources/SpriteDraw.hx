package;

/**
 * ...
 * @author ...
 */
class SpriteDraw 
{
	
	public function new() 
	{
		reset();
	}
	
	
	
	public function reset()
	{
		vertices = new Array<Float>();
		uvs = new Array<Float>();
		colors = new Array<Float>();
	}
	public static var vertices:Array<Float>;
	public static var uvs:Array<Float>;
	public static var colors:Array<Float>;
	public function GenVertices(_sprite:Sprite)
	{
		vertices.push( -1.0 +_sprite.Position.x); vertices.push( -1.0 +_sprite.Position.y); vertices.push(0.0);
		vertices.push( -1.0 +_sprite.Position.x); vertices.push(  1.0 +_sprite.Position.y); vertices.push(0.0);
		vertices.push(  1.0 +_sprite.Position.x); vertices.push(  1.0 +_sprite.Position.y); vertices.push(0.0);
		vertices.push( -1.0 +_sprite.Position.x); vertices.push( -1.0 +_sprite.Position.y); vertices.push(0.0);
		vertices.push(  1.0 +_sprite.Position.x); vertices.push( -1.0 +_sprite.Position.y); vertices.push(0.0);
		vertices.push(  1.0 +_sprite.Position.x); vertices.push(  1.0 +_sprite.Position.y); vertices.push(0.0);
		
		uvs.push(0.0); uvs.push(0.0);
		uvs.push(0.0); uvs.push(1.0);
		uvs.push(1.0); uvs.push(1.0);
		uvs.push(0.0); uvs.push(0.0);
		uvs.push(1.0); uvs.push(0.0);
		uvs.push(1.0); uvs.push(1.0);
		
		colors.push(1.0); colors.push(1.0); colors.push(1.0); colors.push(1.0);
		colors.push(1.0); colors.push(1.0); colors.push(1.0); colors.push(1.0);
		colors.push(1.0); colors.push(1.0); colors.push(1.0); colors.push(1.0);
		colors.push(1.0); colors.push(1.0); colors.push(1.0); colors.push(1.0);
		colors.push(1.0); colors.push(1.0); colors.push(1.0); colors.push(1.0);
		colors.push(1.0); colors.push(1.0); colors.push(1.0); colors.push(1.0);
	}
	
}