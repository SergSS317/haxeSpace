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
	
	//var mvp:FastMatrix4;
	

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
			Std.int(466032), // Vertex count - 3 floats per vertex
			Set3d.structure, // Vertex structure
			Usage.DynamicUsage // Vertex data will stay the same
		);

		CreateIndexBuffer(466032);
		//loadingFinished(_imageData:Image);
	}
	

	
	/*function loadingFinished() {
		
		//CreateStructure();
		//CreatePipeline(structure);
		//update();
		
	}*/
	//var a:Int;
	public function update(){
	
		
		//a++;
		//if(a<10){
	/*for (sprt in Base.AllSprites)
	{
		sprt.update();
	}*/
	//UdateVertex = true;
	//UdateIndex = true;
	PreRender();
		//}
	//trace("sprt:"+Base.AllSprites.length+"   vert:"+vertices.length+"   uvs:"+uvs.length);
	//	trace("Drawning start update");
	/*
if(a < 100000){
	colors = new Array<Float>();
	for (sprt in Base.AllSprites)
	{
		for (i in 0...sprt.colors.length )
		{
			colors.push(sprt.colors[i]);
		}
	}
}

if(a < 1000000){
	vertices = new Array<Float>();
	for (sprt in Base.AllSprites)
	{
		for (i in 0...sprt.vertices.length )
		{
			vertices.push(sprt.vertices[i]);
		}
	}
}

if(a < 100){
	uvs = new Array<Float>();
	for (sprt in Base.AllSprites)
	{
		for (i in 0...sprt.uvs.length )
		{
			uvs.push(sprt.uvs[i]);
		}
	}
}*/
	
		
		
		//trace("111: "+Base.AllSprites.length);
//trace("--------------");

		
			
			
			
			/*uvs = uvs.concat(sprt.uvs);
			colors = colors.concat(sprt.colors);
			vertices = vertices.concat(sprt.vertices);*/
//trace("vertices: "+vertices.length);
			/*var tuvs = uvs.concat(sprt.uvs);
			uvs = tuvs;
			
			var tcolors = colors.concat(sprt.colors);
			colors = tcolors;
			
			var tvertices = vertices.concat(sprt.vertices);
			vertices = tvertices;*/
			
			
			
			
			
			
		

		//trace(uvs.length);
		/*for (sprt in Base.AllSprites){
			for (i in 0...sprt.colors.length )
			{
				colors.push(sprt.colors[i]);
			}
		}
		
		for (sprt in Base.AllSprites){
			for (i in 0...sprt.vertices.length )
			{
				vertices.push(sprt.vertices[i]);
			}
		}*/
		
		//trace("Base.AllSprites:"+vertices.length);
		
		//trace("Base.AllSprites:"+Base.AllSprites.length+"   vertices:"+vertices.length);
		//trace("Drawning end update");
	}
	public static var UdateUV:Bool = false;
	public static var UdateColor:Bool = false;
	public static var UdateVertex:Bool=false;
	function PreRender()
	{
		//trace("Base.AllSprites:"+vertices.length);
		// Get a handle for texture sample
		
		textureID = Set3d.pipeline.getTextureUnit("Light9");
		// Texture
		
		 CreateVertexBuffer(UdateVertex,UdateUV,UdateColor);
		//if(UdateVertex) CreateVertexBuffer();
		//UdateVertex = false;
		//if (UdateIndex) 
		
		//CreateIndexBuffer();
		//UdateIndex = false;
	}
	

	

		
	public function CreateVertexBuffer(updVert:Bool,upduv:Bool,updcolor:Bool)
		{
			//---------------------------------------------------------
			/*	vertexBuffer = new VertexBuffer(
			Std.int(vertices.length / 3), // Vertex count - 3 floats per vertex
			Set3d.structure, // Vertex structure
			Usage.DynamicUsage // Vertex data will stay the same
		);*/
		//---------------------------------------------------------
		//GenvbData();
		var vbData = vertexBuffer.lock();
		
		if (updVert)
			{
				for (i in 0...Std.int(vbData.length / Set3d.structureLength)) {
				if (vertices[i * 3] != null)
			{
				vbData.set(i * Set3d.structureLength, vertices[i * 3]);
				vbData.set(i * Set3d.structureLength + 1, vertices[i * 3 + 1]);
				vbData.set(i * Set3d.structureLength + 2, vertices[i * 3 + 2]);
			}else{
				vbData.set(i * Set3d.structureLength, 0);
				vbData.set(i * Set3d.structureLength + 1, 0);
				vbData.set(i * Set3d.structureLength + 2, 0);
			}
			}
		}
		
		if (upduv){
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
		}
		/*
		
		for (i in 0...Std.int(vbData.length / Set3d.structureLength)) {
			//vbData.set(i * structureLength, vertices[i * 3]+Position.x);
			//vbData.set(i * structureLength + 1, vertices[i * 3 + 1]+Position.y);
			if (updVert)
			{
			if (vertices[i * 3] != null)
			{
				vbData.set(i * Set3d.structureLength, vertices[i * 3]);
				vbData.set(i * Set3d.structureLength + 1, vertices[i * 3 + 1]);
				vbData.set(i * Set3d.structureLength + 2, vertices[i * 3 + 2]);
			}else{
				vbData.set(i * Set3d.structureLength, 0);
				vbData.set(i * Set3d.structureLength + 1, 0);
				vbData.set(i * Set3d.structureLength + 2, 0);
			}
			}
			if(upduv){
			if(uvs[i * 2]!=null){
				vbData.set(i * Set3d.structureLength + 3, uvs[i * 2]);
				vbData.set(i * Set3d.structureLength + 4, uvs[i * 2 + 1]);
			}else{
				vbData.set(i * Set3d.structureLength + 3, 0);
				vbData.set(i * Set3d.structureLength + 4, 0);
			}
			}
			if(updcolor){
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

			//vbData.set(i * Set3d.structureLength + 9, Camera.zoom);
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
		
				function CreateIndexBuffer(count:Int){
		// A 'trick' to create indices for a non-indexed vertex data
		//trace("indices:"+vertices.length);
		var indices:Array<Int> = [];
		for (i in 0...Std.int(count)) {
			indices.push(i);
		}
//trace("indic: "+indices.length);
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
		
		/*function CreateIndexBuffer(){
		// A 'trick' to create indices for a non-indexed vertex data
		//trace("indices:"+vertices.length);
		var indices:Array<Int> = [];
		for (i in 0...Std.int(vertices.length / 3)) {
			indices.push(i);
		}
//trace("indic: "+indices.length);
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
		}*/
		
	public function render(g:Graphics) {
//		var temp:Float = Scheduler.time();
		//trace("start Drawning render: "+vertices.length);
		g.setVertexBuffer(vertexBuffer);
		g.setIndexBuffer(indexBuffer);

		// Bind state we want to draw with

			g.setPipeline(Set3d.pipeline);
		
		// Set our transformation to the currently bound shader, in the "MVP" uniform
		g.setMatrix(Set3d.mvpID, Camera.Matrix);
//trace("Base.AllSprites:"+Base.AllSprites.length+"   vertices:"+vertices.length);
		// Set texture
		g.setTexture(textureID, imageData);
		//g.setTextureParameters(textureID, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.MipMapFilter.NoMipFilter);
	
		// Draw!
		g.drawIndexedVertices();
		//g.drawIndexedVertices( 1, -1);
//			var temp2:Float = Scheduler.time();
	
//	trace("delta: "+(temp2-temp));
	}
}