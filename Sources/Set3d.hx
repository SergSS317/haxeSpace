package;
import kha.graphics4.VertexStructure;
import kha.graphics4.PipelineState;
import kha.graphics4.VertexData;
import kha.Shaders;
import kha.graphics4.CompareMode;
import kha.graphics4.BlendingFactor;
import kha.graphics4.ConstantLocation;
/**
 * ...
 * @author SergSS
 */
class Set3d 
{
	
	public static var structure:VertexStructure;
	public static var structureLength:Int;
	public static var pipeline:PipelineState;
	public static var mvpID:ConstantLocation;
	public static var EntityId:Int=0;
	public function new() 
	{
		
		CreateStructure();
		CreatePipeline(structure);
		
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
	
}