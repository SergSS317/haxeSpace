package;
//import haxe.io.Float32Array;
import kha.graphics1.Graphics4;
import kha.graphics4.Graphics;
import kha.math.Vector2;
import kha.System;
import kha.Framebuffer;
import kha.Color;
import kha.Shaders;
import kha.Assets;
import kha.Image;
import kha.System;
import kha.graphics4.TextureUnit;
import kha.graphics4.BlendingFactor;
import kha.graphics4.BlendingOperation;
import kha.graphics4.PipelineState;
import kha.graphics4.VertexStructure;
import kha.graphics4.VertexBuffer;
import kha.graphics4.IndexBuffer;
import kha.graphics4.FragmentShader;
import kha.graphics4.VertexShader;
import kha.graphics4.VertexData;
import kha.graphics4.Usage;
import kha.graphics4.ConstantLocation;
import kha.graphics4.CompareMode;
import kha.graphics4.CullMode;
import kha.math.FastMatrix4;
import kha.math.FastVector3;

/**
 * ...
 * @author ...
 */
class Drawning 
{
	var vertexBuffer:VertexBuffer;
	var indexBuffer:IndexBuffer;
	var pipeline:PipelineState;
	//var mvp:FastMatrix4;
	var mvpID:ConstantLocation;

	var textureID:TextureUnit;
    var image:Image;
	
	
	var vertices:Array<Float>= new Array<Float>();
	var uvs:Array<Float> = new Array<Float>();
	var colors:Array<Float> = new Array<Float>();
		
	public function new() 
	{
		loadingFinished();
	}
	
	var structure:VertexStructure;
	var structureLength:Int;
	
	function loadingFinished() {
		
		CreateStructure();
		CreatePipeline(structure);
		//update();
		
	}
	
	public function update(){
	//	trace("Drawning start update");
		vertices = new Array<Float>();
		uvs = new Array<Float>();
		colors = new Array<Float>();
		//trace("111: "+Base.AllSprites.length);
		for (sprt in Base.AllSprites){
			//trace(sprt.uvs.length);
			for (i in 0...sprt.uvs.length )
			{
				uvs.push(sprt.uvs[i]);
			}
			//uvs.concat(sprt.uvs);
		}
		//trace(uvs.length);
		for (sprt in Base.AllSprites){
			for (i in 0...sprt.colors.length )
			{
				colors.push(sprt.colors[i]);
			}
			//colors.concat(sprt.colors);
		}
		
		for (sprt in Base.AllSprites){
			for (i in 0...sprt.vertices.length )
			{
				vertices.push(sprt.vertices[i]);
			}
			//vertices.concat(sprt.vertices);
		}
		
		//trace("Base.AllSprites:"+vertices.length);
		PreRender();
		trace("Base.AllSprites:"+Base.AllSprites.length+"   vertices:"+vertices.length);
		//trace("Drawning end update");
	}
	
	function PreRender()
	{
		//trace("Base.AllSprites:"+vertices.length);
		// Get a handle for texture sample
		textureID = pipeline.getTextureUnit("Light9");
		// Texture
		image = Assets.images.star3;
		
		CreateVertexBuffer();
		CreateIndexBuffer();
	}
	
		function CreatePipeline(s:VertexStructure)
		{
		// Compile pipeline state
		// Shaders are located in 'Sources/Shaders' directory
        // and Kha includes them automatically
		pipeline = new PipelineState();
		pipeline.inputLayout = [s];
		pipeline.vertexShader = Shaders.simple_vert;
		pipeline.fragmentShader = Shaders.simple_frag;
        pipeline.depthWrite = true;					// Set depth mode
        pipeline.depthMode = CompareMode.Always;
		pipeline.blendDestination = BlendingFactor.DestinationAlpha;
		pipeline.compile();
				// Get a handle for our "MVP" uniform
		mvpID = pipeline.getConstantLocation("MVP");
		}
	
		function CreateStructure()
		{
					// Define vertex structure
		structure = new VertexStructure();
        structure.add("pos", VertexData.Float3);
        structure.add("uv", VertexData.Float2);
		structure.add("color", VertexData.Float4);
        // Save length - we store position and uv data
        structureLength = 9;
		}
		
		function CreateVertexBuffer()
		{
			//---------------------------------------------------------
		// Create vertex buffer
		vertexBuffer = new VertexBuffer(
			Std.int(vertices.length / 3), // Vertex count - 3 floats per vertex
			structure, // Vertex structure
			Usage.StaticUsage // Vertex data will stay the same
		);
		//---------------------------------------------------------
		//GenvbData();
		var vbData = vertexBuffer.lock();
		for (i in 0...Std.int(vbData.length / structureLength)) {
			//vbData.set(i * structureLength, vertices[i * 3]+Position.x);
			//vbData.set(i * structureLength + 1, vertices[i * 3 + 1]+Position.y);
			vbData.set(i * structureLength, vertices[i * 3]);
			vbData.set(i * structureLength + 1, vertices[i * 3 + 1]);
			vbData.set(i * structureLength + 2, vertices[i * 3 + 2]);
			vbData.set(i * structureLength + 3, uvs[i * 2]);
			vbData.set(i * structureLength + 4, uvs[i * 2 + 1]);
			vbData.set(i * structureLength + 5, colors[i * 4]);
			vbData.set(i * structureLength + 6, colors[i * 4 + 1]);
			vbData.set(i * structureLength + 7, colors[i * 4 + 2]);
			vbData.set(i * structureLength + 8, colors[i * 4 + 3]);
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
		
	public function render(g:Graphics) {
		//trace("start Drawning render: "+vertices.length);
				g.setVertexBuffer(vertexBuffer);
		g.setIndexBuffer(indexBuffer);

		// Bind state we want to draw with
		g.setPipeline(pipeline);

		// Set our transformation to the currently bound shader, in the "MVP" uniform
		g.setMatrix(mvpID, Camera.Matrix);
//trace("Base.AllSprites:"+Base.AllSprites.length+"   vertices:"+vertices.length);
		// Set texture
		g.setTexture(textureID, image);
		//g.setTextureParameters(textureID, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.MipMapFilter.NoMipFilter);

		// Draw!
		g.drawIndexedVertices();
	}
}