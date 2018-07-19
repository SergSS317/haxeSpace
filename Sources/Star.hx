package;

import kha.math.Vector3;
import kha.Color;

class Star {
	public var Light:Float;						//светимость
	public var Size:Float;						//размер

	public static var TotalCount:Int = 0;		//счетчик звезд

	public var Sprt:Entity;							//спрайт звезды
	public var SprtFlare:Entity;						//спрайт светимости
	
	public function new(_pos:Vector3, color:Color, size:Float, light:Float, drb:Drawning, drb2:Drawning) :Void
	{
		this.Size = size * Random.Rnd2(2.0, 0.5, Galaxy.Seed)*0.4;
		this.Light = light * Random.Rnd2(2.0, 0.5, Galaxy.Seed);

		var star_uvs:Array<Float> = [0, 0,  0, 1,  0.5,1,  0,0,  0.5,0,  0.5,1];
		var flare_uvs:Array<Float> = [0.5, 0,  0.5, 1,  1,1,  0.5,0,  1,0,  1,1];
		Sprt = new Entity( new Vector3(  _pos.x, _pos.y, 0), color, 1.1, drb, star_uvs  );
		SprtFlare = new Entity( new Vector3( _pos.x, _pos.y, 0), color, 1.1, drb2, flare_uvs,false);//Base.drawning2

		TotalCount++;
	}

	public function update(): Void
	{
		SprtFlare.SetSize(Light/5000 * Camera.zoom);
	}

	/*public function destroy():Void
	{

		drawning.uvs.splice(Sprt.id * 12, 12);
		drawning.colors.splice(Sprt.id*24, 24);
		drawning.vertices.splice(Sprt.id * 18, 18);
		drawning.FreeId(Sprt.id);
//trace("destroy -->"+Base.drawning.vertices.length+" - " +Sprt.id);
		drawning2.uvs.splice(SprtFlare.id*12, 12);
		drawning2.colors.splice(SprtFlare.id*24, 24);
		drawning2.vertices.splice(SprtFlare.id * 18, 18);
		drawning2.FreeId(SprtFlare.id);
		
		//Sprt.removeAllBufs();
		//SprtFlare.removeAllBufs();
		TotalCount--;
	}*/

}
