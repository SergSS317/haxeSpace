package;
import kha.graphics4.PipelineState;
import kha.graphics4.VertexStructure;
import kha.graphics4.VertexData;
import kha.Shaders;
import kha.graphics4.CompareMode;
import kha.graphics4.BlendingFactor;
import kha.graphics4.IndexBuffer;
import kha.graphics4.VertexBuffer;
import kha.graphics4.Usage;
import kha.graphics4.ConstantLocation;
/**
 * ...
 * @author ...
 */
class Set3d 
{
	public var structure:VertexStructure;
	public var pipeline:PipelineState;
	public var structureLength:Int;
	public var mvpID:ConstantLocation;	
	//public var indices:Array<Int>;

	public function new() 
	{
				CreateStructure();
		CreatePipeline(structure);
		
		//CreateIndexBuffer();

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
	
	/*function CreateIndexBuffer()
	{
		// A 'trick' to create indices for a non-indexed vertex data
		//var indices:Array<Int> = [];
		//for (i in 0...Std.int(vertices.length / 3)) {
		for (i in 0...6) {
			indices.push(i);
		}


	}*/
	
	/*function CreateVertexBuffer()
	{
			//---------------------------------------------------------
		// Create vertex buffer
		vertexBuffer = new VertexBuffer(
			6, // Vertex count - 3 floats per vertex
			Base.set3d.structure, // Vertex structure
			Usage.StaticUsage // Vertex data will stay the same
		);
	}*/
}