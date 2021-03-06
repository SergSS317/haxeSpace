package;
import kha.Assets;
import kha.Blob;
import haxe.xml.Fast;
import kha.Color;
import kha.internal.VoidCallback;


/**
 * ...
 * @author SergSS
 */
import haxe.Resource;

class StarPrototipe
{
	public var stType:Int;
	public var stLight:Float;
	public var stSize:Float;
	public var stColor:Color;
	public var stChanceMax:Float;
	public var stChanceMin:Float;
	public static var ChanceCounter:Float;
	
	public function new( _stType:Int, _stLight:Float, _stSize:Float, _stColor:Color, _stChance:Float){
		this.stType = _stType;
		this.stLight = _stLight;
		this.stSize = _stSize;
		this.stColor=_stColor;
		this.stChanceMin = ChanceCounter;
		ChanceCounter += _stChance;
		this.stChanceMax = ChanceCounter;
		trace("Chanses: " + stChanceMin + " - " + stChanceMax + " type of " + stType+"   _stLight "+_stLight);
	}
}

class GalaxySettings
{
	public var starCount:Int;
	public var galaxySleeve:Int;
	public var speenPower:Float;
	public var Seed:Int;
	public function new(_starCount:Int, _galaxySleeve:Int, _speenPower:Float, _Seed:Int)
	{
		starCount = _starCount;
		galaxySleeve = _galaxySleeve;
		speenPower = _speenPower;
		Seed = _Seed;
	}
}

class XmlControl 
{
	public static var starPrototypes:Array<StarPrototipe>;
	public static var galaxySettings:GalaxySettings;
	
	public function new() 
	{
		starPrototypes = new Array<StarPrototipe>();
		StarPrototipe.ChanceCounter = 0;
		var cont = Assets.blobs.settings_xml.toString();

		var f = new haxe.xml.Fast(Xml.parse(cont));
		var stars = f.node.settings.nodes.star;

		var glx = f.node.settings.node.galaxy;
		galaxySettings = new GalaxySettings(Std.parseInt(glx.att.StarCount),Std.parseInt(glx.att.SleeveCount),Std.parseFloat(glx.att.SpeenPower),Std.parseInt(glx.att.seed));

		for (star in stars)
		{
			starPrototypes.push(new StarPrototipe(	Std.parseInt( star.att.type), 
													Std.parseFloat(star.att.light), 
													Std.parseFloat(star.att.size), 
													Color.fromBytes( Std.parseInt(star.node.color.att.red),Std.parseInt(star.node.color.att.green),Std.parseInt(star.node.color.att.blue),255),
													//Std.parseInt(star.att.chance)));
													Std.parseFloat(star.att.chance)));

		}
	}
}