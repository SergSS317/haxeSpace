package;

//import js.html.RecordErrorEvent;
import kha.Framebuffer;
import kha.math.FastVector4;
import kha.math.Vector2;
import kha.math.Vector3;
import kha.math.Vector4;
//import kha.graphics4.PipelineState;
import kha.graphics2.Graphics;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Color;
import kha.Assets;
class Star {
	public var Sprt:Entity;			//для отрисовки
	public var SprtFlare:Entity;			//для отрисовки
	
	//public var image: Image;		//сама картинка звезды
	//public var flare: Image;		//спрайт светимости
	//public var UnderFlare: Image;	//спрайт цвета по краям звезды
	//public var color:Color;			//цвет звезды
//public var FlareColor:Color;			//цвет звезды
	
	public var Light:Float;			//светимость
	public var Size:Float;			//размер
	
	public var x: Float;
	public var y: Float;

	//public var StarRect:Rect = new Rect(0, 0, 0, 0);	//центрирование звезды
	//public var FlareRect:Rect = new Rect(0, 0, 0, 0);		//центрирование спрайта светимости
	
	
	
	//var tx = 0.0;
	//var ty = 0.0;

	public static var TotalCount:Int = 0;					//счетчик звезд
	
	public function new(x: Float, y: Float, color:Color, size:Float, light:Float ) {

		//this.UnderFlare = Assets.images.UnderFlare;
		this.Size = size * Random.Rnd2(2.0, 0.5, Galaxy.Seed)*0.4;
		this.x = x;
		this.y = y;
		this.Light = light * Random.Rnd2(2.0, 0.5, Galaxy.Seed);
		//this.color = color;
		//StarRect.Recalc(x - Size / 2, y - Size / 2, Size, Size);

		var star_uvs:Array<Float> = [0, 0,  0, 1,  0.5,1,  0,0,  0.5,0,  0.5,1];
		var flare_uvs:Array<Float> = [0.5, 0,  0.5, 1,  1,1,  0.5,0,  1,0,  1,1];
		Sprt = new Entity( new Vector3(this.x, this.y, 0), color, 1.1, Base.drawning, star_uvs  );
		Sprt.isStaic = true;
		SprtFlare = new Entity( new Vector3(this.x, this.y, 0), color, 1.1, Base.drawning2, flare_uvs);//Base.drawning2
		SprtFlare.isStaic = false;
		TotalCount++;
		
		tempLight = Light/5000;
	}

	public function update(): Void {
		CalcDrawPosition(); 
		//trace("11111");
	}

	public function destroy()
	{
		trace("Star Destroy");
		Sprt.remove();
		SprtFlare.remove();
		
		/*var drawbufs = Base.drawning;
		
		for (i in 0...18) drawbufs.vertices.push(0.0);
		for(i in 0...12) drawbufs.uvs.push(0.0);
		for (i in 0...24) drawbufs.colors.push(0.0);
		drawbufs2 = Base.drawning;
		for (i in 0...18) drawbufs.vertices.push(0.0);
		for(i in 0...12) drawbufs.uvs.push(0.0);
		for(i in 0...24) drawbufs.colors.push(0.0);*/
	}
	//public function render(g: Graphics):Void {  }
	//var tempScaleFlare:Float = 1.0;
	
	public var scaleflare:Float = 0.0;//рассчетный размер для светимости зависящий от zoom
	//var old_scaleflare:Float = 0.0;//рассчетный размер для светимости зависящий от zoom
	var Alphaflare:Float = 1.0;
	
	var tempLight:Float;
	function CalcDrawPosition(): Void {
		//var ttt = Math.log(Camera.zoom * tempLight);
		////ttt *= ttt;
		//if (ttt < 1) ttt = 0; 
		//scaleflare = ttt;
		
		//scaleflare = Math.log( 10000*tempLight / Camera.zoom);
		//trace("scaleflare:"+scaleflare);
		//scaleflare = Math.log(tempLight + 1) * Math.log(Camera.zoom + 1);// * (Camera.zoom / 1000) / (tempLight / 1000);
			scaleflare = tempLight * Camera.zoom;// tempScaleFlare / Camera.zoom;
			//if (scaleflare > 1000) scaleflare = 1000;
			//new Vector3(scaleflare, scaleflare, 0);
			//SprtFlare.Size.y = scaleflare;
			
			/*Alphaflare = 1000 * Camera.ZoomKoef;
			if (Alphaflare > 1.0) Alphaflare = 1.0;
			SprtFlare.color.A = Alphaflare;*/
			
			
			
			//SprtFlare.color.A = 1.0;
			//SprtFlare.UpdateColor();
			SprtFlare.Size = scaleflare;
			
			Sprt.update();
			
			SprtFlare.update(); 
			//SprtFlare.isStaic = false;
	//if (old_scaleflare != scaleflare){ SprtFlare.update(); SprtFlare.isStaic = false;}else SprtFlare.isStaic = true;
	//SprtFlare.isStaic = false;
	//SprtFlare.update(); SprtFlare.isStaic = false;
			//old_scaleflare = scaleflare;
			

	}	
}
