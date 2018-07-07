package;

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
		//var rnd = (Seed * Counter * 9301.0 + 49297.0) % 233280.0;
		rnd = Math.abs(Math.sin(rnd));
		rnd = MinValue+rnd * (MaxValue-MinValue);
		//var rnd =(Seed * Counter * 9301 + 49297) (Seed * Counter * 9301 + 49297) % 233280;
		//rnd = MinValue+rnd*(MaxValue-MinValue);
		//trace(rnd);
		return rnd;
		
		//this.Seed = (this.Seed * 9301 + 49297) % 233280;
		//return this.Seed / 233280.0;
	}
	
	private var mCounter:Int = 0;
	public static function RndIter(maxValue:Float, minValue:Float, seed:Int, Iteration:Float)
	{
		var rnd = Math.pow( (12345+Iteration), 2) % seed;		
		rnd = Math.abs(Math.sin(rnd));
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
}