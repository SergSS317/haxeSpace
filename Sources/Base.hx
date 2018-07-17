package;

import kha.Framebuffer;
import kha.math.Vector2;
import kha.math.Vector3;

//import kha.graphics4.PipelineState;
import kha.graphics2.Graphics;
import kha.Assets;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Color;
import kha.math.FastMatrix3;
import kha.Font;
import kha.Scaler;

import kha.graphics4.TextureUnit;
import kha.graphics4.BlendingFactor;
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
  
  
class Base {
	//private var image: Image;
	//private var pipeline: PipelineState;
	//private var star:Star;
	//private var backbuffer: Image;
	//public static var stars: Array<Star>;
	//public static var Sector:Array<Array<Sectors>>;
	
	public static var AllSprites:Array<Entity>;
	
	public static var Sector:Array<Sectors>;
	//public var Sprites:Array<Sprite>;
	private var controls: Controls;
	
	private var uiController: UiController;
	
	private var camera: Camera;
	private var set3d:Set3d;
	
	private var timer: Timer;
	private var MyXml:XmlControl;
	public static var galxy:Galaxy;
	public var font:Font;
	 public var previousRealTime:Float;
    public var realTime:Float;
	
	public static var myMouse:MouseControl;
	
	public static var drawning:Drawning;
	public static var drawning2:Drawning;
	public static var drawningOther:Drawning;
	//public var spritedraw:SpriteDraw;
	public function new() {
		Assets.loadEverything(loadingFinished);
		//Scheduler.addTimeTask(update, 0, 1 / 60);
		//System.notifyOnRender(render);
	}
	public var SprtBG:Entity;			//для отрисовки
	private function loadingFinished(): Void {
		trace("Start load");
		MyXml = new XmlControl();
		camera = new Camera(0, 0);
		set3d = new Set3d();
	//	AllSprites = new Array<Entity>();
		
		drawning = new Drawning(Assets.images.ImgData);
		drawning2 = new Drawning(Assets.images.ImgData);
		drawningOther = new Drawning(Assets.images.fon);

		myMouse = new MouseControl();
		
		//backbuffer = Image.createRenderTarget(800, 600);

		timer = new Timer();
		uiController = new UiController();
		
		Sector = new Array<Sectors>();
		for ( j in 0...100)
		{
			for ( i in 0...100)
			{
				Sector.insert(i+j*100,new Sectors(new Vector2(i, j)));
			}
		}

		//trace(Sector.length);
		
		
		
		//stars = new Array<Star>();
		
		controls = new Controls();
		
		
		galxy = new Galaxy(100000, 2, 0.25, 0);
//		trace("AllSprites:" + AllSprites.length);
		
		drawning.UdateColor = true;
		drawning.UdateUV = true;
		drawning.UdateVertex = true;
		drawning.update();
		
		drawning2.UdateColor = true;
		drawning2.UdateUV = true;
		drawning2.UdateVertex = true;
		drawning2.update();
		
		var flare_uvs:Array<Float> = [0.5, 0,  0.5, 1,  1, 1,  0.5, 0,  1, 0,  1, 1];
		//drawningOther.imageData = Assets.images.fon;
		SprtBG = new Entity( new Vector3(0, 0, 0), Color.Purple, 5000000, Base.drawningOther, [0, 0,  0, 1,  1, 1,  0, 0,  1, 0,  1, 1]);
		SprtBG.isStaic = true;
		drawningOther.UdateColor = true;
		drawningOther.UdateUV = true;
		drawningOther.UdateVertex = true;
		SprtBG.update();
		drawningOther.update();
		
		previousRealTime = 0.0;
        realTime         = 0.0;
		font = Assets.fonts.kenpixel_mini_square;
trace("End load");

	Scheduler.addTimeTask(update, 0, 1 / 10);

		//trace('000');
	}

	function update(): Void {
		//trace("Start update");
		//previousRealTime = realTime;
		
		timer.update();
		camera.update(controls, timer.deltaTime);
		uiController.update();
		galxy.update();
		//drawning.UdateVertex = true;
		drawning2.update();
		//drawning.update();
		//trace("End update: "+AllSprites[1].Size);
        
	}
// private var frontbuffer: Image;
 //private var backbuffer: Image;
	public function render(frame:Framebuffer) {
		
		// A graphics object which lets us perform 3D operations
		var g = frame.g4;

		// Begin rendering
        g.begin();

        // Clear screen
		g.clear(Color.fromFloats(0.0, 0.0, 0.3), 1.0);
		if (drawningOther != null){ drawningOther.render(g); }
		
		if (drawning2 != null){ drawning2.render(g); }
		if (drawning != null){ drawning.render(g); }
		//trace("->>>>>>>>" + drawning.vertices[0]);
		
		if (uiController != null)uiController.render(frame.g2);
		// End rendering
		g.end();

		
    }

	private function reset() {
		timer.reset();
	}
}
