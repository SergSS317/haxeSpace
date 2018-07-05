package;

import kha.Framebuffer;
import kha.math.FastVector4;
import kha.math.Vector2;
import kha.math.Vector4;

//import kha.graphics4.PipelineState;
import kha.graphics2.Graphics;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Color;
import kha.Assets;
class Star {
	public var image: Image;
	public var flare: Image;
	public var UnderFlare: Image;
	
	public var x: Float;
	public var y: Float;
	public var color:Color;
	public var Light:Float;
	public var Size:Float;
	
	var scalestar = 0.0;
	var scaleflare:Float = 0.0;
	var tx = 0.0;
	var ty = 0.0;
	public var PosFl:Vector4= new Vector4(0, 0, 0, 0);
	public var PosStar:Vector4= new Vector4(0, 0, 0, 0);
	public var Randomize:Float = 0.1;
	public static var TotalCount:Int = 0;
	
	public function new(x: Float, y: Float, color:Color, size:Float, light:Float ) {
		//System.notifyOnRender(render);
		
		this.image = Assets.images.star3;
		this.flare = Assets.images.Light3;
		this.UnderFlare = Assets.images.UnderFlare;
		//this.flare = Assets.images.lightj;
		this.Size = size * Random.Rnd2(2.0, 0.5, Galaxy.Seed);
		//trace(this.Size);
		this.x = x;
		this.y = y;
		this.Light = light * Random.Rnd2(2.0, 0.5, Galaxy.Seed);
		this.color = color;
		TotalCount++;
		
		/*if ((Math.round(x / 100 + y / 100 * 100) > 1700))
		{
		trace(Math.round(x / 100 + y / 100 * 100));
		}
		trace(Base.Sector.length+"["+Math.round(x / 100 + y / 100 * 100)+"]");
		Base.Sector[Math.round(x/100 + y/100 * 100)].Stars.push(this);*/
		//Base.Sector[Math.round(x/100 + y/100 * 100)].Stars.push(this);
		//Base.Sector[Math.round(x + y * 100)].Stars.insert(Base.Sector[Math.round(x + y * 100)].Stars.length,this);
	}

	public function update(): Void {
		CalcDrawPosition();
	}


	
	public function render(g: Graphics): Void {

	}
	
	
	function CalcDrawPosition(): Void {
		
		if (Camera.ZoomChanged)
		{
		//tx = x * Camera.zoom;
		//ty = y * Camera.zoom;
		//scalestar = Camera.zoom / 20 * Size;
		//scalestar = Size * 1;
		//scaleflare = 1 / Math.exp(Camera.zoom * 0.001)  * (Light * 25);
		//scaleflare = Light*Camera.ScaleFlare;
		//scaleflare = 1 / Math.exp(Camera.zoom*Camera.zoom)  * (Light*50);
		scaleflare = 1 / (Camera.zoom*1.2)  * (Light*20);
		//trace("scaleflare: " + scaleflare);
		//trace("L: "+Light+"   CZ: "+Camera.zoom+"   EXP: "+Math.exp(Camera.zoom));
		//PosFl = new Vector4(tx - scaleflare / 2, ty - scaleflare / 2, scaleflare, scaleflare);
		PosFl = new Vector4(x - scaleflare / 2, y - scaleflare / 2, scaleflare, scaleflare);
		//PosStar = new Vector4( tx - scalestar / 2, ty - scalestar / 2, scalestar, scalestar);
		PosStar = new Vector4(x - Size / 2, y - Size / 2, Size, Size);
		//scalestar = Camera.zoom / 20;
		//scaleflare = Camera.zoom / 20 * Light;
		}
	}
	
	/*public function CalcDrawPosition(g: Graphics): Void {
		
		if (Camera.ZoomChanged)
		{
		tx = x * Camera.zoom;
		ty = y * Camera.zoom;
		scalestar = Camera.zoom / 20 * Size;
		
		scaleflare = 1/Math.exp(Camera.zoom*0.001)  * (Light * 25);
		PosFl = new Vector4(tx - scaleflare / 2, ty - scaleflare / 2, scaleflare, scaleflare);
		PosStar = new Vector4( tx-scalestar/2, ty-scalestar/2, scalestar, scalestar);
		scalestar = Camera.zoom / 20;
		scaleflare = scalestar * Light;
		}
	}*/
	
	
}
