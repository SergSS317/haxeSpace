package;

/**
 * ...
 * @author ...
 */
import kha.Framebuffer;
import kha.Image;
import kha.Font;
import kha.Color;

import kha.input.Mouse;

import kha.graphics2.Graphics;
import kha.Assets;
import kha.Scaler;
import kha.Scheduler;
import kha.System;
import kha.math.FastMatrix3;

class UiController 
{
	public var font:Font;

	public var AddStars1000_btn:Button;
	public var AddStars10000_btn:Button;
	var fps:FpsControl;
	public function new() 
	{
		font = Assets.fonts.kenpixel_mini_square;
		fps = new FpsControl();
		
		AddStars10000_btn = new TextButton(10, Std.int(Main.screen.y - 50), 100, 32, "+10k stars");
		AddStars10000_btn.onClick = function(){ Base.galaxy.AddStars(10000); };
		AddStars1000_btn = new TextButton(120, Std.int(Main.screen.y-50), 100, 32, "+1k stars", Color.Blue);
		AddStars1000_btn.onClick = function(){Base.galaxy.AddStars(1000);};
	}
	
	public function update(): Void 
	{

	}

	public function render(g: Graphics): Void 
	{
		fps.update();
		g.transformation = FastMatrix3.scale(1, 1);
		AddStars1000_btn.render(g);
		AddStars10000_btn.render(g);
		
		g.font = font;
		g.fontSize = 15;
		g.color = Color.White;
		g.drawString("Use \"PageUp\", \"PageDown\" or \"+\", \"-\" or mouse scroll for zoom.", 10, 10);
		g.drawString("Use Arrow key or mouse for move camera.", 10, 30);
		g.fontSize = 20;
		g.drawString("Stars count: " + Star.TotalCount+" ;", 10, 70);
		
		g.drawString("FPS: " + fps.FPS + " ;", 10, 90);

		//g.drawString("Zoom: " + Base.camera.zoom + " ;", 10, 110);
		
		
	}
}