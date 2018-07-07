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
	public var Sleeves:Array<Sleeve>=new Array<Sleeve>();
	public var StarCount:Int;		//колько нужно сгенерить звезд
	public var GalaxySleeve:Int;	//число необходмых рукавов
	public var SpeenPower:Float;	//сила спина
	public static var Seed:Int;		//зерно мира
	
	public function new(starCount:Int, galaxySleeve:Int, speenPower:Float, seed:Int)
	{
		this.StarCount = starCount;
		this.GalaxySleeve = galaxySleeve;
		this.SpeenPower = speenPower;
		//trace(Seed);
		Seed = 123456789;
		//trace(":::"+Seed);
		GenerateGalaxy();
	}
	/*
	private var StarsInSlave:Float = 0;
	private var tmpLine:Float = 0;
	function GenerateStar( x:Float, y:Float)
	{
		var Chance:Float = Random.Rnd2(Math.floor(XmlControl.StarPrototipe.ChanceCounter), 0, Seed);
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
	
	function GenerateSleeve( starCount:Int, speenPower:Float, speenRotate:Float)
	{
		var x = 0.0;
		var y = 0.0;
		StarsInSlave = 0;
		tmpLine = 0.0;
		var t:Float = 0.0;//угол поворота(частота появления)
		var dt:Float = 0.0008;//шаг приращения угла поворота
		var rnd:Float = 0.0;
		for ( i in 0...starCount)
		{
			rnd = Random.Rnd2(0.999,0,Seed);
			//rnd = Random.RndGaus(1 * GalaxySleeve, 0, Seed);
			x = 320.0 * Math.exp(speenPower * t+rnd) * Math.cos(speenRotate+rnd+t);
			y = 320.0 * Math.exp(speenPower * t+rnd) * Math.sin(speenRotate+rnd+t);
			t += dt;
			//dt *= 0.99;
			StarsInSlave++;
			tmpLine = StarsInSlave / starCount*XmlControl.StarPrototipe.ChanceCounter;
			GenerateStar( x, y);
		}
	}
*/
	function GenerateGalaxy()
	{
		for ( i in 1...(GalaxySleeve+1))
		{
			Sleeves.push(new Sleeve(Math.round(StarCount/GalaxySleeve), SpeenPower, (2*Math.PI / GalaxySleeve) * i));
			//GenerateSleeve( Math.round(StarCount/GalaxySleeve), SpeenPower, (2*Math.PI / GalaxySleeve) * i);
		}
	}

}