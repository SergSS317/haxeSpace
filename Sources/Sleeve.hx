package;

/**
 * ...
 * @author ...
 */
import kha.graphics4.Graphics;
import kha.Color;
import kha.math.Vector3;
import kha.Assets;
class Sleeve 
{
	var SpeenPower:Float = 0;			//спин
	var SpeenRotate:Float = 0;			//спин
	//var StarsInSleeve:Int = 0;		//звезд создано
	var SeedSleeve:Int;					//сид генерации данного рукава
	public var stars: Array<Star>;		//список звезд рукава
	
	var drawning:DravningAdapter;
	var drawning2:DravningAdapter;
	public static var MaxCoord:Float = 0; //максимальные координаты для перерассчета максимального зума
	public function new(starCount:Int, speenPower:Float, speenRotate:Float) 
	{
		stars = new Array<Star>();
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		
		drawning = new DravningAdapter(Assets.images.ImgData);
		//drawning.UpdateAllBuff = true;
		drawning2 = new DravningAdapter(Assets.images.ImgData);
		//drawning2.UpdateAllBuff = true;
	}

	public function AddStars( count:Int):Void
	{
		drawning.CreateNewVertexBuffer((stars.length + count)*6);
		drawning2.CreateNewVertexBuffer((stars.length + count)*6);

		for ( i in 0...count) { AddStar(); }
	//	trace("Add in sleeve " + SeedSleeve+" count=" + count + " remain=" + stars.length);
		//drawning.UpdateAllBuff = true;
		//drawning2.UpdateAllBuff = true;
	}
	
	
	//рассчет позиции звезды, создание звезды и ее установка в координаты учитывая шансы
	function AddStar():Void			
	{
		var SP = Random.CalcStarPosition(SpeenPower, SpeenRotate, stars.length, SeedSleeve);
		if (Math.abs(SP.y) > MaxCoord) MaxCoord = Math.abs(SP.y);
		if (Math.abs(SP.x) > MaxCoord) MaxCoord = Math.abs(SP.x);
		var Chance:Float = Math.abs(Math.sin(SP.x))*XmlControl.StarPrototipe.ChanceCounter;
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				stars.push(new Star(new Vector3(SP.x,SP.y,0), XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize, XmlControl.starPrototypes[i].stLight,drawning,drawning2));
			}
		}
	}
	
	var cnt = 0;
	var speedStarShow = 10;
	public function update(): Void 
	{
		for ( star in  stars) {
			cnt++; if (cnt > speedStarShow) cnt = 0;					//для интересного эффекта
			if ((star.Id+cnt) % speedStarShow == 0)			// плавного появления звезд - ну и малая оптимизация))
			{
				star.update(); 
			}
		} 
		//drawning.update();
		drawning2.UpdateVertexBufs();
		
	}
	
	public function render(g:Graphics)
	{
		drawning.render(g);
		drawning2.render(g);
	}
	
	/*public function RemoveStar2()
	{
		var e = stars.length;
		destroyStarBuf(stars[e-1]);
		stars.splice(e-1, 1);
		Star.TotalCount--;
	}
	
	public function destroyStarBuf(_star:Star)
	{
		drawning.uvs.splice(_star.Sprt.id * 12, 12);
		drawning.colors.splice(_star.Sprt.id*24, 24);
		drawning.vertices.splice(_star.Sprt.id * 18, 18);
		drawning.IdEntity--;
		drawning2.uvs.splice(_star.SprtFlare.id*12, 12);
		drawning2.colors.splice(_star.SprtFlare.id*24, 24);
		drawning2.vertices.splice(_star.SprtFlare.id * 18, 18);
		drawning2.IdEntity--;
	}*/
}