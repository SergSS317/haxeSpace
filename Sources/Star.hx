package;

//import js.html.RecordErrorEvent;
import kha.Framebuffer;
import kha.math.FastVector4;
import kha.math.Vector2;
import kha.math.Vector3;
import kha.math.Vector4;
//import kha.graphics4.PipelineState;
import kha.graphics4.Graphics;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Color;
import kha.Assets;
class Star {
	public var Sprt:Sprite;
	public var image: Image;		//сама картинка звезды
	public var flare: Image;		//спрайт светимости
	public var UnderFlare: Image;	//спрайт цвета по краям звезды
	public var color:Color;			//цвет звезды
	public var FlareColor:Color;			//цвет светимости
	
	public var Light:Float;			//светимость
	 var Size:Float;			//размер
	
	//public var Position:Vector3;
	
	public var x: Float;
	public var y: Float;

	//public var StarRect:Rect = new Rect(0, 0, 0, 0);	//центрирование звезды
	//public var FlareRect:Rect = new Rect(0, 0, 0, 0);		//центрирование спрайта светимости
	
	var scaleflare:Float = 0.0;//рассчетный размер для светимости зависящий от zoom
	
	//var tx = 0.0;
	//var ty = 0.0;

	public static var TotalCount:Int = 0;					//счетчик звезд
	
	public function new(x: Float, y: Float, color:Color, _size:Float, light:Float ) {
		this.image = Assets.images.star3;
		this.flare = Assets.images.Light13;
		this.UnderFlare = Assets.images.UnderFlare;
		var size = _size * Random.Rnd2(2.0, 0.5, Galaxy.Seed)*0.4;

		this.Light = light * Random.Rnd2(2.0, 0.5, Galaxy.Seed);
		this.color = color;
		//StarRect.Recalc(x - Size / 2, y - Size / 2, Size, Size);
		//trace("star3:"+this.image+"   -   "+Assets.images.star3);
		Sprt = new Sprite(this.image, new Vector3(x, y, 0), new Vector3(size, size, size));
		//tempScaleFlare=(Light*1)/1.3;
		TotalCount++;
		//Base.galxy.AllStars.push(this);
	}

	public function getStarSize():Float { return Sprt.Size.x; }
	
	public function update(): Void {//CalcDrawPosition(); 
		
	}

	public function render(g:Graphics): Void 
	{
		Sprt.render(g);
	}
	
	var tempScaleFlare:Float = 1.0;
	

}
