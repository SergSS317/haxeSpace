package;
import kha.math.Vector3;

/**
 * ...
 * @author SergSS
 */
class Random 
{
	static var Seed:Int;
	static var MaxValue:Float;
	static var MinValue:Float;
	static var Counter = 0;
	public static function SetSeed(seed:Int) { Seed = seed; }
	public static function SetMaxValue(maxValue:Float) { MaxValue = maxValue; }
	public static function SetMinValue(minValue:Float) { MinValue = minValue; }
	
	public static function Rnd()
	{
		Counter++;
		var rnd = (Seed * Counter * 123456789 + 987654321) % 1593574862;
		trace(rnd);
		return rnd;
		
		//this.Seed = (this.Seed * 9301 + 49297) % 233280;
		//return this.Seed / 233280.0;
	}
	
	public static function Rnd2(maxValue:Float, minValue:Float, seed:Int)
	{
		SetMaxValue(maxValue);
		SetMinValue(minValue);
		SetSeed(seed);
		
		Counter++;
		var rnd = Math.pow( (12345+Counter), 2) % Seed;//(Seed * Counter * 9301.0 + 49297.0) % 233280.0;
		rnd = Math.abs(Math.sin(rnd));
		rnd = MinValue+rnd * (MaxValue-MinValue);
		return rnd;
	}
	
	private var mCounter:Int = 0;
	public static function RndIter(maxValue:Float, minValue:Float, seed:Int, Iteration:Float)
	{
		var rnd = Math.pow( (12345+Iteration), 2) % seed;		
		rnd = (Math.sin(rnd));
		rnd = minValue+rnd * (maxValue-minValue);
		return rnd;
	}
	
	public static function RndIter2(maxValue:Float, minValue:Float, seed:Int, Iteration:Float)
	{
		var rnd = 0.0;

		if (seed > Iteration){
			rnd = (seed % (Iteration)/(Iteration));
		}else{
			rnd = ( (Iteration )%(seed)/(seed));
		}

		rnd = minValue+rnd * (maxValue-minValue);
		return rnd;
	}
	
	public static function RndIter3(maxValue:Float, minValue:Float, seed:Int, Iteration:Float)
	{
		var rnd = 0.0;
		var rnd = Math.pow( (12345 + Iteration), 2) % seed;
		rnd = (rnd - Math.round(rnd / 12345) * 12345) / 12345;

		rnd = minValue+rnd * (maxValue-minValue);
		return rnd;
	}
	
	public static function RndGaus(maxValue:Float, minValue:Float, seed:Int)
	{
		var const1 = 1.772453851;
		var q:Float = 0.2;
		var m:Float = 0;
		Counter++;
		trace("1: " + 1.0 / (q * const1) + "   : " + Math.pow(Counter - m, 2) + "   : " + (2 * Math.pow(q, 2)));
		trace(Math.exp( -(Math.pow(Counter - m, 2) / (2 * Math.pow(q, 2)))));
		var rnd:Float = 1.0 / (q * const1) * Math.exp( -(Math.pow(Counter - m, 2) / (2 * Math.pow(q, 2))));
		trace(rnd);
		rnd = MinValue+rnd * (MaxValue-MinValue);
		return rnd;
	}
	
	public static function CalcStarPosition(SpeenPower:Float, SpeenRotate:Float, StarsInSleeve:Int, SeedSleeve:Int): Vector3
	{
				//trace("Addstar begin");
		var xStarPosition = 0.0;
		var yStarPosition = 0.0;
		var t = (StarsInSleeve) * 0.00016;//угол поворота(шаг между звездами)0.00008 - 0.00016
		var rnd:Float = RndIter3(0.7/XmlControl.galaxySettings.galaxySleeve, -0.7/XmlControl.galaxySettings.galaxySleeve, SeedSleeve, StarsInSleeve);

		xStarPosition = 10000.0 * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd+t);
		yStarPosition = 10000.0 * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd+t);
		return new Vector3(xStarPosition,yStarPosition,0);
	}
}