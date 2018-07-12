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
	public var AllStars:Array<Star>=new Array<Star>();
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
		this.AllStars = new Array<Star>();
		//Seed = 123456789;
		Seed = 123456789;
		//trace(":::"+Seed);
		//GenerateGalaxy();!!!!!!!!!!!!!!!!!!!1
	}
	
	function GenerateGalaxy()
	{
		for ( i in 1...(GalaxySleeve+1))
		{
			Sleeves.push(new Sleeve(Math.round(StarCount/GalaxySleeve), SpeenPower, (2*Math.PI / GalaxySleeve) * i));
		}
	}
	
	public function AddStars(Count:Int){
		for (sleeve in Sleeves)
		{
			trace("Add "+ Math.round( Count/Sleeves.length)+" stars!");
			sleeve.AddStars(Math.round( Count/Sleeves.length));
		}
	}
	
		public function RemoveStars(Count:Int){
		for (sleeve in Sleeves)
		{
			trace("Remove "+ Math.round( Count/Sleeves.length)+" stars!");
			sleeve.RemoveStars(Math.round( Count/Sleeves.length));
		}
	}
	public function render(g: Graphics): Void {
		for (sleeve in Sleeves)
		{
			sleeve.render(g);
		}
		
	}

	public function update(): Void {
		for ( sleeve in Sleeves)
		{
			sleeve.update();
		}
	}
}