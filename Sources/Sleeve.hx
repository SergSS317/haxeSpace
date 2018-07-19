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
	var StarsInSleeve:Float = 0;		//звезд создано
	var SeedSleeve:Int;					//сид генерации данного рукава
	public var stars: Array<Star>;		//список звезд рукава
	
	public var drawning:Drawning;
	public var drawning2:Drawning;
	
	public function new(starCount:Int, speenPower:Float, speenRotate:Float) 
	{
		stars = new Array<Star>();
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		StarsInSleeve = 0;
		
		drawning = new Drawning(Assets.images.ImgData);
		drawning.UdateColor = true;
		drawning.UdateUV = true;
		drawning.UdateVertex = true;
		drawning.update();
		
		drawning2 = new Drawning(Assets.images.ImgData);
		drawning2.UdateColor = true;
		drawning2.UdateUV = true;
		drawning2.UdateVertex = true;
		drawning2.update();
	}

	public function AddStars( count:Int)
	{
		

		for ( i in 0...count)
		{
			AddStar();
		}
		//trace("Add in sleeve " + SeedSleeve+" count=" + count+" remain="+StarsInSleeve+" / "+stars.length);
		//StarCount += count;
	}
	
	//рассчет позиции звезды с вызовом ее создания
	public function AddStar():Void			
	{
		//StarCount ++;
		var xStarPosition = 0.0;
		var yStarPosition = 0.0;
		var t = (StarsInSleeve) * 0.00016;//угол поворота(шаг между звездами)0.00008
		var rnd:Float = 0.0;
	
		rnd = Random.RndIter3(1.04, 0, SeedSleeve, StarsInSleeve);
		//rnd = Random.RndIter2(0.519, -0.519, SeedSleeve, StarsInSlave);

		xStarPosition = 5000.0 * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd+t);
		yStarPosition = 5000.0 * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd+t);

		StarsInSleeve++;
		PastStar( xStarPosition, yStarPosition);
	}
	
	public function RemoveStars(count:Int)
	{
		
		for (i in 0...count)
		{
			RemoveStar();
		}
		trace("remove in sleeve " + SeedSleeve+" count=" + count+" remain="+StarsInSleeve+" / "+stars.length);
	}
	
	public function RemoveStar2()
	{
		var e = stars.length;
		destroyStarBuf(stars[e-1]);
		//stars[e-1].destroy();
		stars.splice(e-1, 1);
		Star.TotalCount--;
		StarsInSleeve--;
	}
	
	public function destroyStarBuf(_star:Star)
	{
		drawning.uvs.splice(_star.Sprt.id * 12, 12);
		drawning.colors.splice(_star.Sprt.id*24, 24);
		drawning.vertices.splice(_star.Sprt.id * 18, 18);
		drawning.FreeId(_star.Sprt.id);
//trace("destroy -->"+Base.drawning.vertices.length+" - " +Sprt.id);
		drawning2.uvs.splice(_star.SprtFlare.id*12, 12);
		drawning2.colors.splice(_star.SprtFlare.id*24, 24);
		drawning2.vertices.splice(_star.SprtFlare.id * 18, 18);
		drawning2.FreeId(_star.SprtFlare.id);
	}
	
	public function RemoveStars2(count:Int)
	{
		var e = stars.length;
		
		while (e-->stars.length-count)
		{
	//		stars[e].destroy();
		}
	//	trace("Befor: "+ Base.drawning.uvs.length+"("+(Base.drawning.uvs.length/12)+") / "+Base.drawning.colors.length+"("+(Base.drawning.colors.length/24)+") / "+Base.drawning.vertices.length+"("+(Base.drawning.vertices.length/18)+")");
		drawning.uvs.splice((e+1) * 12, count * 12);
		drawning.colors.splice((e+1) *24, count * 24);
		drawning.vertices.splice((e+1) * 18, count * 18);
		drawning2.uvs.splice((e+1) * 12, count * 12);
		drawning2.colors.splice((e+1) *24, count * 24);
		drawning2.vertices.splice((e+1) * 18, count * 18);
		
		stars.splice(e+1, count);
		StarsInSleeve-=count;
		
		trace("drawbufs.l: "+drawning.vertices.length+" - "+stars.length+" / "+StarsInSleeve);
	}
	
	//удаление последней звезды
	function RemoveStar():Void
	{
		var e = stars.length;
	//	stars[e-1].destroy();
		stars.splice(e-1, 1);
		StarsInSleeve--;
	}
	
	//создание звезды и ее установка в координаты учитывая шансы
	function PastStar( x:Float, y:Float):Void		
	{
		var Chance:Float = Math.abs(Math.sin(x))*XmlControl.StarPrototipe.ChanceCounter;
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				stars.push(new Star(new Vector3(x,y,0), XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize, XmlControl.starPrototypes[i].stLight,drawning,drawning2));
			}
		}
	}
	
	public function update(): Void 
	{
		
		for ( star in  stars)
		{
			star.update();
		} 
		drawning2.update();
	}
	
	public function render(g:Graphics)
	{
		if (drawning != null){ drawning.render(g); }
		if (drawning2 != null){ drawning2.render(g); }
	}
}