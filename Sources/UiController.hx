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
	public var AddStars1000_btn:Button;
	public var AddStars10000_btn:Button;
	public var RemoveStars1000_btn:Button;
	public var RemoveStars10000_btn:Button;

	
	public function new() 
	{
		//UIbuffer = Image.createRenderTarget(800, 600);
		
		font = Assets.fonts.kenpixel_mini_square;

		previousRealTime = 0.0;
        realTime         = 0.0;
		
		AddStars10000_btn = new Button(10, 512, 100, 32, Color.Blue,"+10k stars");
		AddStars10000_btn.onClick = AddStars10000;
		AddStars1000_btn = new Button(120, 512, 100, 32, Color.Blue,"+1k stars");
		AddStars1000_btn.onClick = AddStars1000;

		RemoveStars1000_btn = new Button(230, 512, 100, 32, Color.Blue,"-1k stars");
		RemoveStars1000_btn.onClick = RemoveStars1000;
		RemoveStars10000_btn = new Button(340, 512, 100, 32, Color.Blue,"-10k stars");
		RemoveStars10000_btn.onClick = RemoveStars10000;
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
		g.drawString("Stars count: " + Star.TotalCount+" ;", 10, 10);
		realTime = Scheduler.realTime();
		fps = Math.round( 1.0 / ( realTime - previousRealTime )*10.0)/10.0;
		if (fps != Math.POSITIVE_INFINITY && fps < 500) tfps = fps;
		g.drawString("FPS: " + tfps + " ;", 10, 30);
		
		//g.drawString("FPS: " + realTime , 10 - camera.aX, 70 - camera.aY);
		//g.drawString("FPS:  - "+previousRealTime, 10 - camera.aX, 100 - camera.aY);
		g.drawString("Delta Time: " + ( realTime - previousRealTime ), 10, 50);	
		g.drawString("Zoom: " + Camera.zoom + " ;", 10, 70);
		AddStars1000_btn.render(g);
		AddStars10000_btn.render(g);
		RemoveStars1000_btn.render(g);
		RemoveStars10000_btn.render(g);
		//g.drawString("zoomspeed: " + Camera.zoomspeed + " ;", 10, 90);
		g.drawString("cX: " + Camera.aX+"   cY: "+Camera.aY, 10, 90);	
		//trace("Test");
  //  g.end();


  }
  
  public function onMouseDown(button:Int, x:Int, y:Int){
		AddStars1000_btn.onMouseDown(button, x, y);
		AddStars10000_btn.onMouseDown(button, x, y);
		RemoveStars1000_btn.onMouseDown(button, x, y);
		RemoveStars10000_btn.onMouseDown(button, x, y);
	}
	
	public function AddStars1000(){
		Base.galxy.AddStars(1000);
	}
	public function AddStars10000(){
		Base.galxy.AddStars(10000);
	}
	public function RemoveStars1000(){
		Base.galxy.RemoveStars(1000);
	}
	public function RemoveStars10000(){
		Base.galxy.RemoveStars(10000);
	}
}