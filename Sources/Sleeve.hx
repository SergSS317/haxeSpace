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

	/*public function AddStars( count:Int)
	{
		trace("SeedSleeve: " + SeedSleeve+"   StarsInSlave: " + StarsInSlave);
		for ( i in 0...count)
		{
			AddStar();
		}
		StarCount += count;
	}*/
	
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
	
	//удаление последней звезды
	public function RemoveStar():Void
	{
	//	trace("-remove star");
		var e = stars.length;
		//if (stars[e-1]==null) trace("st - null");
		//trace("stars.length: "+e);
		stars[e].destroy();
		//while (e-->0)
		//{
			stars.splice(e, 1);
		//}
		/*stars.splice()
		stars.reverse();
		stars.shift().destroy();
		stars.reverse();*/

		StarsInSleeve--;
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