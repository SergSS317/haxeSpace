package;

/**
 * ...
 * @author SergSS
 */
//import 
import kha.Color;
import kha.graphics4.Graphics;



//import ;
class Galaxy
{
	//public var AllStars:Array<Star>=new Array<Star>();
	public var Sleeves:Array<Sleeve>=new Array<Sleeve>();
	public var StarCount:Int;		//колько нужно сгенерить звезд
	public var GalaxySleeve:Int;	//число необходмых рукавов
	public var SpeenPower:Float;	//сила спина
	public static var Seed:Int;		//зерно мира
	
	public function new(starCount:Int, galaxySleeve:Int, speenPower:Float, _seed:Int)
	{
		this.StarCount = starCount;
		this.GalaxySleeve = galaxySleeve;
		this.SpeenPower = speenPower;
		Seed = _seed;
		GenerateGalaxy();
	}
	
	function GenerateGalaxy():Void
	{
		for ( i in 1...(GalaxySleeve+1))
		{
			Sleeves.push(new Sleeve(Math.round(StarCount/GalaxySleeve), SpeenPower, (2*Math.PI / GalaxySleeve) * i));
		}
		AddStars(StarCount);
	}
	
	public function AddStars(Count:Int):Void
	{
		trace("Add Stars: "+Count);
		for (sleeve in Sleeves)
		{
			sleeve.AddStars(Math.round( Count/Sleeves.length));
		}
	}
	
	public function update(): Void {
		for ( sleeve in Sleeves)
		{
			sleeve.update();
		}
	}
	
	public function render(g:Graphics)
	{
		for ( sleeve in Sleeves)
		{
			sleeve.render(g);
		}
	}
	
	/*public function RemoveStars(Count:Int)
	{
		trace("Remove stars: "+Count);
		Sleeves.reverse();
		
		for (i in 0...Math.round(Count / Sleeves.length))
		{
			for (sleeve in Sleeves)
			{
				sleeve.RemoveStar2();
			} 
		}
		Sleeves.reverse();
	}*/
}