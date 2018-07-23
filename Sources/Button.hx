package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

import kha.Color;


class Button {
  public var x:Int;
  public var y:Int;
  public var width:Int;
  public var height:Int;
  public var color:Color;
  
  public var onClick:Void->Void;
  
  
  public function new(x:Int, y:Int, width:Int, height:Int, color:Color=Color.Magenta){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.color = color;
	MouseControl.onMouseButtonDown.push(onMouseDown);
  }

  public function update(){ }

  public function render(g:Graphics){
    g.color = color;
    g.fillRect(x, y, width, height);
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