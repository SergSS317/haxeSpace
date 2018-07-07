package;

//import js.html.RecordErrorEvent;
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
	public var image: Image;		//сама картинка звезды
	public var flare: Image;		//спрайт светимости
	public var UnderFlare: Image;	//спрайт цвета по краям звезды
	public var color:Color;			//цвет звезды
	public var Light:Float;			//светимость
	public var Size:Float;			//размер
	
	public var x: Float;
	public var y: Float;


	public var StarRect:Rect = new Rect(0, 0, 0, 0);
	public var FlareRect:Rect=new Rect(0,0,0,0);
	//var scalestar = 0.0;
	var scaleflare:Float = 0.0;//рассчетный размер для светимости зависящий от zoom
	
	var tx = 0.0;
	var ty = 0.0;
	//public var PosFl:Vector4= new Vector4(0, 0, 0, 0);		//центрирование спрайта светимости
	//public var PosStar:Vector4= new Vector4(0, 0, 0, 0);	//центрирование звезды
	//public var Randomize:Float = 0.1;
	public static var TotalCount:Int = 0;					//счетчик звезд
	
	public function new(x: Float, y: Float, color:Color, size:Float, light:Float ) {
		this.image = Assets.images.star3;
		this.flare = Assets.images.Light3;
		this.UnderFlare = Assets.images.UnderFlare;
		this.Size = size * Random.Rnd2(2.0, 0.5, Galaxy.Seed);
		this.x = x;
		this.y = y;
		this.Light = light * Random.Rnd2(2.0, 0.5, Galaxy.Seed);
		this.color = color;
		StarRect.Recalc(x - Size / 2, y - Size / 2, Size, Size);
		/*asx = x - Size / 2;
		asy = y - Size / 2;
		asw = Size;
		ash = Size;*/
		
		//PosStar = new Vector4(x - Size / 2, y - Size / 2, Size, Size);
		tempScaleFlare=(Light*20)/1.2;
		TotalCount++;
	}

	public function update(): Void { CalcDrawPosition(); }

	public function render(g: Graphics): Void {  }
	
	var tempScaleFlare:Float = 1.0;
	/*public var ax:Float = 0;
	public var ay:Float = 0;
	public var aw:Float = 0;
	public var ah:Float = 0;
	public var asx:Float = 0;
	public var asy:Float = 0;
	public var asw:Float = 0;
	public var ash:Float = 0;*/
	function CalcDrawPosition(): Void {
		
		if (Camera.ZoomChanged)
		{
			scaleflare = tempScaleFlare / Camera.zoom;
			FlareRect.Recalc(x - scaleflare / 2, y - scaleflare / 2, scaleflare, scaleflare);
			/*StarRect.x = x - scaleflare / 2;
			StarRect.y = y - scaleflare / 2;
			StarRect.w = scaleflare;
			StarRect.h = scaleflare;*/
			/*ax = x - scaleflare / 2;
			ay = y - scaleflare / 2;
			aw = scaleflare;
			ah = scaleflare;*/
		//	PosFl = new Vector4(x - scaleflare / 2, y - scaleflare / 2, scaleflare, scaleflare);
		}
	}	
}
