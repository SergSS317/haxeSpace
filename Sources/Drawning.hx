package;
//import haxe.io.Float32Array;
//import haxe.io.Float32Array;
import kha.FastFloat;
//import kha.arrays.Float32Array;
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
	public var EntityId:Int = 0;
	var vertexBuffer:VertexBuffer;
	var indexBuffer:IndexBuffer;
	
	//var textureID:TextureUnit;
    var imageData:Image;
	
	
	public var vertices:Array<Float>= new Array<Float>();
	public var uvs:Array<Float> = new Array<Float>();
	public var colors:Array<Float> = new Array<Float>();
		//1200000
	public function new(_imageData:Image) 
	{
		imageData = _imageData;
		// Create vertex buffer
		vertexBuffer = new VertexBuffer( 
			Std.int(120000), // Vertex count - 3 floats per vertex
			Set3d.structure, // Vertex structure
			Usage.DynamicUsage // Vertex data will stay the same
		);

		CreateIndexBuffer(120000);
		//textureID = Set3d.pipeline.getTextureUnit("Light9");
	}
	
	public function update()
	{
		//CreateVertexBuffer(UdateVertex,UdateUV,UdateColor);
	}
	
	public var UdateUV:Bool = false;
	public var UdateColor:Bool = false;
	public var UdateVertex:Bool=false;

		
	public function CreateVertexBuffer(updVert:Bool,upduv:Bool,updcolor:Bool)
	{
		var tmp1:Int = 0;
		var tmp2:Int = 0;
		var vbData;
		
		if (updVert)
		{
			
			vbData = vertexBuffer.lock();//vbData.length / Set3d.structureLength
			//trace("i`m hire!"+vbData.length);
			for (i in 0...Std.int(vbData.length / Set3d.structureLength))
			{
				tmp1 = i * Set3d.structureLength;
				tmp2 = i * 3;
				if (vertices[tmp2] != null)
				{
					vbData.set(tmp1, vertices[tmp2]);
					vbData.set(tmp1 + 1, vertices[tmp2 + 1]);
					vbData.set(tmp1 + 2, vertices[tmp2 + 2]);
				}else{
					vbData.set(tmp1, 0);
					vbData.set(tmp1 + 1, 0);
					vbData.set(tmp1 + 2, 0);
				}
			}
			vertexBuffer.unlock();
		}
		
		if (upduv){
			var vbData = vertexBuffer.lock();
			for (i in 0...Std.int(vbData.length / Set3d.structureLength)) {
			if(uvs[i * 2]!=null){
				vbData.set(i * Set3d.structureLength + 3, uvs[i * 2]);
				vbData.set(i * Set3d.structureLength + 4, uvs[i * 2 + 1]);
			}else{
				vbData.set(i * Set3d.structureLength + 3, 0);
				vbData.set(i * Set3d.structureLength + 4, 0);
			}
			}
			vertexBuffer.unlock();
		}
		
		if (updcolor){
			var vbData = vertexBuffer.lock();
			for (i in 0...Std.int(vbData.length / Set3d.structureLength)) {
			if (colors[i * 4] != null){
				vbData.set(i * Set3d.structureLength + 5, colors[i * 4]);
				vbData.set(i * Set3d.structureLength + 6, colors[i * 4 + 1]);
				vbData.set(i * Set3d.structureLength + 7, colors[i * 4 + 2]);
				vbData.set(i * Set3d.structureLength + 8, colors[i * 4 + 3]);
			}else{
				vbData.set(i * Set3d.structureLength + 5, 0);
				vbData.set(i * Set3d.structureLength + 6, 0);
				vbData.set(i * Set3d.structureLength + 7, 0);
				vbData.set(i * Set3d.structureLength + 8, 0);
			}
			}
			vertexBuffer.unlock();
		}
	
		UdateUV = false;
		UdateColor = false;
		UdateVertex = false;
	}
		
	function CreateIndexBuffer(count:Int)
	{
		// A 'trick' to create indices for a non-indexed vertex data
		var indices:Array<Int> = [];
		for (i in 0...Std.int(count)) {	indices.push(i); }

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
		
		
	public function render(g:Graphics) 
	{
		CreateVertexBuffer(UdateVertex,UdateUV,UdateColor);
		g.setVertexBuffer(vertexBuffer);
		
		g.setIndexBuffer(indexBuffer);
		// Bind state we want to draw with
		g.setPipeline(Set3d.pipeline);
		// Set our transformation to the currently bound shader, in the "MVP" uniform
		g.setMatrix(Set3d.mvpID, Camera.Matrix);
		// Set texture
		g.setTexture(Set3d.pipeline.getTextureUnit("Light9"), imageData);
		//g.setTextureParameters(textureID, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.MipMapFilter.NoMipFilter);
	
		// Draw!
		g.drawIndexedVertices();
	}
}