package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Font;
import kha.Color;
import kha.Assets;

class Button {
  public var x:Int;
  public var y:Int;
  public var width:Int;
  public var height:Int;
  public var color:Color;
  public var font:Font;
  public var fontSize:Int;
  public var onClick:Void->Void;
  public var Text_btn:String;
  
  public function new(x:Int, y:Int, width:Int, height:Int, Text:String="", color:Color=Color.Magenta){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.color = color;
	this.Text_btn = Text;
	font = Assets.fonts.kenpixel_mini_square;
	MouseControl.onMouseButtonDown.push(onMouseDown);
  }

  public function update(){ }

  public function render(g:Graphics){
    g.color = color;
	
    g.fillRect(x, y, width, height);
	
		g.font = font;
		fontSize = 15;
		g.fontSize = fontSize;
		g.color = Color.White;
		g.drawString(Text_btn, x+width/2-(font.width(fontSize,Text_btn))/2 , y+height/2-font.height(fontSize)/2);
		
  }
  
  
  public function onMouseDown(button:Int)
  {
	var xPos = MouseControl.x;
	var yPos = MouseControl.y;
    if (button == 0)
	{
      if (xPos >= this.x && xPos <= this.x + this.width && yPos >= this.y && yPos <= this.y + this.height){
		  
		  if (this.onClick != null){ onClick();}
		  return true;
      }
    }
	return false;
  }
}