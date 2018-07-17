package;
//import haxe.io.Float32Array;
import kha.FastFloat;
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
	var vertexBuffer:VertexBuffer;
	var indexBuffer:IndexBuffer;
	
	var textureID:TextureUnit;
    var imageData:Image;
	
	
	public static var vertices:Array<Float>= new Array<Float>();
	public static var uvs:Array<Float> = new Array<Float>();
	public static var colors:Array<Float> = new Array<Float>();
		
	public function new(_imageData:Image) 
	{
		imageData = _imageData;
		// Create vertex buffer
		vertexBuffer = new VertexBuffer( 
			Std.int(1200000), // Vertex count - 3 floats per vertex
			Set3d.structure, // Vertex structure
			Usage.DynamicUsage // Vertex data will stay the same
		);

		CreateIndexBuffer(1200000);
	}
	
	public function update()
	{
		textureID = Set3d.pipeline.getTextureUnit("Light9");
		// Texture
		CreateVertexBuffer(UdateVertex,UdateUV,UdateColor);
	}
	
	public static var UdateUV:Bool = false;
	public static var UdateColor:Bool = false;
	public static var UdateVertex:Bool=false;

	public function CreateVertexBuffer(updVert:Bool,upduv:Bool,updcolor:Bool)
		{
		var vbData = vertexBuffer.lock();
		var eee = 9;
		//if (updVert)
		//{
			//for (i in 0...Std.int(vbData.length / Set3d.structureLength)) 
			
			
			for (i in 0...Std.int(Base.AllSprites.length-1)) 
			{
				//trace("Base.AllSprites.vert ("+i+") "+Base.AllSprites[i].vertices.length);
				for (j in 0...6)
				{
				vbData.set((i * 6 + j) * eee + 0, Base.AllSprites[i].vertices[j*3+0]);
				vbData.set((i * 6 + j) * eee + 1, Base.AllSprites[i].vertices[j*3+1]);
				vbData.set((i * 6 + j) * eee + 2, Base.AllSprites[i].vertices[j*3+2]);
				
				vbData.set((i * 6 + j) * eee + 3, Base.AllSprites[i].uvs[j*2+0]);
				vbData.set((i * 6 + j) * eee + 4, Base.AllSprites[i].uvs[j*2+1]);
				
				vbData.set((i * 6 + j) * eee + 5, Base.AllSprites[i].colors[j*4+0]);
				vbData.set((i * 6 + j) * eee + 6, Base.AllSprites[i].colors[j*4+1]);
				vbData.set((i * 6 + j) * eee + 7, Base.AllSprites[i].colors[j*4+2]);
				vbData.set((i * 6 + j) * eee + 8, Base.AllSprites[i].colors[j*4+3]);
				}
				/*if (vertices[i * 3] != null)
				{
					
				
					vbData.set(i * Set3d.structureLength, vertices[i * 3]);
					vbData.set(i * Set3d.structureLength + 1, vertices[i * 3 + 1]);
					vbData.set(i * Set3d.structureLength + 2, vertices[i * 3 + 2]);
				}else{
					vbData.set(i * Set3d.structureLength, 0);
					vbData.set(i * Set3d.structureLength + 1, 0);
					vbData.set(i * Set3d.structureLength + 2, 0);
				}*/
			}
		//}
		
		/*if (upduv){
			for (i in 0...Std.int(vbData.length / Set3d.structureLength)) {
			if(uvs[i * 2]!=null){
				vbData.set(i * Set3d.structureLength + 3, uvs[i * 2]);
				vbData.set(i * Set3d.structureLength + 4, uvs[i * 2 + 1]);
			}else{
				vbData.set(i * Set3d.structureLength + 3, 0);
				vbData.set(i * Set3d.structureLength + 4, 0);
			}
			}
		}
		
		if (updcolor){
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
		}*/
		
		vertexBuffer.unlock();
		UdateUV = false;
		UdateColor = false;
		UdateVertex = false;
		/*var vbData = vertexBuffer.lock();
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
			//vbData.set(i * Set3d.structureLength + 9, Camera.zoom);
		}
		vertexBuffer.unlock();*/
		}
		
	function CreateIndexBuffer(count:Int)
	{
		// A 'trick' to create indices for a non-indexed vertex data
		var indices:Array<Int> = [];
		for (i in 0...Std.int(count)) { indices.push(i); }

		// Create index buffer
		indexBuffer = new IndexBuffer(
			indices.length, // Number of indices for our cube
			Usage.StaticUsage // Index data will stay the same
		);
		
		// Copy indices to index buffer
		var iData = indexBuffer.lock();
		for (i in 0...iData.length) { iData[i] = indices[i]; }
		indexBuffer.unlock();
	}
		
	public function render(g:Graphics) {
		g.setVertexBuffer(vertexBuffer);
		g.setIndexBuffer(indexBuffer);

		g.setPipeline(Set3d.pipeline);
		g.setMatrix(Set3d.mvpID, Camera.Matrix); // Set our transformation to the currently bound shader, in the "MVP" uniform
		g.setTexture(textureID, imageData); // Set texture
		//g.setTextureParameters(textureID, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.MipMapFilter.NoMipFilter);
	
		g.drawIndexedVertices(); // Draw!

	}
}