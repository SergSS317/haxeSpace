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
	private var backbuffer: Image;
	public static var set3d:Set3d;
	//public static var stars: Array<Star>;
	//public static var Sector:Array<Array<Sectors>>;
	
	//public static var AllSprites:Array<Sprite>;
	
	public static var Sector:Array<Sectors>;
	//public var Sprites:Array<Sprite>;
	private var controls: Controls;
	
	private var uiController: UiController;
	
	private var camera: Camera;
	private var timer: Timer;
	private var MyXml:XmlControl;
	public static var galxy:Galaxy;
	public var font:Font;
	 public var previousRealTime:Float;
    public var realTime:Float;
	
	public static var myMouse:MouseControl;
	
	//public static var drawning:Drawning;
	//public var spritedraw:SpriteDraw;
	public function new() {
		//trace("111");
		
		//Assets.loadEverything()
		Assets.loadEverything(loadingFinished);
		//Scheduler.addTimeTask(update, 0, 1 / 60);
		//trace(Assets.fonts);
		
		
		//System.notifyOnRender(render);
		
	}
	private function loadingFinished(): Void {
		trace("Start load");
		set3d = new Set3d();
		camera = new Camera(0, 0);
		
		//drawning = new Drawning();
		//spritedraw = new SpriteDraw();
		//AllSprites = new Array<Sprite>();
		//Sprites = new Array<Sprite>();
		/*for (i in 0...200000)
		{
			AllSprites.push(new Sprite(Assets.images.Light13,new Vector3(i * 0.1, i * 0.1, 0),new Vector3(1,1,1)));
		}*/

		
		
		
		myMouse = new MouseControl();
		Scheduler.addTimeTask(update, 0, 1 / 60);
		backbuffer = Image.createRenderTarget(800, 600);

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
		
		MyXml = new XmlControl();
		galxy = new Galaxy(12000, 2, 0.25, 0);
		//drawning.update();
		previousRealTime = 0.0;
        realTime         = 0.0;
		font = Assets.fonts.kenpixel_mini_square;
//trace("End load");
		//trace('000');
	}

	function update(): Void {
		//if (MouseControl.btnLeft) trace('md');
		//trace("Start update");
		previousRealTime = realTime;
		uiController.update();
		/*for (sprite in AllSprites)
		{
			sprite.update();
		}*/
		//trace("sprt2="+AllSprites.length);
		//trace("AllSprites="+AllSprites);
		
		//drawning.update();
		
		timer.update();
		camera.update(controls, timer.deltaTime);
		galxy.update();
		/*for ( star in  stars)
		{
			star.update();
		} */   
		//trace("End update");
        
	}
//var drawning:Drawning = new Drawning();
	public function render(frame:Framebuffer) {
		//trace("Zoom:"+Camera.zoom);
		// A graphics object which lets us perform 3D operations
		var g = frame.g4;

		// Begin rendering
        g.begin();

        // Clear screen
		g.clear(Color.fromFloats(0.0, 0.0, 0.3), 1.0);
		g.setPipeline(Base.set3d.pipeline);
		g.setMatrix(Base.set3d.mvpID, Camera.Matrix);
		//trace(Base.set3d.mvpID);
		galxy.render(g);

		// End rendering
		g.end();
    }
	/*
	public function render(framebuffer: Framebuffer): Void {
		var g = backbuffer.g2;
		g.begin();
		g.transformation = Camera.Transform;
		//g.drawScaledImage(Assets.images.cloud, -500000,-500000,1000000,1000000);
		galxy.render(g);
		g.drawScaledImage(Assets.images.BlackHole2, -20000000000, -20000000000, 40000000000, 40000000000);
		uiController.render(g);
	g.end();	
		    // draw our backbuffer onto the active framebuffer
    framebuffer.g2.begin();
		Scaler.scale( backbuffer, framebuffer, System.screenRotation);
    framebuffer.g2.end();
		
	}
	*/
	private function reset() {
		timer.reset();
	}
}
