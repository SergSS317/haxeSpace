package;
import kha.Color;
import kha.math.Vector3;

/**
 * ...
 * @author SergSS
 */
class Entity 
{
	var Position:Vector3;
	var Size:Float;
	///<summary>If is false - update function not work. </summary>
	public var isStaic:Bool = false;
	
	var color:Color;
	var uvs:Array<Float>;
	var id:Int;
	var drawbufs:Drawning;
	
	var tmp:Int = 0;
	var old_size:Float;
	
	public function new(_position:Vector3, _color:Color, _size:Float, _drawbufs:Drawning, _uvs:Array<Float>,_staic:Bool=true) 
	{
		this.drawbufs = _drawbufs;
		//this.id =++drawbufs.EntityId;
		this.id =drawbufs.GetFreeId();
		this.Position = _position;
		this.color = _color;
		this.Size = _size;
		this.isStaic = _staic;
		AddUV(_uvs);
		AddVert();
		AddColor();
	}
	

	
	///<summary>Set and recalc position in drawbufs </summary>
	public function SetPosition(_position:Vector3):Void { Position = _position; UpdateVert(); }
	
	///<summary>Set and recalc size in drawbufs </summary>
	public function SetSize(_size:Float):Void { Size = _size; UpdateVert(); }

	///<summary>update... </summary>
	public function update():Void
	{
		if (!isStaic)
		{
		//	if(old_size!=Size && Size>0.01)
			UpdateVert();
			//UpdateColor();
			//updates = true;
		}
		old_size = Size;
	}
	
	function AddVert():Void
	{
		for (i in 0...18) drawbufs.vertices.push(0.0);
		UpdateVert();
	}
	
	function AddColor():Void
	{
		for(i in 0...24) drawbufs.colors.push(0.0);
		UpdateColor();
	}
	
	function AddUV(_uvs:Array<Float>):Void
	{
		for(i in 0...12) drawbufs.uvs.push(0.0);
		
		if (_uvs != null)
		{
			uvs = _uvs;
		}else{
			uvs = [0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1];
		}
		UpdateUVS();
	}
	
	///<summary>Remove all vertices, colors and uvs from drawbufs (set null)</summary>
	public function removeAllBufs():Void
	{
	//	trace(drawbufs.id+" en1:"+drawbufs.vertices.length);
		drawbufs.uvs.splice(id*12, 12);
		drawbufs.colors.splice(id*24, 24);
		drawbufs.vertices.splice(id * 18, 18);
	/*	drawbufs.UdateUV = true;
		drawbufs.UdateVertex = true;
		drawbufs.UdateColor = true;*/
		drawbufs.FreeId(id);
	//	trace(drawbufs.id+" en2:"+drawbufs.vertices.length);
		//trace("it`s work("+id+")");
		/*for (i in 0...12) drawbufs.uvs[id * 12 + i] = null;
		for (i in 0...24) drawbufs.colors[id * 24 + i] = null;
		for (i in 0...18) drawbufs.vertices[id * 18 + i] = null;
		UpdateVert();
		UpdateColor();
		UpdateUVS();*/
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
		
		drawbufs.UdateUV = true;
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
		
		drawbufs.UdateVertex = true;
	}
	
	///<summary>Update colors in drawbufs</summary>
	public function UpdateColor():Void
	{
		tmp = id * 24;
		drawbufs.colors[tmp + 0] = color.R;
		drawbufs.colors[tmp + 1] = color.G;
		drawbufs.colors[tmp + 2] = color.B;
		drawbufs.colors[tmp + 3] = color.A;
		
		drawbufs.colors[tmp + 4] = color.R;
		drawbufs.colors[tmp + 5] = color.G;
		drawbufs.colors[tmp + 6] = color.B;
		drawbufs.colors[tmp + 7] = color.A;
		
		drawbufs.colors[tmp + 8] = color.R;
		drawbufs.colors[tmp + 9] = color.G;
		drawbufs.colors[tmp + 10] = color.B;
		drawbufs.colors[tmp + 11] = color.A;
		
		drawbufs.colors[tmp + 12] = color.R;
		drawbufs.colors[tmp + 13] = color.G;
		drawbufs.colors[tmp + 14] = color.B;
		drawbufs.colors[tmp + 15] = color.A;
		
		drawbufs.colors[tmp + 16] = color.R;
		drawbufs.colors[tmp + 17] = color.G;
		drawbufs.colors[tmp + 18] = color.B;
		drawbufs.colors[tmp + 19] = color.A;
		
		drawbufs.colors[tmp + 20] = color.R;
		drawbufs.colors[tmp + 21] = color.G;
		drawbufs.colors[tmp + 22] = color.B;
		drawbufs.colors[tmp + 23] = color.A;
		
		drawbufs.UdateColor = true;
	}
}