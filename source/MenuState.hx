package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSignal.FlxTypedSignal;

class MenuState extends FlxState
{
	var titleScreen:FlxText;
	var playButton:FlxButton;

	override public function create()
	{
		titleScreen = new FlxText(20, 0, 0, "pepum - a puzzle game", 22);
		titleScreen.screenCenter();
		add(titleScreen);

		playButton = new FlxButton(0, 0, "play", clickPlay);
		playButton.x = (FlxG.width / 2) - 10 - playButton.width;
		playButton.y = FlxG.height - playButton.height - 10;
		add(playButton);

		super.create();
	}

	function clickPlay()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new PlayState());
		});
	}
}
