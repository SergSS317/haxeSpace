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
	public var Sprt:Sprite;			//для отрисовки
	public var SprtFlare:Sprite;			//для отрисовки
	
	//public var image: Image;		//сама картинка звезды
	//public var flare: Image;		//спрайт светимости
	public var UnderFlare: Image;	//спрайт цвета по краям звезды
	public var color:Color;			//цвет звезды
	public var FlareColor:Color;			//цвет звезды
	
	public var Light:Float;			//светимость
	public var Size:Float;			//размер
	
	public var x: Float;
	public var y: Float;

	public var StarRect:Rect = new Rect(0, 0, 0, 0);	//центрирование звезды
	public var FlareRect:Rect = new Rect(0, 0, 0, 0);		//центрирование спрайта светимости
	
	
	
	var tx = 0.0;
	var ty = 0.0;

	public static var TotalCount:Int = 0;					//счетчик звезд
	
	public function new(x: Float, y: Float, color:Color, size:Float, light:Float ) {

		this.UnderFlare = Assets.images.UnderFlare;
		this.Size = size * Random.Rnd2(2.0, 0.5, Galaxy.Seed)*0.4;
		this.x = x;
		this.y = y;
		this.Light = light * Random.Rnd2(2.0, 0.5, Galaxy.Seed);
		this.color = color;
		StarRect.Recalc(x - Size / 2, y - Size / 2, Size, Size);

		var star_uvs:Array<Float> = [0, 0,  0, 1,  0.5,1,  0,0,  0.5,0,  0.5,1];
		var flare_uvs:Array<Float> = [0.5, 0,  0.5, 1,  1,1,  0.5,0,  1,0,  1,1];
		Sprt = new Sprite( new Vector3(this.x, this.y, 0), new Vector3(1.1, 1.1, 1.1),star_uvs );
		SprtFlare = new Sprite( new Vector3(this.x, this.y, 0), new Vector3(1.1, 1.1, 1.1),flare_uvs);

		TotalCount++;
	}

	public function update(): Void {
		CalcDrawPosition(); 
	}

	//public function render(g: Graphics):Void {  }
	//var tempScaleFlare:Float = 1.0;
	
	var scaleflare:Float = 0.0;//рассчетный размер для светимости зависящий от zoom
	var Alphaflare:Float = 1.0;
	function CalcDrawPosition(): Void {
			scaleflare = Light * Camera.zoom/100;// tempScaleFlare / Camera.zoom;
			SprtFlare.Size = new Vector3(scaleflare, scaleflare, 0);
			Alphaflare = 5 * Camera.zoom / Camera.maxzoom;
			if (Alphaflare > 1.0) Alphaflare = 1.0;
			SprtFlare.color.A = Alphaflare;
			//SprtFlare.UpdateColor();
			//SprtFlare.update();

	}	
}
