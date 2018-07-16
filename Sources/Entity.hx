package;
import kha.Color;
import kha.math.Vector3;
import kha.graphics4.VertexBuffer;
import kha.graphics4.Usage;
import kha.graphics4.IndexBuffer;
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
	public var vertexBuffer:VertexBuffer;
	public var indexBuffer:IndexBuffer;
	var id:Int;
	public function new(_position:Vector3, _color:Color, _size:Vector3, _uvs:Array<Float>) 
	{
		//id =++Set3d.EntityId;
		id = 0;
		colors = new Array<Float>();
		uvs = new Array<Float>();
		vertices = new Array<Float>();
		Position = _position;
		color = _color;
		this.Size = _size;
		AddUV(_uvs);
		AddVert();
		AddColor();
		
	}

	
	var col:Array<Float>;
	var vert:Array<Float>;
	public function update()
	{
		UpdateVert();
		UpdateColor();
		CreateVertexBuffer();
		CreateIndexBuffer();
	}
	
	public function AddVert()
	{
		for(i in 0...18)
		vertices.push(0.0);
	}
	
	public function AddColor()
	{
		for(i in 0...24)
		colors.push(0.0);
	}
	
	public function AddUV(_uvs:Array<Float>)
	{
		for(i in 0...12)
		uvs.push(0.0);
		
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
		
		uvs[id * 12 + 0] = uvs[0];
		uvs[id * 12 + 1] = uvs[1];
		
		uvs[id * 12 + 2] = uvs[2];
		uvs[id * 12 + 3] = uvs[3];
		
		uvs[id * 12 + 4] = uvs[4];
		uvs[id * 12 + 5] = uvs[5];
		
		uvs[id * 12 + 6] = uvs[6];
		uvs[id * 12 + 7] = uvs[7];
		
		uvs[id * 12 + 8] = uvs[8];
		uvs[id * 12 + 9] = uvs[9];
		
		uvs[id * 12 + 10] = uvs[10];
		uvs[id * 12 + 11] = uvs[11];
		
	}
	
	public function UpdateVert()
	{
		vertices[id * 18 + 0] =-1.0 * Size.x + Position.x;
		vertices[id * 18 + 1] =-1.0 * Size.y + Position.y;
		vertices[id * 18 + 2] = 0;
		
		vertices[id * 18 + 3] =-1.0 * Size.x + Position.x;
		vertices[id * 18 + 4] = 1.0 * Size.y + Position.y;
		vertices[id * 18 + 5] = 0;
		
		vertices[id * 18 + 6] = 1.0 * Size.x + Position.x;
		vertices[id * 18 + 7] = 1.0 * Size.y + Position.y;
		vertices[id * 18 + 8] = 0;
		
		vertices[id * 18 + 9] =-1.0 * Size.x + Position.x;
		vertices[id * 18 + 10] =-1.0 * Size.y + Position.y;
		vertices[id * 18 + 11] = 0;
		
		vertices[id * 18 + 12] = 1.0 * Size.x + Position.x;
		vertices[id * 18 + 13] =-1.0 * Size.y + Position.y;
		vertices[id * 18 + 14] = 0;
		
		vertices[id * 18 + 15] = 1.0 * Size.x + Position.x;
		vertices[id * 18 + 16] = 1.0 * Size.y + Position.y;
		vertices[id * 18 + 17] = 0;
		//CreateVertexBuffer();
		//trace(id+" -> vertices:"+vertices);
	}

	public function UpdateColor()
	{
		colors[id * 24 + 0] = 1.0 * color.R;
		colors[id * 24 + 1] = 1.0 * color.G;
		colors[id * 24 + 2] = 1.0 * color.B;
		colors[id * 24 + 3] = 1.0 * color.A;
		
		colors[id * 24 + 4] = 1.0 * color.R;
		colors[id * 24 + 5] = 1.0 * color.G;
		colors[id * 24 + 6] = 1.0 * color.B;
		colors[id * 24 + 7] = 1.0 * color.A;
		
		colors[id * 24 + 8] = 1.0 * color.R;
		colors[id * 24 + 9] = 1.0 * color.G;
		colors[id * 24 + 10] = 1.0 * color.B;
		colors[id * 24 + 11] = 1.0 * color.A;
		
		colors[id * 24 + 12] = 1.0 * color.R;
		colors[id * 24 + 13] = 1.0 * color.G;
		colors[id * 24 + 14] = 1.0 * color.B;
		colors[id * 24 + 15] = 1.0 * color.A;
		
		colors[id * 24 + 16] = 1.0 * color.R;
		colors[id * 24 + 17] = 1.0 * color.G;
		colors[id * 24 + 18] = 1.0 * color.B;
		colors[id * 24 + 19] = 1.0 * color.A;
		
		colors[id * 24 + 20] = 1.0 * color.R;
		colors[id * 24 + 21] = 1.0 * color.G;
		colors[id * 24 + 22] = 1.0 * color.B;
		colors[id * 24 + 23] = 1.0 * color.A;
	}
	
	function CreateVertexBuffer()
	{
		//---------------------------------------------------------
		// Create vertex buffer
		
		 vertexBuffer= new VertexBuffer(
			Std.int(vertices.length / 3), // Vertex count - 3 floats per vertex
			Set3d.structure, // Vertex structure
			Usage.StaticUsage // Vertex data will stay the same
		);
		//---------------------------------------------------------
		//GenvbData();
		var vbData = vertexBuffer.lock();
		for (i in 0...Std.int(vbData.length / Set3d.structureLength)) {
			//vbData.set(i * structureLength, vertices[i * 3]+Position.x);
			//vbData.set(i * structureLength + 1, vertices[i * 3 + 1]+Position.y);
			vbData.set(i * Set3d.structureLength, vertices[i * 3]);
			vbData.set(i * Set3d.structureLength + 1, vertices[i * 3 + 1]);
			vbData.set(i * Set3d.structureLength + 2, vertices[i * 3 + 2]);
			vbData.set(i * Set3d.structureLength + 3, uvs[i * 2]);
			vbData.set(i * Set3d.structureLength + 4, uvs[i * 2 + 1]);
			vbData.set(i * Set3d.structureLength + 5, colors[i * 4]);
			vbData.set(i * Set3d.structureLength + 6, colors[i * 4 + 1]);
			vbData.set(i * Set3d.structureLength + 7, colors[i * 4 + 2]);
			vbData.set(i * Set3d.structureLength + 8, colors[i * 4 + 3]);
		}
		vertexBuffer.unlock();
		
	}
	
	function CreateIndexBuffer(){
		// A 'trick' to create indices for a non-indexed vertex data
		var indices:Array<Int> = [];
		for (i in 0...Std.int(vertices.length / 3)) {
			indices.push(i);
		}

		// Create index buffer
		indexBuffer = new IndexBuffer(
			indices.length, // Number of indices for our cube
			Usage.StaticUsage // Index data will stay the same
		);
		
		// Copy indices to index buffer
		var iData = indexBuffer.lock();
		for (i in 0...iData.length) {
			iData[i] = indices[i];
		}
		indexBuffer.unlock();
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