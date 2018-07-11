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
	var mvp:FastMatrix4;
	var mvpID:ConstantLocation;

	var textureID:TextureUnit;
    var image:Image;
	
	
	var vertices:Array<Float>;
	var uvs:Array<Float>;
	var colors:Array<Float>;
	// An array of vertices to form a cube
	/*static var vertices:Array<Float> = [

	    -1.0, -1.0, 0.0,
		-1.0, 1.0,0.0,
		 1.0, 1.0,0.0,
		-1.0, -1.0, 0.0,
		1.0, -1.0,0.0,
		1.0, 1.0, 0.0
	];
	// Array of texture coords for each cube vertex
	static var uvs:Array<Float> = [

	    0.0, 0.0, 
		0.0, 1.0, 
		1.0, 1.0, 
		0.0, 0.0, 
		1.0, 0.0, 
		1.0, 1.0
	];
	//Array of color
	static var colors:Array<Float> = [
	    1.0,  1.0,  1.0, 1.0,
		1.0,  1.0,  1.0, 1.0,
		1.0,  1.0,  1.0, 1.0,
		1.0,  1.0,  1.0, 1.0,
		1.0,  1.0,  1.0, 1.0,
		1.0,  1.0,  1.0, 1.0,
		];*/
		
		
	public function new() 
	{
		loadingFinished();
	}
	var structure:VertexStructure;
	var structureLength:Int;
	function loadingFinished() {
		vertices = SpriteDraw.vertices;
		uvs = SpriteDraw.uvs;
		colors = SpriteDraw.colors;
		
		
		// Define vertex structure
		var structure = new VertexStructure();
        structure.add("pos", VertexData.Float3);
        structure.add("uv", VertexData.Float2);
		structure.add("color", VertexData.Float4);
        // Save length - we store position and uv data
        var structureLength = 9;
		
		//---------------------------------------------------------
		
		// Compile pipeline state
		// Shaders are located in 'Sources/Shaders' directory
        // and Kha includes them automatically
		pipeline = new PipelineState();
		pipeline.inputLayout = [structure];
		pipeline.vertexShader = Shaders.simple_vert;
		pipeline.fragmentShader = Shaders.simple_frag;
        pipeline.depthWrite = true;					// Set depth mode
        pipeline.depthMode = CompareMode.Always;
		pipeline.blendDestination = BlendingFactor.DestinationAlpha;
		pipeline.compile();
		
		//---------------------------------------------------------
		
		// Get a handle for our "MVP" uniform
		mvpID = pipeline.getConstantLocation("MVP");

		
		// Get a handle for texture sample
		textureID = pipeline.getTextureUnit("Light9");

		// Texture
		image = Assets.images.Light9;
		
		
		//---------------------------------------------------------
		//-----------------------Camera----------------------------
		//---------------------------------------------------------
		// Projection matrix: 45° Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
		var projection = FastMatrix4.perspectiveProjection(45.0, 4.0 / 3.0, 0.1, 100.0);
		// Or, for an ortho camera
		//var projection = FastMatrix4.orthogonalProjection(-10.0, 10.0, -10.0, 10.0, 0.0, 100.0); // In world coordinates
		
		// Camera matrix
		var view = FastMatrix4.lookAt(new FastVector3(0, 0, 3), // Camera is at (4, 3, 3), in World Space
								  new FastVector3(0, 0, 0), // and looks at the origin
								  new FastVector3(0, 1, 0) // Head is up (set to (0, -1, 0) to look upside-down)
		);
		
		//---------------------------------------------------------
		
		// Model matrix : an identity matrix (model will be at the origin)
		var model = FastMatrix4.identity();
		// Our ModelViewProjection : multiplication of our 3 matrices
		// Remember, matrix multiplication is the other way around
		mvp = FastMatrix4.identity();
		mvp = mvp.multmat(projection);
		mvp = mvp.multmat(view);
		mvp = mvp.multmat(model);
		
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
	/*var vbData:haxe.io.Float32Array;
	function GenvbData(){
	 vbData = vertexBuffer.lock();
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
	}*/
	
	public function render(g:Graphics) {
				g.setVertexBuffer(vertexBuffer);
		g.setIndexBuffer(indexBuffer);

		// Bind state we want to draw with
		g.setPipeline(pipeline);

		// Set our transformation to the currently bound shader, in the "MVP" uniform
		g.setMatrix(mvpID, mvp);

		// Set texture
		g.setTexture(textureID, image);
		//g.setTextureParameters(textureID, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureAddressing.Clamp, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.TextureFilter.LinearFilter, kha.graphics4.MipMapFilter.NoMipFilter);

		// Draw!
		g.drawIndexedVertices();
	}
}