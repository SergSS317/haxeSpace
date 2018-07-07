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
	public static var stars: Array<Star>;
	//public static var Sector:Array<Array<Sectors>>;
	public static var Sector:Array<Sectors>;
	private var controls: Controls;
	
	private var uiController: UiController;
	
	private var camera: Camera;
	private var timer: Timer;
	private var MyXml:XmlControl;
	private var galxy:Galaxy;
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
		
		
		
		stars = new Array<Star>();
		
		controls = new Controls();
		
		MyXml = new XmlControl();
		galxy = new Galaxy(200000, 2, 0.25, 0);
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
		for ( star in  stars)
		{
			star.update();
		}       
        
	}

	public function render(framebuffer: Framebuffer): Void {
		var g = backbuffer.g2;
		g.begin();
		var CAM:FastMatrix3 = new FastMatrix3(	Camera.zoom, 	0, 				Camera.aX,
												0,				Camera.zoom,	Camera.aY,
												0,				0,				1);
		g.transformation = CAM;

		//отрисовка светимости
		if(Camera.zoom<3){
			for ( star in  stars)
			{
				
				g.color = star.color;
				g.drawScaledImage(star.flare, star.FlareRect.x, star.FlareRect.y, star.FlareRect.w, star.FlareRect.h);
			}
		}
		if(Camera.zoom>0.001){
		//отрисовка цвета звезд
		for ( star in  stars)
		{
			g.color = star.color;
			g.drawScaledImage(star.UnderFlare, star.StarRect.x, star.StarRect.y, star.StarRect.w, star.StarRect.h);
			//g.drawScaledImage(star.UnderFlare, star.asx, star.asy, star.asw, star.ash);
		}
		
		//отрисовка самой звезды
		g.color = Color.White;
		for ( star in  stars)
		{

			g.drawScaledImage(star.image, star.StarRect.x, star.StarRect.y, star.StarRect.w, star.StarRect.h);
		}
		}

		uiController.render(g);
	g.end();	
		    // draw our backbuffer onto the active framebuffer
    framebuffer.g2.begin();
    Scaler.scale( backbuffer, framebuffer, System.screenRotation);
    framebuffer.g2.end();
		/*g.font = font;
		g.fontSize = 24;
		g.color = Color.White;
		g.drawString("Stars count: " + stars.length +" ( "+Star.TotalCount+" );", 10, 10);
		realTime = Scheduler.realTime();
		fps = Math.round( 1.0 / ( realTime - previousRealTime )*10.0)/10.0;
		if (fps != Math.POSITIVE_INFINITY && fps < 500) tfps = fps;
		g.drawString("FPS: " + tfps + " ;", 10, 34);
		g.drawString("Zoom: " + Camera.zoom + " ;", 10, 82);
		//g.drawString("FPS: " + realTime , 10 - camera.aX, 70 - camera.aY);
		//g.drawString("FPS:  - "+previousRealTime, 10 - camera.aX, 100 - camera.aY);
		g.drawString("Delta Time: "+( realTime - previousRealTime ), 10, 58);*/
		
		
	}
	
	private function reset() {
		timer.reset();
	}
}
