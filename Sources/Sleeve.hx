package;

/**
 * ...
 * @author ...
 */
import kha.graphics4.Graphics;
import kha.Color;
import kha.math.Vector3;
import kha.Assets;
class Sleeve 
{
	var SpeenPower:Float = 0;			//спин
	var SpeenRotate:Float = 0;			//спин
	var StarsInSleeve:Float = 0;		//звезд создано
	var SeedSleeve:Int;					//сид генерации данного рукава
	public var stars: Array<Star>;		//список звезд рукава
	
	public var drawning:Drawning;
	public var drawning2:Drawning;
	
	public function new(starCount:Int, speenPower:Float, speenRotate:Float) 
	{
		stars = new Array<Star>();
		this.SpeenPower = speenPower;
		this.SpeenRotate = speenRotate;
		this.SeedSleeve = Math.round(Galaxy.Seed + speenRotate);
		StarsInSleeve = 0;
		
		drawning = new Drawning(Assets.images.ImgData,90);
		drawning.UdateColor = true;
		drawning.UdateUV = true;
		drawning.UdateVertex = true;
		//drawning.update();
		
		drawning2 = new Drawning(Assets.images.ImgData,90);
		drawning2.UdateColor = true;
		drawning2.UdateUV = true;
		drawning2.UdateVertex = true;
		//drawning2.update();
	}

	public function AddStars( count:Int)
	{
		drawning.CreateNewVertexBufer((stars.length + count)*6);
		drawning2.CreateNewVertexBufer((stars.length + count)*6);
		//trace("Add begin "+stars.length+"+"+count+"*2="+(stars.length + count)*2);
		for ( i in 0...count) { AddStar(); }
		trace("Add in sleeve " + SeedSleeve+" count=" + count + " remain=" + StarsInSleeve+" / " + stars.length);
		//drawning.CreateNewVertexBufer(stars.length+count);
		drawning.UdateColor=true;
		drawning.UdateUV=true;
		drawning.UdateVertex = true;
		
		//trace("Vertex: " + drawning.vertices.length / 18 + "   Uvs: " + drawning.uvs.length / 12 + "   Color: " + drawning.colors.length / 24);
		//trace("Vertex: " + drawning.vertices);
		drawning2.UdateColor=true;
		drawning2.UdateUV=true;
		drawning2.UdateVertex = true;
		
	}
	
	//рассчет позиции звезды с вызовом ее создания
	function AddStar():Void			
	{
		//trace("Addstar begin");
		var xStarPosition = 0.0;
		var yStarPosition = 0.0;
		var t = (StarsInSleeve) * 0.00016;//угол поворота(шаг между звездами)0.00008
		var rnd:Float = 0.0;
	
		rnd = Random.RndIter3(0.45, -0.45, SeedSleeve, StarsInSleeve);
		//rnd = Random.RndIter3(1.04, 0, SeedSleeve, StarsInSleeve);

		xStarPosition = 10000.0 * Math.exp(SpeenPower * t+rnd) * Math.cos(SpeenRotate+rnd+t);
		yStarPosition = 10000.0 * Math.exp(SpeenPower * t+rnd) * Math.sin(SpeenRotate+rnd+t);

		StarsInSleeve++;
		PastStar( xStarPosition, yStarPosition);
		//trace("Addstar end");
	}

	public function RemoveStar2()
	{
		var e = stars.length;
		destroyStarBuf(stars[e-1]);
		//stars[e-1].destroy();
		stars.splice(e-1, 1);
		Star.TotalCount--;
		StarsInSleeve--;
	}
	
	public function destroyStarBuf(_star:Star)
	{
		drawning.uvs.splice(_star.Sprt.id * 12, 12);
		drawning.colors.splice(_star.Sprt.id*24, 24);
		drawning.vertices.splice(_star.Sprt.id * 18, 18);
	//	drawning.FreeId(_star.Sprt.id);
		drawning.IdEntity--;
//trace("destroy -->"+Base.drawning.vertices.length+" - " +Sprt.id);
		drawning2.uvs.splice(_star.SprtFlare.id*12, 12);
		drawning2.colors.splice(_star.SprtFlare.id*24, 24);
		drawning2.vertices.splice(_star.SprtFlare.id * 18, 18);
	//	drawning2.FreeId(_star.SprtFlare.id);
		drawning2.IdEntity--;
	
	}
	
	//создание звезды и ее установка в координаты учитывая шансы
	function PastStar( x:Float, y:Float):Void		
	{
		var Chance:Float = Math.abs(Math.sin(x))*XmlControl.StarPrototipe.ChanceCounter;
		for ( i in 0...XmlControl.starPrototypes.length)
		{
			if (Chance > XmlControl.starPrototypes[i].stChanceMin && Chance < XmlControl.starPrototypes[i].stChanceMax)
			{
				
				stars.push(new Star(new Vector3(x,y,0), XmlControl.starPrototypes[i].stColor, XmlControl.starPrototypes[i].stSize, XmlControl.starPrototypes[i].stLight,drawning,drawning2));
			}
		}
	}
	
	public function update(): Void 
	{
		for ( star in  stars) { star.update(); } 

		drawning.update();
		drawning2.UdateVertex = true;
		drawning2.update();
	}
	
	public function render(g:Graphics)
	{
		if (drawning != null){ drawning.render(g); }
		if (drawning2 != null){ drawning2.render(g); }
	}
}