package;

import kha.Scheduler;
/**
 * ...
 * @author SergSS
 */
class FpsControl 
{
	var previousRealTime:Float=0;
    var realTime:Float=0;
	
	public var FPS:Float=0;
	var fps_temp:Float=0;
	var fps_counter:Int = 0;
	
	public function new() 
	{
		
	}
	
	var timer:Float=0;
	public function update()
	{
		realTime = Scheduler.realTime();
		timer += realTime-previousRealTime;
		if (timer > 0.5) 
		{
			timer -= 0.5;
			FPS = fps_counter*2;
			fps_counter = 0;
			fps_temp = 0;
		}
		
		fps_temp=Math.round( (1.0 / ( realTime - previousRealTime )));
		fps_counter++;
		previousRealTime = realTime;
	}
	
}