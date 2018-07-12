package;

/**
 * ...
 * @author SergSS
 */
class Core 
{
	public static var AllSprites:Array<Sprite>;
	public function new() 
	{
		AllSprites = new Array<Sprite>();
	}
	
	public function update()
	{
		for (sprite in AllSprites)
		{
			sprite.update();
		}
	}
	
	public function render()
	{
		/*for (sprite in AllSprites)
		{
			
		}*/
	}
}