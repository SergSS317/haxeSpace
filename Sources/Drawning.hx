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



	var textureID:TextureUnit;
    var image:Image;
	
	//Base Params
	//var pipeline:PipelineState;
	var mvpID:ConstantLocation;	
	var vertexBuffer:VertexBuffer;
	var indexBuffer:IndexBuffer;
	//var structure:VertexStructure;
	
	
	var vertices:Array<Float>= new Array<Float>();
	var uvs:Array<Float> = new Array<Float>();
	var colors:Array<Float> = new Array<Float>();
		
	public function new() 
	{
		loadingFinished();
	}
	

	
	function loadingFinished() 
	{	

		
//		textureID = pipeline.getTextureUnit("Light9");
		// Texture
//		image = Assets.images.Light9;
				
		CreateVertexBuffer();
		CreateIndexBuffer();
		//trace("123");
		//trace("Base.AllSprites:"+Base.AllSprites.length+"   vertices:"+vertices.length);
	}
	
	
	

		
	function CreateVertexBuffer()
	{
			//---------------------------------------------------------
		// Create vertex buffer
		vertexBuffer = new VertexBuffer(
			6, // Vertex count - 3 floats per vertex
			Base.set3d.structure, // Vertex structure
			Usage.StaticUsage // Vertex data will stay the same
		);
		//---------------------------------------------------------
		//GenvbData();
		var vbData = vertexBuffer.lock();
		for (i in 0...Std.int(vbData.length / Base.set3d.structureLength)) {
			//vbData.set(i * structureLength, vertices[i * 3]+Position.x);
			//vbData.set(i * structureLength + 1, vertices[i * 3 + 1]+Position.y);
			vbData.set(i * Base.set3d.structureLength, vertices[i * 3]);
			vbData.set(i * Base.set3d.structureLength + 1, vertices[i * 3 + 1]);
			vbData.set(i * Base.set3d.structureLength + 2, vertices[i * 3 + 2]);
			vbData.set(i * Base.set3d.structureLength + 3, uvs[i * 2]);
			vbData.set(i * Base.set3d.structureLength + 4, uvs[i * 2 + 1]);
			vbData.set(i * Base.set3d.structureLength + 5, colors[i * 4]);
			vbData.set(i * Base.set3d.structureLength + 6, colors[i * 4 + 1]);
			vbData.set(i * Base.set3d.structureLength + 7, colors[i * 4 + 2]);
			vbData.set(i * Base.set3d.structureLength + 8, colors[i * 4 + 3]);
		}
		vertexBuffer.unlock();
	}
		
	function CreateIndexBuffer()
	{
		// A 'trick' to create indices for a non-indexed vertex data
		var indices:Array<Int> = [];
		for (i in 0...Std.int(6)) {
			indices.push(i);
		}
/*var indices:Array<Int> = { 0,1,2,3,4,5,6};*/
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
	
	/*public function AddEntity(en:Entity)
	{
		for (i in 0...en.vertices.length){
			vertices.push(en.vertices[i]);
		}
		
		for (i in 0...en.uvs.length){
			uvs.push(en.uvs[i]);
		}
		
		for (i in 0...en.colors.length){
			colors.push(en.colors[i]);
		}
	}*/
	
	public function render(g:Graphics)
	{
		//trace(");
		/*trace("start Drawning render: " + vertices.length);
		trace("vertexBuffer: " + vertexBuffer._data);
		trace("indexBuffer: " + indexBuffer._data);
		trace("textureID: " + textureID);
		trace("image: " + image);*/
		

		// Bind state we want to draw with
		

		// Set our transformation to the currently bound shader, in the "MVP" uniform
		//g.setMatrix(Base.set3d.mvpID, Camera.Matrix);
		//trace("Base.AllSprites:"+Base.AllSprites.length+"   vertices:"+vertices.length);
		// Set texture
		
		g.setVertexBuffer(vertexBuffer);
		g.setIndexBuffer(indexBuffer);
		
		g.setTexture(textureID, image);
		//g.setTextureParameters(textureID, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.MipMapFilter.NoMipFilter);

		// Draw!
		g.drawIndexedVertices();
		
	}
}