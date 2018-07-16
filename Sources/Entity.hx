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
	public var Size:Vector3;
	public var color:Color;
	public var vertices:Array<Float>;
	public var uvs:Array<Float>;
	public var colors:Array<Float>;
	var id:Int;
	public var isStaic:Bool=false;
	var updates:Bool=false;
	public function new(_position:Vector3, _color:Color, _size:Vector3, _uvs:Array<Float>) 
	{
		//vertices = new Array<Float>();
		id=++Set3d.EntityId;
		/*if (_uvs != null)
		{
			uvs = _uvs;
		}else{
			uvs = [0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1];
		}*/
		colors = new Array<Float>();
		Position = _position;
		color = _color;
		this.Size = _size;
		AddUV(_uvs);
		//UpdateColor();
		//UpdateVert();
		AddVert();
		AddColor();
	//	Drawning.UdateIndex = true;
	}

	
	var col:Array<Float>;
	var vert:Array<Float>;
	public function update()
	{
		if (!isStaic)
		{
			UpdateVert();
			UpdateColor();
			updates = true;
		}
		
	}
	
	public function AddVert()
	{
		for(i in 0...18)
		Drawning.vertices.push(0.0);
	}
	
	public function AddColor()
	{
		for(i in 0...24)
		Drawning.colors.push(0.0);
	}
	
	public function AddUV(_uvs:Array<Float>)
	{
		for(i in 0...12)
		Drawning.uvs.push(0.0);
		
		if (_uvs != null)
		{
			uvs = _uvs;
		}else{
			uvs = [0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1];
		}
		UpdateUVS();
	}
	
	public function UpdateUVS()
	{
		
		Drawning.uvs[id * 12 + 0] = uvs[0];
		Drawning.uvs[id * 12 + 1] = uvs[1];
		
		Drawning.uvs[id * 12 + 2] = uvs[2];
		Drawning.uvs[id * 12 + 3] = uvs[3];
		
		Drawning.uvs[id * 12 + 4] = uvs[4];
		Drawning.uvs[id * 12 + 5] = uvs[5];
		
		Drawning.uvs[id * 12 + 6] = uvs[6];
		Drawning.uvs[id * 12 + 7] = uvs[7];
		
		Drawning.uvs[id * 12 + 8] = uvs[8];
		Drawning.uvs[id * 12 + 9] = uvs[9];
		
		Drawning.uvs[id * 12 + 10] = uvs[10];
		Drawning.uvs[id * 12 + 11] = uvs[11];
		
	}
	
	//var old_size:Vector3;
	//var old_pos:Vector3;
	
	public function UpdateVert()
	{
		//if (old_pos != Position || old_size != Size)
		//{
		//trace("i`m hire");
		//trace("Size="+Size);
		//trace("22222");
		Drawning.vertices[id * 18 + 0] =-Size.x + Position.x;
		Drawning.vertices[id * 18 + 1] =-Size.y + Position.y;
		Drawning.vertices[id * 18 + 2] = 0;
		
		Drawning.vertices[id * 18 + 3] =-Size.x + Position.x;
		Drawning.vertices[id * 18 + 4] = Size.y + Position.y;
		Drawning.vertices[id * 18 + 5] = 0;
		
		Drawning.vertices[id * 18 + 6] = Size.x + Position.x;
		Drawning.vertices[id * 18 + 7] = Size.y + Position.y;
		Drawning.vertices[id * 18 + 8] = 0;
		
		Drawning.vertices[id * 18 + 9] =-Size.x + Position.x;
		Drawning.vertices[id * 18 + 10] =-Size.y + Position.y;
		Drawning.vertices[id * 18 + 11] = 0;
		
		Drawning.vertices[id * 18 + 12] = Size.x + Position.x;
		Drawning.vertices[id * 18 + 13] =-Size.y + Position.y;
		Drawning.vertices[id * 18 + 14] = 0;
		
		Drawning.vertices[id * 18 + 15] = Size.x + Position.x;
		Drawning.vertices[id * 18 + 16] = Size.y + Position.y;
		Drawning.vertices[id * 18 + 17] = 0;
		//Base.drawning.CreateVertexBuffer();
		//Drawning.UdateVertex = true;
		//}
		//old_pos = Position;
		//old_size = Size;	
		//trace(id+" -> vertices:"+vertices);
	}
	
	
	/*public function UpdateVert()
	{
		if (old_pos != Position || old_size != Size)
		{
		//trace("i`m hire");
		Drawning.vertices[id * 18 + 0] =-1.0 * Size.x + Position.x;
		Drawning.vertices[id * 18 + 1] =-1.0 * Size.y + Position.y;
		Drawning.vertices[id * 18 + 2] = 0;
		
		Drawning.vertices[id * 18 + 3] =-1.0 * Size.x + Position.x;
		Drawning.vertices[id * 18 + 4] = 1.0 * Size.y + Position.y;
		Drawning.vertices[id * 18 + 5] = 0;
		
		Drawning.vertices[id * 18 + 6] = 1.0 * Size.x + Position.x;
		Drawning.vertices[id * 18 + 7] = 1.0 * Size.y + Position.y;
		Drawning.vertices[id * 18 + 8] = 0;
		
		Drawning.vertices[id * 18 + 9] =-1.0 * Size.x + Position.x;
		Drawning.vertices[id * 18 + 10] =-1.0 * Size.y + Position.y;
		Drawning.vertices[id * 18 + 11] = 0;
		
		Drawning.vertices[id * 18 + 12] = 1.0 * Size.x + Position.x;
		Drawning.vertices[id * 18 + 13] =-1.0 * Size.y + Position.y;
		Drawning.vertices[id * 18 + 14] = 0;
		
		Drawning.vertices[id * 18 + 15] = 1.0 * Size.x + Position.x;
		Drawning.vertices[id * 18 + 16] = 1.0 * Size.y + Position.y;
		Drawning.vertices[id * 18 + 17] = 0;
		//Base.drawning.CreateVertexBuffer();
		Drawning.UdateVertex = true;
		}
		old_pos = Position;
		old_size = Size;	
		//trace(id+" -> vertices:"+vertices);
	}*/

	public function UpdateColor()
	{
		Drawning.colors[id * 24 + 0] = color.R;
		Drawning.colors[id * 24 + 1] = color.G;
		Drawning.colors[id * 24 + 2] = color.B;
		Drawning.colors[id * 24 + 3] = color.A;
		
		Drawning.colors[id * 24 + 4] = color.R;
		Drawning.colors[id * 24 + 5] = color.G;
		Drawning.colors[id * 24 + 6] = color.B;
		Drawning.colors[id * 24 + 7] = color.A;
		
		Drawning.colors[id * 24 + 8] = color.R;
		Drawning.colors[id * 24 + 9] = color.G;
		Drawning.colors[id * 24 + 10] = color.B;
		Drawning.colors[id * 24 + 11] = color.A;
		
		Drawning.colors[id * 24 + 12] = color.R;
		Drawning.colors[id * 24 + 13] = color.G;
		Drawning.colors[id * 24 + 14] = color.B;
		Drawning.colors[id * 24 + 15] = color.A;
		
		Drawning.colors[id * 24 + 16] = color.R;
		Drawning.colors[id * 24 + 17] = color.G;
		Drawning.colors[id * 24 + 18] = color.B;
		Drawning.colors[id * 24 + 19] = color.A;
		
		Drawning.colors[id * 24 + 20] = color.R;
		Drawning.colors[id * 24 + 21] = color.G;
		Drawning.colors[id * 24 + 22] = color.B;
		Drawning.colors[id * 24 + 23] = color.A;
	}
	
	
	
		/*
		col = [	1.0 * color.R,	1.0 * color.G,	1.0 * color.B,	1.0 * color.A,
				1.0 * color.R,	1.0 * color.G,	1.0 * color.B,	1.0 * color.A,
				1.0 * color.R,	1.0 * color.G,	1.0 * color.B,	1.0 * color.A,
				1.0 * color.R,	1.0 * color.G,	1.0 * color.B,	1.0 * color.A,
				1.0 * color.R,	1.0 * color.G,	1.0 * color.B,	1.0 * color.A,
				1.0 * color.R,	1.0 * color.G,	1.0 * color.B,	1.0 * color.A,];
		colors = col;	*/	
	
				/*
		vert = [ -1.0 * Size.x + Position.x,	-1.0 * Size.y + Position.y,		0,
				-1.0 * Size.x + Position.x,	 1.0 * Size.y + Position.y,		0,
				 1.0 * Size.x + Position.x,	 1.0 * Size.y + Position.y,		0,
				-1.0 * Size.x + Position.x,	-1.0 * Size.y + Position.y,		0,
				 1.0 * Size.x + Position.x,	-1.0 * Size.y + Position.y,		0,
				 1.0 * Size.x + Position.x,	 1.0 * Size.y + Position.y,		0];	  
		vertices = vert;*/

	
	
}