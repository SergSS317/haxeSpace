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
		this.StarCount = starCount;
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		StarsInSlave = 0;
		Generate(StarCount, SpeenPower, SpeenRotate);
	}
	private var RndIter:Int=0;
	function Generate( starCount:Int, speenPower:Float, speenRotate:Float)
	{
		var xStarPosition = 0.0;
		var yStarPosition = 0.0;
		
		var t:Float = 0.0;//угол поворота(частота появления)
		var dt:Float = 0.0008;//шаг приращения угла поворота
		var rnd:Float = 0.0;
		
		for ( i in 0...starCount)
		{
			RndIter++;
			rnd = Random.RndIter(0.999,0,SeedSleeve,RndIter);
			
			xStarPosition = 320.0 * Math.exp(speenPower * t+rnd) * Math.cos(speenRotate+rnd+t);
			yStarPosition = 320.0 * Math.exp(speenPower * t+rnd) * Math.sin(speenRotate+rnd+t);
			t += dt;
			//dt *= 0.99;
			StarsInSlave++;
			
			AddStar( xStarPosition, yStarPosition);
		}
	}
	
	function AddStar( x:Float, y:Float)
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