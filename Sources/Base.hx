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

	public static var AllSprites:Array<Entity>;
	//public static var Sector:Array<Sectors>;
	private var controls: Controls;
	private var uiController: UiController;
	public static var myMouse:MouseControl;
	
	public static var camera: Camera;
	private var set3d:Set3d;
	
	private var timer: Timer;
	private var MyXml:XmlControl;
	public static var galaxy:Galaxy;
	
	public static var drawningOther:Drawning;
	public var SprtBG:Entity;			//для отрисовки
	public var SprtCentr:Entity;
	
	public function new() {	
		Assets.loadEverything(loadingFinished);
	}
	
	
	private function loadingFinished(): Void 
	{
		trace("Start load");
		MyXml = new XmlControl();
		camera = new Camera(0, 0);
		set3d = new Set3d();
		myMouse = new MouseControl();
		controls = new Controls();
		timer = new Timer();
		uiController = new UiController();
		
		drawningOther = new Drawning(Assets.images.fon2,90);
		
		galaxy = new Galaxy(XmlControl.galaxySettings.starCount, XmlControl.galaxySettings.galaxySleeve, XmlControl.galaxySettings.speenPower, XmlControl.galaxySettings.Seed);
		
		/*Sector = new Array<Sectors>();
		for ( j in 0...100)
		{
			for ( i in 0...100)
			{
				Sector.insert(i+j*100,new Sectors(new Vector2(i, j)));
			}
		}*/

		SprtBG = new Entity( new Vector3(0, 0, 0), Color.fromFloats(0.1,0.1,0.5,0.5), 100000, Base.drawningOther, [0, 0,  0, 1,  1, 1,  0, 0,  1, 0,  1, 1]);
		SprtBG.isStatic = true;
		SprtCentr = new Entity( new Vector3(0, 0, 0), Color.fromFloats(0.8,0.8,1.0,1.0), 9000, Base.drawningOther, [0, 0,  0, 1,  1, 1,  0, 0,  1, 0,  1, 1]);
		SprtCentr.isStatic = true;
		drawningOther.UpdateAllBuff = true;
		SprtBG.update();
		SprtCentr.update();
		drawningOther.update();
		
		Scheduler.addTimeTask(update, 0, 1 / 20);
		trace("End load");
	}

	function update(): Void {
		timer.update();
		camera.update(controls, timer.deltaTime);
		uiController.update();
		galaxy.update();
	}

	public function render(frame:Framebuffer) {
		
		// A graphics object which lets us perform 3D operations
		var g = frame.g4;

        g.begin();												// Begin rendering
		g.clear(Color.fromFloats(0.0, 0.0, 0.0), 1.0);			// Clear screen
		if (drawningOther != null){ drawningOther.render(g); }	//draw BG
		if (galaxy != null)galaxy.render(g);					//draw galaxy
		if (uiController != null)uiController.render(frame.g2);	//draw UI
		g.end();												// End rendering
    }

	private function reset() {
		timer.reset();
	}
}
