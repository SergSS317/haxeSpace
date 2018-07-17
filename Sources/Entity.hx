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
	public var color:Color;
	public var vertices:Array<Float>;
	public var uvs:Array<Float>;
	public var colors:Array<Float>;
	var id:Int;
	public var isStaic:Bool=false;
	//var updates:Bool = false;
	var drawbufs:Drawning;
	public function new(_position:Vector3, _color:Color, _size:Float, _drawbufs:Drawning, _uvs:Array<Float>) 
	{
		drawbufs = _drawbufs;
		id =++drawbufs.EntityId;

		colors = new Array<Float>();
		Position = _position;
		color = _color;
		this.Size = _size;
		AddUV(_uvs);
		AddVert();
		AddColor();
		
	}

	
	var col:Array<Float>;
	var vert:Array<Float>;
	var old_size:Float;
	public function update()
	{
		if (!isStaic)
		{
			if(old_size!=Size && Size>0.01)
			UpdateVert();
			//UpdateColor();
			//updates = true;
		}
		old_size = Size;
	}
	
	public function AddVert()
	{
		for (i in 0...18) drawbufs.vertices.push(0.0);
		UpdateVert();
	}
	
	public function AddColor()
	{
		for(i in 0...24) drawbufs.colors.push(0.0);
		UpdateColor();
	}
	
	public function AddUV(_uvs:Array<Float>)
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
	
	public function remove()
	{
		//tmp = id * 12;
		for (i in 0...12) drawbufs.uvs[id * 12 + i] = null;
		for (i in 0...24) drawbufs.colors[id * 24 + i] = null;
		for (i in 0...18) drawbufs.vertices[id * 18 + i] = null;
	}
	
	public function UpdateUVS()
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
	var tmp:Int = 0;
	public function UpdateVert()
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

	public function UpdateColor()
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