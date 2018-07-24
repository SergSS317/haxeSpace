package;
import kha.Color;
import kha.math.Vector3;

/**
 * ...
 * @author SergSS
 */
class Entity 
{
	public var Position:Vector3;
	public var Size:Float;
	///<summary>If is false - update function not work. </summary>
	public var isStatic:Bool = false;
	
	var color:Color;
	var uvs:Array<Float>;
	public var id:Int;
	var drawbufs:DravningAdapter;
	
	var tmp:Int = 0;
	var old_size:Float;
	
	public function new(_position:Vector3, _color:Color, _size:Float, _drawbufs:DravningAdapter, _uvs:Array<Float>,_static:Bool=true) 
	{
		this.drawbufs = _drawbufs;

		this.id = drawbufs.EntityId;
		this.Position = _position;
		this.color = _color;
		this.Size = _size;
		this.isStatic = _static;
		AddUV(_uvs);
		UpdateUVS();
		UpdateVert();
		UpdateColor();
	}
	
	///<summary>Set and recalc position in drawbufs </summary>
	//public function SetPosition(_position:Vector3):Void { Position = _position; UpdateVert(); }
	
	///<summary>Set and recalc size in drawbufs </summary>
	//public function SetSize(_size:Float):Void { Size = _size; UpdateVert(); }

	///<summary>update... </summary>
	public function update():Void
	{
		if (!isStatic)
		{
			UpdateVert();
			//UpdateColor();
		}
		old_size = Size;
	}
	
	function AddUV(_uvs:Array<Float>):Void
	{
		if (_uvs != null)
		{
			uvs = _uvs;
		}else{
			uvs = [0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1];
		}
	}
	
	///<summary>Update uvs in drawbufs</summary>
	public function UpdateUVS():Void
	{
		tmp = id * 12;
		drawbufs.uvs[tmp + 0] = uvs[0];
		drawbufs.uvs[tmp + 1] = uvs[1];
		
		drawbufs.uvs[tmp + 2] = uvs[2];
		drawbufs.uvs[tmp + 3] = uvs[3];
		
		drawbufs.uvs[tmp + 4] = uvs[4];
		drawbufs.uvs[tmp + 5] = uvs[5];
		
		drawbufs.uvs[tmp + 6] = uvs[6];
		drawbufs.uvs[tmp + 7] = uvs[7];
		
		drawbufs.uvs[tmp + 8] = uvs[8];
		drawbufs.uvs[tmp + 9] = uvs[9];
		
		drawbufs.uvs[tmp + 10] = uvs[10];
		drawbufs.uvs[tmp + 11] = uvs[11];
	}
	
	///<summary>Update vertices in drawbufs</summary>
	public function UpdateVert():Void
	{
		tmp = id * 18;

		drawbufs.vertices[tmp + 0] =-Size + Position.x;
		drawbufs.vertices[tmp + 1] =-Size + Position.y;
		drawbufs.vertices[tmp + 2] = 0;
		
		drawbufs.vertices[tmp + 3] =-Size + Position.x;
		drawbufs.vertices[tmp + 4] = Size + Position.y;
		drawbufs.vertices[tmp + 5] = 0;
		
		drawbufs.vertices[tmp + 6] = Size + Position.x;
		drawbufs.vertices[tmp + 7] = Size + Position.y;
		drawbufs.vertices[tmp + 8] = 0;
		
		drawbufs.vertices[tmp + 9] =-Size + Position.x;
		drawbufs.vertices[tmp + 10] =-Size + Position.y;
		drawbufs.vertices[tmp + 11] = 0;
		
		drawbufs.vertices[tmp + 12] = Size + Position.x;
		drawbufs.vertices[tmp + 13] =-Size + Position.y;
		drawbufs.vertices[tmp + 14] = 0;
		
		drawbufs.vertices[tmp + 15] = Size + Position.x;
		drawbufs.vertices[tmp + 16] = Size + Position.y;
		drawbufs.vertices[tmp + 17] = 0;
	}
	
	///<summary>Update colors in drawbufs</summary>
	public function UpdateColor():Void
	{
		tmp = id * 24;
		for (i in 0...6)
		{
			drawbufs.colors[tmp + i * 4 + 0] = color.R;
			drawbufs.colors[tmp + i * 4 + 1] = color.G;
			drawbufs.colors[tmp + i * 4 + 2] = color.B;
			drawbufs.colors[tmp + i * 4 + 3] = color.A;
		}
	}
	
	public function AddColor():Void
	{
		for (i in 0...6)
		{
			drawbufs.colors.push(color.R);
			drawbufs.colors.push(color.G);
			drawbufs.colors.push(color.B);
			drawbufs.colors.push(color.A);
		}		
	}
	
	public function AddVert():Void
	{
		tmp = id * 18;
		drawbufs.vertices.push(-Size + Position.x);
		drawbufs.vertices.push(-Size + Position.y);
		drawbufs.vertices.push( 0);
		
		drawbufs.vertices.push(-Size + Position.x);
		drawbufs.vertices.push( Size + Position.y);
		drawbufs.vertices.push( 0);
		
		drawbufs.vertices.push( Size + Position.x);
		drawbufs.vertices.push( Size + Position.y);
		drawbufs.vertices.push( 0);
		
		drawbufs.vertices.push(-Size + Position.x);
		drawbufs.vertices.push(-Size + Position.y);
		drawbufs.vertices.push( 0);
		
		drawbufs.vertices.push( Size + Position.x);
		drawbufs.vertices.push(-Size + Position.y);
		drawbufs.vertices.push( 0);
		
		drawbufs.vertices.push( Size + Position.x);
		drawbufs.vertices.push( Size + Position.y);
		drawbufs.vertices.push( 0);
	}
	
	public function AddUVS(_uvs:Array<Float>):Void
	{
		for (i in 0...12)
		{
			drawbufs.uvs.push( _uvs[i]); 
		}
	}
}