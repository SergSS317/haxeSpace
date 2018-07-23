package;

import kha.Color;
import kha.Font;
import kha.graphics2.Graphics;
import kha.Assets;
/**
 * ...
 * @author ...
 */
class TextButton extends Button
{
	public var font:Font;
	public var fontSize:Int;
	public var Text_btn:String;
	public var FontColor:Color;
	public override function new(x:Int, y:Int, width:Int, height:Int, Text:String="", color:Color=Color.Magenta, fontColor:Color=Color.White) 
	{
		super(x,y,width,height,color);
		this.Text_btn = Text;
		font = Assets.fonts.kenpixel_mini_square;
	}
	public override function render(g:Graphics)
	{
		super.render(g);
				g.font = font;
		fontSize = 15;
		g.fontSize = fontSize;
		g.color = Color.White;
		g.drawString(Text_btn, x+width/2-(font.width(fontSize,Text_btn))/2 , y+height/2-font.height(fontSize)/2);
	}
}