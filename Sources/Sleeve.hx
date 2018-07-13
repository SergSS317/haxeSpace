package;

/**
 * ...
 * @author ...
 */
import kha.graphics2.Graphics;
import kha.Color;
class Sleeve 
{
	var StarCount:Int = 0;//звезд нужно сгенерить
	var SpeenPower:Float = 0;//спин
	var SpeenRotate:Float = 0;//спин
	private var StarsInSlave:Float = 0;//звезд сгенерино
	private var tmpLine:Float = 0;
	private var SeedSleeve:Int;
	public var stars: Array<Star>;
	
	
	public function new(starCount:Int, speenPower:Float, speenRotate:Float) 
	{
		stars = new Array<Star>();
		//this.StarCount = starCount;
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		StarsInSlave = 0;
		AddStars(starCount);
	}

	public function AddStars( count:Int)
	{
		trace("SeedSleeve: " + SeedSleeve+"   StarsInSlave: " + StarsInSlave);
		for ( i in 0...count)
		{
			AddStar();
		}
		StarCount += count;
	}
	
	function AddStar()
	{
		var xStarPosition = 0.0;
		var yStarPosition = 0.0;
		var t = (StarsInSlave) * 0.00016;//угол поворота(шаг между звездами)0.00008
		var rnd:Float = 0.0;
	
		//rnd = Random.RndIter3(1.04, 0, SeedSleeve, StarsInSlave);
		rnd = Random.RndIter2(0.519, -0.519, SeedSleeve, StarsInSlave);
		//trace(rnd);
		//xStarPosition = StarsInSlave * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd+t);
		//yStarPosition = StarsInSlave * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd+t);
		//xStarPosition = StarsInSlave * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd*rnd+t);
		//yStarPosition = StarsInSlave * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd*rnd+t);
		xStarPosition = 100.0 * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd+t);
		yStarPosition = 100.0 * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd+t);
		
		//last xStarPosition = 5000000000.0 * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd+t);
		//last yStarPosition = 5000000000.0 * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd+t);
		StarsInSlave++;
		PastStar( xStarPosition, yStarPosition);
	}
	
	public function RemoveStars( count:Int)
	{
		for ( i in 0...count)
		{
			RemoveStar();
		}
		StarCount -= count;
	}
	
	function RemoveStar()
	{
		var removedStar = stars[stars.length-1];
		stars.remove(removedStar);
		//Base.galxy.AllStars.remove(removedStar);
		StarsInSlave--;
		Star.TotalCount--;
	}
	
	function PastStar( x:Float, y:Float)
	{
		var Chance:Float = Math.abs(Math.sin(x))*XmlControl.StarPrototipe.ChanceCounter;
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			//trace("Chanses:"+);
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				stars.push(new Star(x, y, XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize, XmlControl.starPrototypes[i].stLight));
			}
			else{
				//trace("NoChance! Chance: "+Chance);
			}
		}
	}
	
	public function update(): Void {
		for ( star in  stars)
		{
			star.update();
		} 
	}
	
}