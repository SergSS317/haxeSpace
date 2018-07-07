package;

/**
 * ...
 * @author ...
 */
import kha.Framebuffer;
import kha.Image;
import kha.Font;
import kha.Color;


import kha.input.Mouse;


import kha.graphics2.Graphics;
import kha.Assets;
import kha.Scaler;
import kha.Scheduler;
import kha.System;
import kha.math.FastMatrix3;

class UiController 
{
	//public var UIbuffer: Image;
	public var font:Font;
	public var previousRealTime:Float;
    public var realTime:Float;
	public var uiButton:Button;
	
	
	public function new() 
	{
		//UIbuffer = Image.createRenderTarget(800, 600);
		
		font = Assets.fonts.kenpixel_mini_square;

		previousRealTime = 0.0;
        realTime         = 0.0;
		
		uiButton = new Button(100, 100, 128, 256, Color.Pink);
		Mouse.get().notify(onMouseDown, null, null, null);
	}
	
	
	var tfps: Float = 0;
	var fps:Float = 0;

	public function update(): Void {
		previousRealTime = realTime;
	}


	public function render(g: Graphics): Void {


   // var g = UIbuffer.g2;

    // clear and draw to our backbuffer
    //g.begin();
	g.transformation = FastMatrix3.scale(1,1);
		g.font = font;
		g.fontSize = 20;
		g.color = Color.White;
		g.drawString("Stars count: " + Base.stars.length +" ( "+Star.TotalCount+" );", 10, 10);
		realTime = Scheduler.realTime();
		fps = Math.round( 1.0 / ( realTime - previousRealTime )*10.0)/10.0;
		if (fps != Math.POSITIVE_INFINITY && fps < 500) tfps = fps;
		g.drawString("FPS: " + tfps + " ;", 10, 30);
		
		//g.drawString("FPS: " + realTime , 10 - camera.aX, 70 - camera.aY);
		//g.drawString("FPS:  - "+previousRealTime, 10 - camera.aX, 100 - camera.aY);
		g.drawString("Delta Time: " + ( realTime - previousRealTime ), 10, 50);	
		g.drawString("Zoom: " + Camera.zoom + " ;", 10, 70);
		uiButton.render(g);
		//g.drawString("zoomspeed: " + Camera.zoomspeed + " ;", 10, 90);
		//g.drawString("cX: " + Camera.aX+"   cY: "+Camera.aY, 10, 90);	
		//trace("Test");
  //  g.end();


  }
  
  public function onMouseDown(button:Int, x:Int, y:Int){
		uiButton.onMouseDown(button, x, y);
	}
	
}