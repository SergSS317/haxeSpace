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
	
	var drawning:Drawning;
	var drawning2:Drawning;
	
	public function new(starCount:Int, speenPower:Float, speenRotate:Float) 
	{
		stars = new Array<Star>();
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		
		drawning = new Drawning(Assets.images.ImgData, 90);
		drawning.UpdateAllBuff = true;
		drawning2 = new Drawning(Assets.images.ImgData,90);
		drawning2.UpdateAllBuff = true;
	}

	public function AddStars( count:Int)
	{
		drawning.CreateNewVertexBufer((stars.length + count)*6);
		drawning2.CreateNewVertexBufer((stars.length + count)*6);

		for ( i in 0...count) { AddStar(); }
		trace("Add in sleeve " + SeedSleeve+" count=" + count + " remain=" + stars.length);
		drawning.UpdateAllBuff = true;
		drawning2.UpdateAllBuff = true;
	}
	
	//рассчет позиции звезды, создание звезды и ее установка в координаты учитывая шансы
	function AddStar():Void			
	{
		var SP = Random.CalcStarPosition(SpeenPower, SpeenRotate, stars.length, SeedSleeve);
		
		var Chance:Float = Math.abs(Math.sin(SP.x))*XmlControl.StarPrototipe.ChanceCounter;
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				stars.push(new Star(new Vector3(SP.x,SP.y,0), XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize, XmlControl.starPrototypes[i].stLight,drawning,drawning2));
			}
		}
	}

	public function update(): Void 
	{
		for ( star in  stars) { star.update(); } 

		drawning.update();
		drawning2.UpdateVertex = true;
		drawning2.update();
	}
	
	public function render(g:Graphics)
	{
		if (drawning != null){ drawning.render(g); }
		if (drawning2 != null){ drawning2.render(g); }
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