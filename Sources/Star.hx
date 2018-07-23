package;

import kha.math.Vector3;
import kha.Color;

class Star {
	public var Light:Float;						//светимость
	public var Size:Float;						//размер

	public var Sprt:Entity;							//спрайт звезды
	public var SprtFlare:Entity;						//спрайт светимости
	
	public static var TotalCount:Int = 0;		//счетчик звезд
	
	public function new(_pos:Vector3, color:Color, size:Float, light:Float, drb:Drawning, drb2:Drawning) :Void
	{
		this.Size = size * Random.Rnd2(2.0, 0.5, Galaxy.Seed)*0.1;
		this.Light = light * Random.Rnd2(2.0, 0.5, Galaxy.Seed);

		var star_uvs:Array<Float> = [0, 0,  0, 1,  0.5,1,  0,0,  0.5,0,  0.5,1];
		var flare_uvs:Array<Float> = [0.5, 0,  0.5, 1,  1,1,  0.5,0,  1,0,  1,1];
		Sprt = new Entity( new Vector3(  _pos.x, _pos.y, 0), color, this.Size, drb, star_uvs  );
		SprtFlare = new Entity( new Vector3( _pos.x, _pos.y, 0), color, 1.1, drb2, flare_uvs,false);//Base.drawning2

		TotalCount++;
	}

	var old_scaleFlare:Float = 0;
	public function update(): Void
	{
		SprtFlare.Size = Light / 5000 * Base.camera.zoom;
		if (SprtFlare.Size != old_scaleFlare)
		{
			old_scaleFlare = SprtFlare.Size;
			SprtFlare.UpdateVert();
		}
	}

}
