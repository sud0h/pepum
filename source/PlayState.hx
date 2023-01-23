package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var player:Player;

	override public function create()
	{
		player = new Player();
		add(player);

		FlxG.camera.follow(player, TOPDOWN, 1);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
