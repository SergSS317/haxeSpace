package;

/**
 * ...
 * @author SergSS
 */
//import 
import kha.Color;

//import ;
class Galaxy
{
	public var StarCount:Int;
	public var GalaxySleeve:Int;
	public var SpeenPower:Float;
	public var Seed:Int;
	
	public function new(starCount:Int, galaxySleeve:Int, speenPower:Float, Seed:Int)
	{
		this.StarCount = starCount;
		this.GalaxySleeve = galaxySleeve;
		this.SpeenPower = speenPower;
		this.Seed = 500;
		GenerateGalaxy();
	}
	
	function GenerateStar( x:Float, y:Float)
	{
		var Chance:Float = Random.Rnd2(Math.floor(XmlControl.StarPrototipe.ChanceCounter), 0.0, Seed);
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				Base.stars.insert(Base.stars.length, new Star(x, y, XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize,XmlControl.starPrototypes[i].stLight));
			}
			else{
				//trace('NoChance');
			}
		}
	}
	
	function GenerateSleeve( starCount:Int, speenPower:Float, speenRotate:Float)
	{
		var x = 0.0;
		var y = 0.0;
		var t:Float = 0.5;
		var dt:Float = 0.5;
		var rnd:Float = 0.0;
		for ( i in 0...starCount)
		{
			rnd = Random.Rnd2(1*GalaxySleeve,0,Seed);
			x =  ( 1.0 * Math.exp(speenPower * t) * Math.cos(speenRotate+rnd+t));
			y = 1.0 * Math.exp(speenPower * t) * Math.sin(speenRotate+rnd+t);
			t += dt;
			dt *= 0.99;
			GenerateStar( x, y);
		}
	}

	function GenerateGalaxy()
	{
		for ( i in 1...(GalaxySleeve+1))
		{
			GenerateSleeve( Math.round(StarCount/GalaxySleeve), SpeenPower, (2*Math.PI / GalaxySleeve) * i);
		}
	}

}