package;
import kha.Image;
import kha.graphics4.Graphics;
/**
 * ...
 * @author SergSS
 */
class DravningAdapter 
{
	var drwBufs:Drawning;
	public var vertices:Array<Float>;
	public var uvs:Array<Float>;
	public var colors:Array<Float>;
	
	public var EntityId(get, null):Int;
	
	function get_EntityId()
	{
		drwBufs.IdEntity++;
		return drwBufs.IdEntity;
	}
	
	public function new(_imageData:Image) 
	{
		drwBufs = new Drawning(_imageData, 90);
		vertices = drwBufs.vertices;
		uvs = drwBufs.uvs;
		colors = drwBufs.colors;
	}
	
	public function UpdateAllBufs()
	{
		drwBufs.UpdateAllBuff = true;
		drwBufs.UpdateBuffers();
	}
	
	public function UpdateVertexBufs()
	{
		drwBufs.UpdateVertex = true;
		drwBufs.UpdateBuffers();
	}
	
	public function CreateNewVertexBuffer(lenght:Int)
	{
		drwBufs.CreateNewVertexBufer(lenght);
	}
	
	public function render(g:Graphics)
	{
		if(drwBufs!=null) drwBufs.render(g);
	}
}