package;
//import haxe.io.Float32Array;
import kha.graphics1.Graphics4;
import kha.graphics4.Graphics;
import kha.math.Vector2;
import kha.System;
import kha.Framebuffer;
import kha.Color;
import kha.Scheduler;
import kha.Assets;
import kha.Image;
import kha.System;
import kha.graphics4.TextureUnit;

import kha.graphics4.BlendingOperation;


import kha.graphics4.VertexBuffer;
import kha.graphics4.IndexBuffer;
import kha.graphics4.FragmentShader;
import kha.graphics4.VertexShader;

import kha.graphics4.Usage;


import kha.graphics4.CullMode;
import kha.math.FastMatrix4;
import kha.math.FastVector3;

/**
 * ...
 * @author ...
 */
class Drawning 
{
	//var vertexBuffer:VertexBuffer;
	//var vertexBuffers:Array<VertexBuffer>;
	//var vertexBuffer:VertexBuffer;
	//var indexBuffer:IndexBuffer;

	//var mvp:FastMatrix4;
	

	var textureID:TextureUnit;
    var imageData:Image;
	
	var verbuf:Array<VertexBuffer>;
	var indbuf:IndexBuffer;
	public static var vertices:Array<Float> = new Array<Float>();

	public static var uvs:Array<Float> = new Array<Float>();
	public static var colors:Array<Float> = new Array<Float>();
		public var indexBuffer:IndexBuffer;
	public function new(_imageData:Image) 
	{
		imageData = _imageData;
		verbuf = new Array<VertexBuffer>();
		//loadingFinished(_imageData:Image);
	}
	
	//var a:Int;
	//var vertexBuffers:Array<VertexBuffer>;
	public function update(){
			//vertexBuffers = new Array<VertexBuffer>();
		
		//trace("i`m here...");
		//a++;
			for (sprt in Base.AllSprites)
			{
				sprt.update();
				verbuf.push(sprt.vertexBuffer);
				//indbuf
				//for(i in 0...)
			//	vertexBuffers.push(sprt.vertexBuffer);
			}
			CreateIndexBuffer( Std.int(verbuf.length / 3));
		
			//trace("vertexBuffers: " + vertexBuffers.length);
			//trace("vertexBuffer[0]"+vertexBuffers[500]);
			//PreRender();
	
	}
	
	function PreRender()
	{
		// Get a handle for texture sample
		textureID = Set3d.pipeline.getTextureUnit("Light9");
		// Texture
		//CreateVertexBuffer();
	//	CreateIndexBuffer();
	}
	
		
		function CreateIndexBuffer(id:Int){
		// A 'trick' to create indices for a non-indexed vertex data
		var indices:Array<Int>=new Array<Int>();
		for (i in 0...Std.int(id)) {
			indices.push(i);
		}
trace(indices.length);
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

		if(verbuf!=null){
		
		//g.setVertexBuffer( vertexBuffers[0]);
		PreRender();
		g.setMatrix(Set3d.mvpID, Camera.Matrix);
		g.setPipeline(Set3d.pipeline);
		g.setTexture(textureID, imageData);
		
		g.setVertexBuffers(verbuf);
		g.setIndexBuffer(indexBuffer);
		g.drawIndexedVertices();
		/*for (i in 0...Base.AllSprites.length){
			//trace(i);
		//g.setVertexBuffer( Base.AllSprites[i].vertexBuffer);
		
		g.setIndexBuffer(Base.AllSprites[i].indexBuffer);
		g.drawIndexedVertices();
		}*/
		
		//g.drawIndexedVertices();
		
		// Draw!
		
		}else{trace("vertexBuffers is null!"); }
		//trace(g.refreshRate());
	}
}