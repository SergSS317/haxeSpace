package;

/**
 * ...
 * @author ...
 */
class Sleeve 
{
	var StarCount:Int = 0;//звезд нужно сгенерить
	var SpeenPower:Float = 0;//спин
	var SpeenRotate:Float = 0;//спин
	private var StarsInSlave:Float = 0;//звезд сгенерино
	private var tmpLine:Float = 0;
	private var SeedSleeve:Int;
	
	public function new(starCount:Int, speenPower:Float, speenRotate:Float) 
	{
		//this.StarCount = starCount;
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		StarsInSlave = 0;
		AddStars(starCount);
	}

	public function AddStars( count:Int)
	{
		StarCount+=count;
		for ( i in 0...StarCount)
		{
			AddStar();
		}
	}
	
	function AddStar()
	{
		var xStarPosition = 0.0;
		var yStarPosition = 0.0;
		var t = StarsInSlave * 0.0008;//угол поворота(шаг между звездами)
		var rnd:Float = 0.0;
	
		rnd = Random.RndIter(0.999,0,SeedSleeve,StarsInSlave);
		xStarPosition = 500.0 * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd+t);
		yStarPosition = 500.0 * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd+t);
		StarsInSlave++;
		PastStar( xStarPosition, yStarPosition);
	}
	
	function PastStar( x:Float, y:Float)
	{
		var Chance:Float = Random.Rnd2(Math.floor(XmlControl.StarPrototipe.ChanceCounter), 0, Galaxy.Seed);
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			//trace("StarGen2: "+Chance+"   min:"+XmlControl.starPrototypes[i].stChanceMin+"   max:"+XmlControl.starPrototypes[i].stChanceMax);
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				Base.stars.insert(Base.stars.length, new Star(x, y, XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize,XmlControl.starPrototypes[i].stLight));
			}
			else{
				//trace("Chance: "+Chance);
				//trace('NoChance');
			}
		}
	}
}