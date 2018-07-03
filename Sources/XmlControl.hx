package;
import kha.Assets;
import kha.Blob;
import haxe.xml.Fast;
import kha.Color;
import kha.internal.VoidCallback;
//import Sys;

//import sys.io.File;
//import sys.io.File;

/**
 * ...
 * @author SergSS
 */
//import kha.Assets;
import haxe.Resource;

//enum StarType={Default, BigRed, SmallWhite, Temp1, Temp2};

class StarPrototipe
{
	public var stType:Int;
	public var stLight:Int;
	public var stSize:Float;
	public var stColor:Color;
	//public var stChance:Int;
	public var stChanceMax:Float;
	public var stChanceMin:Float;
	public static var ChanceCounter:Float;
	
	public function new( _stType:Int, _stLight:Int, _stSize:Float, _stColor:Color, _stChance:Float){
		this.stType = _stType;
		this.stLight = _stLight;
		this.stSize = _stSize;
		this.stColor=_stColor;
		this.stChanceMin = ChanceCounter;
		ChanceCounter += _stChance;
		this.stChanceMax = ChanceCounter;
		trace("Chanses: " + stChanceMin + " - " + stChanceMax + " type of " + stType);
	}
}



class XmlControl 
{
	public static var starPrototypes:Array<StarPrototipe>;
	
	
	public function new() 
	{
		starPrototypes = new Array<StarPrototipe>();
		StarPrototipe.ChanceCounter = 0;
		var cont = Assets.blobs.settings_xml.toString();
		//trace(cont);
		var f = new haxe.xml.Fast(Xml.parse(cont));
		var stars = f.node.settings.nodes.star;
		//var tmpColor:Color;
		for (star in stars){
			//trace(star.node.color.att.red+","+star.node.color.att.green+","+star.node.color.att.blue);
			//tmpColor=Color.fromBytes( Std.parseInt(star.node.color.att.red),Std.parseInt(star.node.color.att.green),Std.parseInt(star.node.color.att.blue),255)
			starPrototypes.push(new StarPrototipe(	Std.parseInt( star.att.type), 
													Std.parseInt(star.att.light), 
													Std.parseFloat(star.att.size), 
													Color.fromBytes( Std.parseInt(star.node.color.att.red),Std.parseInt(star.node.color.att.green),Std.parseInt(star.node.color.att.blue),255),
													//Std.parseInt(star.att.chance)));
													Std.parseFloat(star.att.chance)));

		}
		//trace(starPrototypes);
	}
	/*
			trace('type: '+star.att.type);
			trace('light: '+star.att.light);
			trace('chance: '+star.att.chance);
			*/
	
/*
//--------------------------------------------------------
		xml = Xml.parse('<root>Haxe is great!</root>').firstElement();
		trace(xml.firstChild().nodeValue);
//--------------------------------------------------------
		var f = new haxe.xml.Fast(Xml.parse("<user name='Mark'><age>31</age></user>"));
		var user = f.node.user;
		if (user.has.name) {
			trace(user.att.name); // Mark
		}
		if (user.hasNode.age) {
			trace(user.node.age.innerData); // 31
		}
		
	//--------------------------------------------------------
	var fast = new haxe.xml.Fast(Xml.parse("<users>
		<user name='John'/>
		<user name='Andy'/>
		<user name='Dan'/>
		</users>"));

var users = fast.node.users;
for(user in users.nodes.user) {
		trace(user.att.name);
}*/
	
}