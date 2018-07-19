package;

/**
 * ...
 * @author ...
 */
import kha.graphics2.Graphics;
import kha.Color;
import kha.math.Vector3;
class Sleeve 
{
	var SpeenPower:Float = 0;			//спин
	var SpeenRotate:Float = 0;			//спин
	var StarsInSleeve:Float = 0;		//звезд создано
	var SeedSleeve:Int;					//сид генерации данного рукава
	public var stars: Array<Star>;		//список звезд рукава
	
	
	public function new(starCount:Int, speenPower:Float, speenRotate:Float) 
	{
		stars = new Array<Star>();
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		StarsInSleeve = 0;
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
	
	public function RemoveStars2(count:Int)
	{
		var e = stars.length;
		//trace("Removes: "+count+" from "+e);
		//trace("drawbufs.l: " + Base.drawning.vertices.length + " - " + stars.length);
		
		while (e-->stars.length-count)
		{
		//	trace("e-->"+e);
			stars[e].destroy();
			
		}
	//	trace("Befor: "+ Base.drawning.uvs.length+"("+(Base.drawning.uvs.length/12)+") / "+Base.drawning.colors.length+"("+(Base.drawning.colors.length/24)+") / "+Base.drawning.vertices.length+"("+(Base.drawning.vertices.length/18)+")");
		Base.drawning.uvs.splice((e+1) * 12, count * 12);
		Base.drawning.colors.splice((e+1) *24, count * 24);
		Base.drawning.vertices.splice((e+1) * 18, count * 18);
		Base.drawning2.uvs.splice((e+1) * 12, count * 12);
		Base.drawning2.colors.splice((e+1) *24, count * 24);
		Base.drawning2.vertices.splice((e+1) * 18, count * 18);
	//	trace("After: "+ Base.drawning.uvs.length+"("+(Base.drawning.uvs.length/12)+") / "+Base.drawning.colors.length+"("+(Base.drawning.colors.length/24)+") / "+Base.drawning.vertices.length+"("+(Base.drawning.vertices.length/18)+")");
		/*for (i in e-count-1...count-1){
			stars[i].destroy();
		}*/
		//trace("(" + SeedSleeve+")-->" + (e+1));
		
		stars.splice(e+1, count);
		StarsInSleeve-=count;
		
		trace("drawbufs.l: "+Base.drawning.vertices.length+" - "+stars.length+" / "+StarsInSleeve);
	}
	
	//удаление последней звезды
	function RemoveStar():Void
	{
		var e = stars.length;
		stars[e-1].destroy();
		stars.splice(e-1, 1);
		StarsInSleeve--;
		
		
		//trace("-remove star");
		
		//if (stars[e-1]==null) trace("st - null");
		//trace("stars.length: "+e);
		//trace(e);
		//trace(stars[e-1]);
		
		//while (e-->0)
		//{
			
		//}
		/*stars.splice()
		stars.reverse();
		stars.shift().destroy();
		stars.reverse();*/
		
	//	Star.TotalCount--;
	}
	
	//создание звезды и ее установка в координаты учитывая шансы
	function PastStar( x:Float, y:Float):Void		
	{
		var Chance:Float = Math.abs(Math.sin(x))*XmlControl.StarPrototipe.ChanceCounter;
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				stars.push(new Star(new Vector3(x,y,0), XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize, XmlControl.starPrototypes[i].stLight));
			}
		}
	}
	
	public function update(): Void 
	{
		
		for ( star in  stars)
		{
			star.update();
		} 
	}
	
}