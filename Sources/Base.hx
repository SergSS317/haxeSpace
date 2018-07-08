package;

import kha.Framebuffer;
import kha.math.Vector2;

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
  
  
class Base {
	//private var image: Image;
	//private var pipeline: PipelineState;
	//private var star:Star;
	private var backbuffer: Image;
	//public static var stars: Array<Star>;
	//public static var Sector:Array<Array<Sectors>>;
	public static var Sector:Array<Sectors>;
	private var controls: Controls;
	
	private var uiController: UiController;
	
	private var camera: Camera;
	private var timer: Timer;
	private var MyXml:XmlControl;
	public static var galxy:Galaxy;
	public var font:Font;
	 public var previousRealTime:Float;
    public var realTime:Float;
	
	public function new() {
		Scheduler.addTimeTask(update, 0, 1 / 60);
		//Assets.loadEverything()
		Assets.loadEverything(loadingFinished);
		//trace(Assets.fonts);
		
		
		//System.notifyOnRender(render);
		
	}
	private function loadingFinished(): Void {
		Scheduler.addTimeTask(update, 0, 1 / 60);
		backbuffer = Image.createRenderTarget(800, 600);

		timer = new Timer();
		uiController = new UiController();
		camera = new Camera(0, 0);
		Sector = new Array<Sectors>();
		for ( j in 0...100)
		{
			for ( i in 0...100)
			{
				Sector.insert(i+j*100,new Sectors(new Vector2(i, j)));
			}
		}

		trace(Sector.length);
		
		
		
		//stars = new Array<Star>();
		
		controls = new Controls();
		
		MyXml = new XmlControl();
		galxy = new Galaxy(20000, 2, 0.25, 0);
		previousRealTime = 0.0;
        realTime         = 0.0;
		font = Assets.fonts.kenpixel_mini_square;

		//trace('000');
	}

	function update(): Void {
		previousRealTime = realTime;
		uiController.update();
		timer.update();
		camera.update(controls, timer.deltaTime);
		galxy.update();
		/*for ( star in  stars)
		{
			star.update();
		} */      
        
	}

	public function render(framebuffer: Framebuffer): Void {
		var g = backbuffer.g2;
		g.begin();
		g.transformation = Camera.Transform;

		galxy.render(g);

		uiController.render(g);
	g.end();	
		    // draw our backbuffer onto the active framebuffer
    framebuffer.g2.begin();
		Scaler.scale( backbuffer, framebuffer, System.screenRotation);
    framebuffer.g2.end();
		
	}
	
	private function reset() {
		timer.reset();
	}
}
