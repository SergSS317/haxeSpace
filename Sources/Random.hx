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
		var rnd = (Seed * Counter * 9301 + 49297) % 233280;
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
		var rnd = (Seed * Counter * 9301.0 + 49297.0) % 233280.0;
		rnd = Math.abs(Math.sin(rnd));
		rnd = MinValue+rnd * (MaxValue-MinValue);
		//var rnd =(Seed * Counter * 9301 + 49297) (Seed * Counter * 9301 + 49297) % 233280;
		//rnd = MinValue+rnd*(MaxValue-MinValue);
		//trace(rnd);
		return rnd;
		
		//this.Seed = (this.Seed * 9301 + 49297) % 233280;
		//return this.Seed / 233280.0;
	}
	
}